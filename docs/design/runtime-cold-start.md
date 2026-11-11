# Local engine cold start: measurement, optimization and architecture options

> 2026-10-27. Question: why is the DSH cold start slow, can it be optimized, and how do reference projects like dsh-mobile avoid being slow.
> Basis: staged measurements on an emulator (x86_64, Android 15, KVM, 2 GB), host machine strace / CPU profiles, and the source (read-only) of reference projects such as `kelai141/dsh-mobile-apk@64098a2` (MIT). The raw data and scripts are not checked in.
> This document is a measurement snapshot from 2026-10-27; the architecture-level changes in §5 were only plans at the time of writing. Route A was later implemented as "direct launch" (`app/android/.../runtime/DirectLaunch.kt`), but it is off by default and must be turned on manually: on some models (Android 16, x86_64) the system's seccomp filter kills glibc's loader. The gain figures in this document are measurements of that time and don't represent the performance of the current default launch method.

## 0. Conclusion

| Question | Conclusion |
|---|---|
| Where it's slow | **DSH's own startup (Node loading plugins) is amplified under proot, taking about two thirds of the cold start.** Same emulator, same rootfs: under proot DSH takes about 1.93 s from process start to printing the login address, while running the same Node bypassing proot takes only 1.07 s — proot makes this segment 80% slower. The cause isn't Node itself, but that at startup DSH makes about 28,000 path-class system calls (stat / open / readlink / access), each of which proot must intercept and translate the path for (§2) |
| The other quarter or so | Serial waits on the app side: after Flutter is up, settings are read and the first frame is drawn, only then is the engine started (about 0.5 s); and from engine ready to the app's first request there is another about 0.25 s (on the Dart side, cause to be investigated, §6) |
| Why the reference project is fast | `kelai141/dsh-mobile-apk` runs a Termux-compiled bionic Node directly, **with no proot**; it also auto-starts at boot and stays resident, so when the user opens the app the engine is mostly already running. Its own docs say the engine cold start on a real device is "on the order of 10 s", so much of the "not slow" is the perception brought by keep-alive (§4) |
| What was done this time | Two low-risk optimizations, which on the emulator reduced "tap the icon → get the chat list" from 3.02 s to 2.46 s (-18%): ① when the app opens, the native layer starts the engine directly, in parallel with Flutter startup (app side 490 ms → 160 ms); ② `dsh web` startup path caching, reducing DSH's startup path-class system calls by about 40%, the engine segment warm -14%, cold -12%. The runtime goes to r9 accordingly (§3) |
| Tried but not adopted | Node compile cache (`NODE_COMPILE_CACHE`): 6% slower under proot on the emulator, and 4% slower without proot; dropping one exec of the shim: no difference; changing proot arguments: removing `-0` is 11% faster but would break apt / file ownership, so it can't be removed (§3.4) |
| To get close to the reference project | Only an architecture-level change: DSH's main process no longer goes through proot. It's recommended to first do a "glibc direct run" experiment — the Ubuntu rootfs unchanged, the DSH main process started directly with the glibc in the rootfs, tool commands still going into proot. On the emulator the DSH startup segment saves about another 35% over r9, and web mode loading and session reads/writes get faster too; the cost is changes in three places: path mapping, DNS and child processes, see §5 |

## 1. Measurement method

One cold start is split into adjacent time boundaries, with the segments obtained by subtraction:

| Segment | Start → end | Data source |
|---|---|---|
| Process | Launch issued → app process fork | `/proc/<pid>/stat` starttime (10 ms precision) |
| App side | App process → proot process fork | Same |
| exec chain | proot → Node process start | Node `performance.timeOrigin` |
| DSH startup | Node start → HTTP port listening | A preload probe (`--import`) hooked onto `http.Server` |
| Address line | Listening → printing `dsh web: …?token=` | Same, hooked onto `process.stdout.write` |
| Ready → login | Address line → the app's first request (`GET /?token`) | Same, recording each request's arrival time |
| First list | Login → `POST /api/session/list` returns | Same |

On the app side, inotify also timestamps each append to `dsh.log`, confirming that Kotlin takes only about 10 ms from reading the address line to issuing RUNNING.

Two kinds of cold: **warm** (page cache present, the most common "open the app") and **cold** (after `drop_caches`, close to the first time after boot). Each group takes the median of 3–5 runs. The emulator is KVM-accelerated x86_64 with single-core speed close to a desktop; absolute values on a real ARM device will be much larger, and the **ratios** are more useful as reference (§6).

The object under test: the installed app on the emulator (0.9.0, x86_64) + the rootfs replaced with the r8 diff files (DSH 0.2.1-rc.2, Node 24.22.1, dsh-go-bridge 0.4.0). The DSH home directory is nearly empty (one chat, no third-party plugins).

## 2. Measurements and the big item

### 2.1 End to end (app level, warm, run in turns within the same boot, median)

"Early start" was simulated at test time by issuing `am start-foreground-service` and `am start` together (consistent with the timing of the code in §3.1); "path cache" used the same shim and `boot-cache.mjs` as r9.

| Segment | Current | Early start | Early start + path cache |
|---|---|---|---|
| Tap icon → app process | 20 ms | 20 ms | 15 ms |
| App process → proot up (Flutter init, read settings, first frame, start service, prepare guest files) | **490 ms** | 160 ms | 180 ms |
| proot → Node process (the exec chain env → sh → shim → node) | 20 ms | 28 ms | 61 ms |
| Node bootstrap to the DSH entry | 70 ms | 54 ms | 52 ms |
| **DSH loads plugins → HTTP listening** | **2,017 ms** | 2,020 ms | 1,796 ms |
| Listening → printing the address line | 88 ms | 85 ms | 88 ms |
| Address line → the app's first request (Kotlin side takes only about 10 ms) | **265 ms** | 247 ms | 247 ms |
| Login → first `session/list` returns | 24 ms | 24 ms | 23 ms |
| **Total: tap icon → chat list** | **3,016 ms** | 2,638 ms | **2,462 ms** |

Samples: current 3 runs (3,191 / 3,016 / 2,999), another boot 2 runs (3,197 / 3,026); early start 2 + 2 runs; early start + path cache 2 runs. The emulator crashes randomly when the app renders (a gfxstream GL context problem unrelated to this project), so app-level samples are few, and the engine segment uses the multi-sample data in §2.2 instead.

### 2.2 Engine only (proot up → address line, without the app UI, median)

| Way of running | warm | cold (drop_caches) | Runs |
|---|---|---|---|
| Current (r8 startup command) | 1,925 ms | 2,270 ms | 6 / 4 |
| **+ startup path cache (r9)** | **1,662 ms (-14%)** | **2,000 ms (-12%)** | 6 / 4 |
| Without proot (the same Node, the same rootfs, started directly with the rootfs's ld.so) | 1,072 ms (-44%) | 1,349 ms (-41%) | 5 / 4 |

The current warm figure was 1,987 ms (10 runs) on another boot, of the same order of magnitude.

### 2.3 Why it's proot × DSH startup

On the host (bwrap, not through proot), strace of one `dsh web` start up to the address line:

| System call | Count | Of which failed |
|---|---|---|
| statx | 17,598 | 5,168 (ENOENT) |
| openat | 4,211 | 466 |
| readlink | 3,601 | 3,587 (EINVAL, not a link) |
| access | 2,722 | 1,600 |
| Total (path-class) | about 28,100 | |

proot in seccomp mode intercepts only system calls with paths, but those are exactly the bulk of DSH startup. Converting by "1.07 s without proot / 1.93 s with proot", each intercepted call costs about 30 µs on the emulator; on ARM phones a ptrace round trip is more expensive.

Where the calls come from (user-space fs calls classified by caller, with Node's internal module resolution counted separately):

| Caller | Call | Count |
|---|---|---|
| `@deepseek-ai/dsh-app-boot` `packageDirFromAnchor` | `existsSync`, probing `node_modules/<pkg>/package.json` level by level | 1,560 |
| Same `canonicalPath` / `wrappedFilename` | `realpathSync` (JS implementation, lstat segment by segment each time, no cache) | 1,651 |
| Same `realModuleDirectory` | `realpathSync.native` (glibc realpath, readlink segment by segment) | 541 |
| Same `getDshRuntimeVersion` / `readPackageManifest` / `readManifest` | The same batch of package.json files read repeatedly | 1,074 |
| Node ESM / CJS resolver | stat probes, realpath (cached) | The rest |

That is, DSH's plugin loader repeatedly canonicalizes and probes the read-only `/opt/dsh` package tree at startup; all file-system calls together take under 0.3 s on the host, amplified under proot to seconds.

### 2.4 Directions ruled out

- **Network**: there is no `connect()` between startup and the address line (host strace), and startup time is the same offline and online.
- **exec chain**: proot → env → sh → shim → node totals 15–25 ms.
- **seccomp acceleration**: already in effect (`PROOT_NO_SECCOMP=1` is instead 13% slower). Note that `PROOT_NO_SECCOMP=0` can't be set, since the variable existing turns acceleration off.

## 3. The optimizations done this time

### 3.1 Start the engine when the app opens (Kotlin)

At the start of `MainActivity.onCreate`, `runtime/LaunchStart.kt` is called: under the same conditions as RootGate ("Start automatically when opening the app" on, the runtime environment installed and idle, no failure card waiting on the user), it calls `RuntimeController.start(...)` directly, with parameters exactly the same as the Dart side's `runtime_state.dart start()` (no env, mode unchanged, phoneStorage / visualReplies reading the same shared_preferences). It is done only once per process. After that, RootGate's own start() finds the engine already starting and changes nothing.

The only behavioral difference from before: for someone who hasn't entered a key and hasn't chosen "Set up later", when opening the app the engine starts in the background behind the key page — consistent with the flow after first install (`_afterRuntime` starts the engine first and then goes to the key page).

### 3.2 `dsh web` startup path cache (runtime r9)

`runtime/boot/boot-cache.mjs`, installed at `/opt/dsh-go/boot-cache.mjs`, preloaded with `--import` by the `/usr/local/bin/dsh` shim only for `dsh web` (safe mode, commands like `dsh plugin` don't load it; `DSH_GO_BOOT_CACHE=0` turns it off).

- It manages only three read-only directories: `/opt/dsh/`, `/opt/node/`, `/opt/dsh-go/`. Nobody writes them while DSH runs (runtime upgrades replace them only while DSH is stopped), and `/opt/dsh-app/`, which the app writes, isn't included. With direct launch there is no proot path mapping, so these three directories take the physical rootfs prefix provided by the Direct preload.
- It takes over only four calls: `realpathSync`, `realpathSync.native`, `existsSync`, and the utf8 read of `package.json`. Paths are cached "with one lstat per path component", and missing directories are remembered too, so the same package tree is touched only once.
- Results are identical item by item with node:fs: symbolic links (including directory links in the middle of a path, such as pnpm's `.pnpm` links) are followed only when the target lands inside the three directories and the original native and JS realpath give the same result, each link verified only once; other shapes (including `.` / `..` components or relative paths, pointing outside the three directories, dangling or circular links, trailing slashes, non-string arguments, non-utf8 encodings) are all handed back to node:fs. Error codes and error paths are also constructed by node:fs rules (JS realpath reports the first missing component / lstat, native reports the original path / realpath).
- It unloads itself automatically when DSH prints the address line (or the 120 s fallback), after which everything passes straight through to node:fs; function references taken by other modules during startup also pass straight through.
- A failure of the preload itself only makes DSH fall back to startup without the cache, and never blocks startup.

The unit tests `runtime/tests/boot-cache.test.mjs` (14 items) compare against node:fs shape by shape, check cache hits, unloading and taking effect only for `web`, and Direct's physical prefix.

### 3.3 Startup segment log

`RuntimeController` writes one more line when the engine is ready: `[dsh-app] startup: app … ms, prepare … ms, dsh … ms` (`runtime/StartupTimeline.kt`): the app process up to initiating startup, Kotlin preparing guest files, and the proot process to listening. The diagnostics package from a real device can then show each segment directly, without hooking up measurement again.

### 3.4 Tried and not kept

All measured on the same emulator, engine segment warm median, current 1,987 ms:

| Attempt | Result | Conclusion |
|---|---|---|
| `NODE_COMPILE_CACHE` (Node 24 module compile cache, which the reference project enables) | 2,109 ms under proot (+6%); 1,113 vs 1,072 ms without proot (+4%) | Not kept. Each module costs an extra open and read of a cache file, which proot must intercept; V8 compiles lazily anyway, and the savings don't pay for it. On ARM real devices compilation is slower and this might flip, listed in §6 |
| The startup command execs node directly, skipping the `/usr/local/bin/dsh` shim | 1,998 ms (±0) | Not kept. The exec chain totals only 15–25 ms; and the app's Kotlin side relies on the string `/usr/local/bin/dsh web` to insert --patch and switch safe mode, so changing it touches 5 files |
| Turn off seccomp (`PROOT_NO_SECCOMP=1`) | 2,236 ms (+13%) | Proves acceleration is in effect; keep as is |
| Remove `-0` (fake root) | 1,765 ms (-11%) | Can't be removed: apt / dpkg / ownership depend on it |
| Remove `--link2symlink` | 1,956 ms (-1%) | Negligible gain, and pnpm / dpkg hard links still rely on it |
| Cache only by whole path (not by component) | 1,859 ms (-6%) | Superseded by the current per-component cache (-14%) |
| Module resolution result cache (`module.registerHooks` resolve hook) | 18% hit rate, only about 700 fewer system calls | Not kept: the same package referenced from different directories has different cache keys, the gain is small, and the hook itself has overhead |


## 4. Comparison with reference projects

| Project | Local engine | Launch chain | Cold-start-related practices |
|---|---|---|---|
| **kelai141/dsh-mobile-apk** (MIT; components inside the runtime snapshot have other licenses such as GPL/LGPL/MPL/Apache) | Yes | A Termux snapshot (`usr/` + `home/`) is extracted to `files/`, and `ProcessBuilder(files/usr/bin/node --expose-internals …/dsh web)` starts bionic Node directly; when exec is denied (Android 15+/16) it falls back to `/system/bin/linker64 <node>`, with child processes redirected to linker64 via `LD_PRELOAD` termux-exec; targetSdk 34 | `NODE_COMPILE_CACHE` is put in `home/.dsh/.node-compile-cache`; `UV_THREADPOOL_SIZE=min(8, cores)`; `--max-old-space-size` by memory; pre-launch steps timed one by one; start at boot (BootReceiver) + foreground service + a watchdog to stay resident; a batch of startup patches to DSH (such as merging duplicate composes during startup). Its contribution docs state on site that "engine cold start is on the order of 10 s" (`docs/contrib/kelai141/2026-10-23-locale-follow-system-487.md`) |
| saya-ch/dsh-mobile (Apache-2.0) | No | The phone connects to DSH on a computer | Doesn't involve local cold start |
| hongshuxifan321/dsh-mobile-app (MIT) | No | Remote client | Same |

The difference comes down to two points:

1. **Not going through proot.** This is the only structural difference in the DSH startup segment, and our measurement quantifies it as "same machine 1.93 s → 1.07 s".
2. **A resident engine.** They start at boot and keep alive, so when the user "opens the app" the engine is mostly already running and what they see is only the WebView loading. Our engine also uses a foreground service to stay alive, but doesn't auto-start at boot. Whether to auto-start at boot is a product trade-off (battery, vendor background policies), outside this scope, and listed in §6.

They have the compile cache on, but in our measurements it brings no gain (§3.4). Their bionic route also replaces the whole userland (no Ubuntu / apt, tools coming from Termux packages), a much bigger product change than "removing proot".

## 5. Architecture-level plans (plans at the time of writing)

### 5.1 How big the gain is (data)

Same emulator, same r8 rootfs, same DSH home directory, `dsh web` from process start to the address line (warm, median):

| Way of running | Time | Relative to current |
|---|---|---|
| Current: proot (seccomp on) | 1.93 s | — |
| Current + startup path cache (r9) | 1.66 s | -14% |
| Without proot: the rootfs's ld.so starts the same Node directly | 1.07 s | -44% |
| Host desktop x86 without proot (reference) | 0.88 s | |

What remains of the DSH startup segment after removing proot is Node's own module loading and plugin composition, which the reference project pays equally. On a real device the ptrace round trip is more expensive than on the KVM emulator, so proot's share can only be higher, so -44% is a lower-bound estimate; but Node itself is also slow on ARM, so **absolute values must be measured on a real device**.

It's not just startup: every file access while the engine runs also goes through proot, including the hundreds of front-end files DSH sends to the WebView in web mode, reading and writing session jsonl, and plugin hot loading. Removing proot helps all of these too (not measured, listed in §6).

### 5.2 Three routes

| | A. glibc direct run (recommended to experiment first) | B. Termux bionic (the reference project's route) | C. Stay in proot, keep trimming calls |
|---|---|---|---|
| How | The Ubuntu rootfs is unchanged. The DSH main process doesn't enter proot: at install time the ELF interpreter of `/opt/node/bin/node` is changed to the absolute path of the ld.so inside the rootfs (patchelf or similar, with RPATH pointing to the rootfs's lib), and the app execs directly. The agent's bash / git / python / apt still run in proot | Replace the whole userland: Termux-compiled node, bash, git, python; DSH installed under the Termux prefix | Submit a PR upstream to dsh-app-boot to cache realpath / package directories; extend the local cache to the plugin directory (validated by mtime) |
| DSH startup segment | About -44% (measured on the emulator, expected more on real devices) | Same order of magnitude (also without ptrace) | Another 10–20% saved (estimate) |
| User-visible change | None (the paths and tools the agent sees are unchanged, provided the path mapping in 5.3 is done well) | Large: no longer Ubuntu, no apt; AGENTS.md, teaching skills and user habits all need to change | None |
| Effort | Medium: 2–3 person-weeks (including experiments and rollback) | Large: 4–6 person-weeks and up, plus long-term maintenance of a snapshot | Small: a few days |
| Main risk | Path mapping, DNS, child processes (5.3) | Native extensions (node-pty, koffi, sqlite) need bionic builds; multi-license distribution; Android 15+/16's exec limits must be bypassed via linker64 | A low ceiling on gains; depends on upstream accepting |

Recommended order: C's upstream PR can be done any time; A is made into a switchable experimental runtime and measured on real devices before deciding; B isn't recommended — A can get its gains too, at the cost of replacing the whole environment the product promises.

### 5.3 Risks and countermeasures of route A

| Risk | Explanation | Countermeasure |
|---|---|---|
| Two sets of paths | DSH, outside proot, sees `/data/user/0/<package>/files/runtime/rootfs/root/...`; tools, inside proot, see `/root/...`. Session cwd, workspace paths, `@` file references and paths in tool output would all mismatch | Add a same-name bind in proot (`-b <rootfs>/root:<rootfs>/root`) so the long path holds in the guest too, with DSH using the long path throughout; or do bidirectional path rewriting in DSH's subprocess plugin. The former is simple but the agent would see long paths and AGENTS.md needs rewriting; a prototype is needed first for comparison |
| DNS | glibc's getaddrinfo reads `/etc/resolv.conf`, which the Android root doesn't have, so resolution would fail on direct run | In the preload replace `dns.lookup` with c-ares (`dns.Resolver`, servers taken from the rootfs `etc/resolv.conf` the app already wrote), and use Node's bundled CAs for HTTPS certificates |
| Child processes | DSH itself starts: pnpm (plugin install), node-pty terminals (`/bin/bash`), ripgrep (file search), git (workspace changes), and `process.execPath` child nodes | After node's interpreter is changed `process.execPath` works as usual; bash / git / python are always started via proot (give DSH a SHELL wrapper script: `libproot.so … /bin/bash "$@"`); glibc tools like ripgrep likewise get their interpreter changed and run directly |
| exec limits | Running ELFs in the rootfs directly depends on targetSdk 28 (`app_data_file` executable); it's already 28 now, and proot relies on it too | Keep 28. If targetSdk must be raised in future, A, B and proot would all have to go via linker64 / jniLibs, to be handled together then |
| Phone control relay | The relay and the app communicate over a 127.0.0.1 port, unrelated to proot; the overlay files PhoneGuest writes into the rootfs can be referenced by the long path | Regress the whole PhoneGuest / relay test set |
| Plugin compatibility | Plugins are installed in `~/.dsh/profiles/web/node_modules` (pnpm layout, symbolic links), resolved by real path outside proot | pnpm hard links are unusable in the Android app directory and degrade to copies (under proot this relies on `--link2symlink` now); pnpm's fallback and disk use need verification |
| Safe mode / LKG / crash classification | Process management changes from "kill proot" to "kill node" | `DshProcess`'s stop / killStrays handle two kinds of process; `CrashClassifier` adds the exit signatures of glibc direct run |

### 5.4 Migration steps (if A is pursued)

1. **Prototype** (2–3 days): leave the r9 rootfs alone, add a developer switch so that `DshProcess` runs `dsh web` directly with the "interpreter-changed node", with tools still going through proot. Run the same set of measurements as §1 of this document on the emulator and a real device, plus the web-mode first screen and one conversation round with tool calls.
2. **Finalize the path plan**: same-name bind vs bidirectional rewriting, comparing agent experience and amount of change.
3. **Fill in the rest**: DNS preload, SHELL wrapper, pnpm fallback, process management, crash classification; the full runtime test suite (add a direct-run section to `test-host.sh`).
4. **Gradual rollout**: on by default in the internal beta channel, keeping a "start in compatible mode" switch (back to proot), and promoted to official after a release cycle with no regression. User data isn't migrated (the DSH home location is unchanged), and rolling back is just changing the launch method.

## 6. Needs real-device verification

The emulator is x86_64 on KVM with single-core speed close to a desktop and cheap ptrace round trips; the following can only be settled on ARM real devices. After the new package is installed, each time the engine is ready the run log gets one line `[dsh-app] startup: app … ms, prepare … ms, dsh … ms` (§3.3), directly readable in the diagnostics package.

1. **End-to-end segments**: on the same phone, 5 runs each: warm (swipe the app away and reopen) and cold (the first open after restarting the phone); comparing 0.9.3 (r8, no early start) with the new package (r9 + early start).
2. **How early start behaves on vendor systems**: whether `startForegroundService` at Activity creation is intercepted on models like vivo, whether the notification is normal, and whether there is an ANR.
3. **About 250 ms from the address line to the first request**: Kotlin accounts for only 10 ms, and the rest is on the Dart side (event channel → Riverpod rebuild → `DshClient.connect`), needing a profile build with a timeline to locate. In the current code, as soon as the engine becomes RUNNING, the skill auto-install (`ui_skill.dart`, with synchronous file reads and writes on the UI isolate) starts working at the same time, one suspect; 0.9.0 had 250 ms without this code, so it isn't the only cause.
4. **Users who entered a key**: `connection_state.dart` awaits `_pushKey` before publishing the connection (one RPC, DSH writing the credentials file inside proot), and the chat list has to wait for it. It wasn't measured on the emulator since no key was entered.
5. **After the home directory grows**: the emulator's DSH home directory is nearly empty. How startup time grows with third-party plugins and hundreds of chats installed; the path cache currently covers only the read-only trees under `/opt`, and the plugin directory (`~/.dsh/profiles/*/node_modules`, pnpm layout) is not included.
6. **Compile cache**: no gain on the emulator, and compilation costs more on ARM, so an A/B on real devices is worth redoing.
7. **Route A prototype**: how much the DSH startup segment and the web-mode first screen can save on real devices, before deciding whether to push on.
8. **Whether to auto-start at boot**: much of the reference project's "not slow" perception comes from auto-start at boot + staying resident. Ours doesn't auto-start at boot; whether to add it (battery, vendor background policies) is a product decision.
