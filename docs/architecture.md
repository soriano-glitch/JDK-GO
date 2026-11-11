# dsh-app architecture

> Implementation conventions finalized on 2026-10-23. The code has been extended since (plugins, remote, phone control, etc.); for details, the current source is authoritative.

## Tech stack

| Layer | Choice | Rationale |
|---|---|---|
| UI | Flutter 3.47 (Dart 3.13) + Riverpod 3 | The glass look (`BackdropFilter`) behaves consistently across ROMs; PiPilot's (MIT) chat components can be ported directly; there is a path to iOS / OpenHarmony later |
| Native layer | Kotlin (as a Flutter plugin, written inside the app) | Extracting the runtime, managing the proot process, the foreground service |
| DSH client | Pure-Dart package `packages/dsh_client` | No Flutter dependency, unit-testable; shared by local and remote |
| Local runtime | Ubuntu 24.04 base + Node + `@deepseek-ai/dsh`, run via proot | Bundled with the app; no root, no Termux |

## Directories

```
dsh-app/
  app/                         Flutter app (package name dsh_app)
    lib/
      main.dart / app.dart     Entry point, theme, routing
      runtime/                 Dart side of the native runtime (platform channel + Riverpod state)
      state/                   App state: endpoints, sessions, chat, settings
      ui/
        theme/  common/        Design system
        shell/                 Shell: drawer + navigation
        onboarding/            First-run setup: choose where to run → this phone (install the runtime → sign in to DeepSeek or enter an API key) / remote host
        chat/                  Chat page and components (ported from PiPilot)
        sessions/              Session drawer
        settings/              Settings
        engine/                Engine status and logs
        web/                   WebView fallback to the official DSH Web
        remote/                Remote
    android/app/src/main/kotlin/io/github/ccch1mneyyy/dsh_app/
      MainActivity.kt
      runtime/                 RuntimeInstaller / DshProcess / DshService / RuntimePlugin
  packages/dsh_client/         Pure-Dart DSH Web API client
  runtime/                     Runtime packaging scripts and artifacts (out/<abi>/…)
  tooling/                     Toolchain install scripts, env.sh
  docs/
```

## Platform channel conventions (Dart ↔ Kotlin)

MethodChannel `dsh/runtime`:

| Method | Arguments | Returns |
|---|---|---|
| `getStatus` | — | `RuntimeStatus` map (see below) |
| `install` | — | `null`; progress is pushed via the event stream; completes immediately if already installed with the same version |
| `start` | `{env: Map<String,String>}` (e.g. `DEEPSEEK_API_KEY`) | `null`; starts the foreground service and process |
| `stop` | — | `null` |
| `getLogs` | `{lines: int}` | `List<String>` |
| `getLogSnapshot` | `{lines: int}` (default 300, max 2000) | `{entries: [LogEntry], throughSeq: int}`: the last few lines in memory; `throughSeq` is the highest sequence number received at that same moment |
| `reset` | — | `null`; deletes the extracted runtime (keeping `/root` user data needs separate confirmation) |

`RuntimeStatus`:
```
{
  abi: "arm64-v8a" | "x86_64",
  bundledVersion: String,        // runtime version inside the APK (manifest.json)
  installedVersion: String?,     // extracted version
  phase: "notInstalled" | "installing" | "installed" | "starting" | "running" | "stopping" | "error",
  baseUrl: String?,              // e.g. http://127.0.0.1:3080
  token: String?,                // dsh web startup token
  error: String?
}
```

EventChannel `dsh/runtime/events`, event maps:
- `{type: "progress", step: "extract"|"verify"|"configure", done: int, total: int}`
- `{type: "status", status: RuntimeStatus}`
- `{type: "logs", entries: [LogEntry]}`: logs come in batches about every 100 ms; `LogEntry` is `{seq: int, line: String, stream: "stdout"|"stderr"|"system"}`, `line` is already redacted, and `seq` increases within the process and is not reset by restarting the engine or resetting. The app subscribes first and then takes the snapshot, accepting only batches with `seq > throughSeq`, so batches and the snapshot neither overlap nor miss lines.

## Packaging

- Gradle product flavor `abi`: `arm64` (real devices), `x64` (emulator testing). Each flavor carries only its own `runtime/out/<abi>/` assets and jniLibs and sets the matching `abiFilters`; the Flutter plugin's default all-architecture filter is turned off by `disable-abi-filtering` in `gradle.properties`, and `tooling/release_assets.py` rejects packages containing other architectures.
- Build: `tooling/build-apk.sh` (release arm64 by default, `-f x64` / `-f all`). The script generates versionCode from the build time; see "Build numbers" in `docs/release.md`.
- Executables such as proot are placed in jniLibs as `lib*.so`, and `useLegacyPackaging = true` makes them extract to `nativeLibraryDir` (executable).
- `targetSdk = 28` (same as Termux), avoiding Android 10+'s restriction on `exec` in app-private directories; raising it will be re-evaluated before store release.
- Maven / Gradle / pub use mirrors in mainland China (Alibaba Cloud, Tencent Cloud, flutter-io.cn).

## Persistent system and engine updates

- Activating a whole rootfs is allowed only on first install or a reset explicitly confirmed by the user. Ordinary updates don't replace the rootfs; they replace only the exact engine paths fixed by both the packager and the Android installer, and must never widen to all of /usr, /usr/local or /opt.
- The manifest and the runtime.json inside the archive share upgrade metadata. The baseId is computed from the ABI, the original Ubuntu archive, extra debs and Python inputs, and does not include DSH/Node/bridge/patches or build time. Python is kept along with the user's pip packages and is not replaced as an engine directory.
- When an old runtime has no upgrade metadata, it is adopted after checking its ABI, Ubuntu version, system release identifier and Python binary; from then on a matching baseId is required. A changed base identity, an unknown manifest and an interrupted old-version state all return a runtime_upgrade_blocked error, with no destructive fallback. This compatibility gate is not a compatibility guarantee for dynamic libraries the user modified or third-party native extensions.
- Before upgrading, confirm the engine and any leftover processes have stopped. The new payload is first written to engine.prepare, then published as engine.upgrade; the old engine is kept temporarily in that transaction. Paths are renamed exactly, rootfs.version is committed atomically after a data barrier, and finally the transaction is renamed to engine.done before cleanup. Startup must never treat an unfinished transaction as a runnable version; a retry must first recover the transaction, then clean up staging.
- The runtime assets must be rebuilt so that both the archive and the manifest carry the new contract; rebuilding only the Flutter APK while reusing the old runtime/out cannot enable layered upgrades. Old assets that encounter an existing environment stop safely instead of overwriting the whole root.
- When incompatible, the original system is kept in the app's private directory. This implementation does not migrate the base system automatically, nor does it provide a one-tap full-environment backup; before migrating or resetting, export the complete environment offline, preserving modes, symlinks and the package database, and verify the backup — a diagnostics ZIP is no substitute.

## Local connection

1. The native layer starts `dsh web --host 127.0.0.1 --port 3080 --no-open` and parses the token from stdout.
2. On the Dart side, `dsh_client` exchanges the token for a cookie; after that every HTTP / WebSocket request carries the cookie and no `Origin`.
3. The WebView fallback opens `http://127.0.0.1:3080/?token=…` directly.

## Details

- Runtime extraction and the specific proot arguments: the runtime code in `runtime/` and `app/android/`
- API details: `packages/dsh_client/`
- Remote connection methods: `packages/dsh_remote/`
- Design specs: `docs/design/`
