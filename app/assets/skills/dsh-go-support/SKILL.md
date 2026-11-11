---
# dsh-go:managed — the dsh-go app keeps this skill up to date; delete this line to keep your own edits.
name: dsh-go-support
description: Troubleshooting and feedback for the dsh-go phone app: read the local diagnostics the app writes (path in the "Local diagnostics" section of AGENTS.md, usually `$DSH_HOME/dsh-app/diagnostics.md`), locate by a symptom checklist, and produce a redacted environment summary and an issue draft. Load it first when the user reports lag, heat, battery drain, can't connect, crashes, an update that won't install, a plugin not taking effect, phone control failing, or wants to report a bug. Diagnose and report dsh-go problems from the on-device diagnostics snapshot.
whenToUse: The person reports a problem with JDK-Go (lag, heat, battery, connection, crash, update, plugin, phone control) or asks to file an issue. Not for changing the app's UI (dsh-go-ui) or writing a plugin (dsh-go-plugin).
---

# dsh-go troubleshooting and feedback

This skill does one thing: **get the facts first, then draw conclusions**. The app writes a local diagnostics file itself; the path and management rules are in the "Local diagnostics" section of the global instructions — read it first, then follow the checklist below. Don't prescribe a fix on a "maybe it's…".

## 1. Read the diagnostics first

```sh
# Use an available file-reading tool to read the following paths (don't output the whole diagnostics externally):
# $DSH_HOME/dsh-app/diagnostics.md        Automatic environment snapshot
# $DSH_HOME/dsh-app/diagnostics-manual.md A report the user published on purpose (check it first when present)
# With direct startup the path carries the rootfs prefix; follow AGENTS.md
```

This is a limited snapshot that the app collects and writes from its own state, the information Android makes available and runtime logs; it may contain version, device, runtime, connection, performance, recent errors captured by the app, and the tail of engine/failure logs; where some sources are unavailable or information is stale it will be missing. The Markdown has a size budget, and logs keep only a limited tail, not the full history.

Flutter, platform-callback or session errors captured by the app are a limited in-memory record within this process, not the Android system log and not a persisted complete crash report; errors after a restart or uncaught ones may not be in it. The diagnostics package isn't the system logcat either: an ordinary app's reading of other apps' and system logs is restricted by Android permissions and versions, so don't assume a system-wide log is available or that permissions can be bypassed. If logcat is truly needed, first explain the scope and privacy risks, and let the user choose a legal and available way to collect it; contents may differ across Android versions, devices and permissions.

- First check that the generation time, app version and device of the available report match this feedback; a report from another device or an old time can't be taken as this incident. Read this manual report first, then supplement the environment from the automatic snapshot. Only when all available reports are missing or stale ask the user to publish one at **Settings → Diagnostics → Let AI see the diagnostics**, then read it; don't repeatedly ask for a refresh because another file is missing. An old version having only the main snapshot is also normal.
- When information is insufficient, you can ask the user to export a ZIP through the diagnostics feature: it's generated from the same kind of collection results, contains the summary and settings, and, depending on availability, crash classification, tails of engine/failure logs and app errors; logs still have a cap and are not full logs or full crash details. The user reviews it and keeps or uploads it themselves; don't send it for them.

After the user taps **Let AI see the diagnostics**, only the fixed `diagnostics-manual.md` manual report in the same directory is written atomically, for the AI to read the system input-method evidence collected this time; automatic refreshes write only `diagnostics.md`, and the two don't overwrite each other. Check the generation time, device and version separately, and don't treat an old manual report as the new incident; with an old version that has only the main snapshot, read the existing file and don't infer a fault doesn't exist. The path is the same directory as the main snapshot, and in direct/safe mode locate it per AGENTS's instructions likewise.

**Look at it yourself before reading the diagnostics — don't first ask the user a pile of questions**; ask only for information the diagnostics lack.

## 2. Look up by symptom

### Lag / dropped frames / not following the finger
First separate whether it's "the app UI" or "the engine/model" that is slow:
- In the diagnostics look at `Performance` (tier, temperature), `Runtime state` (local vs remote), `Recent errors`.
- The local engine + a big task (npm install, many files) competes with the UI for CPU, so UI lag is normal; suggest switching to a remote host or waiting for the task to finish.
- Lag during streaming of a long reply: check the reply length and the number of code blocks; this is rendering cost, not the network.
- Have the user try **Settings → Performance → Light** once (turning off blur/motion/pet); if it improves immediately, it's effects cost, not the engine.
- On high-refresh devices, choose "System" or "Auto" at **Settings → Performance → Refresh rate** and compare; with "Max", low-end phones are more likely to drop frames.
- Still lagging: ask the user to note "which page, what operation, how long it lasts", and export the diagnostics package.

### Heat / battery drain
- A resident local engine + phone control (accessibility/floating bar) + the desktop pet + high refresh are the main sources; in the diagnostics see whether `Runtime state` is running, and in `Settings` the auto-start local, visual replies and phone storage.
- When not in use have the user **stop the local engine** (Settings → Engine → Stop), or use a remote host; turn off phone control when not in use.
- Look at the temperature tier in the diagnostics `Performance`; long streaming output gets hot by itself, which is normal.
- Don't suggest the user change system battery optimization/accessibility permissions to "speed it up" — explain such changes clearly first and then let the user tap them themselves.

### Can't connect to remote / stuck on "Reconnecting"
- First confirm: the host side and the phone side are logged in to the same account; the host-side plugin is running (check `/remote status` on the host side).
- Running **two TUIs / two dsh instances sharing the same `DSH_HOME`** on the host side kicks connections off each other (the plugin pauses automatic reconnection) — this is the most common "phone online but can't connect". Have the user keep only one instance, or give the second its own `DSH_HOME`.
- When LAN/P2P doesn't work it falls back to TURN/Relay, with high latency but connected; in the diagnostics see `Connection`.
- To get host logs, have the user export or paste the relevant lines on the host; don't guess on the phone side.

### Engine won't start / went into safe mode
- In the diagnostics see the phase, error, safeReason and strikes in `Runtime state`, and whether `Built-in runtime / installed` agree.
- Common causes: runtime not installed properly, insufficient storage, a plugin crashing startup (safe mode exists for this), direct startup failing and falling back to proot.
- First have the user try **Settings → Engine → Reinstall runtime**; for plugin problems guide them to **Settings → Plugins** to disable the most recently installed one.
- For more clues: ask the user to export the diagnostics package; it still has only limited logs, and missing ones don't mean nothing happened.

### Update won't install
- The system install confirmation page doesn't appear / is treated as cancelled: common on Chinese ROMs (HyperOS, ColorOS and others); have the user manually download `dsh-go-<version>-arm64.apk` from GitHub Release and install it, or allow this app to install unknown sources in system settings.
- Package parse failure: mostly an incomplete download; download again and check against `SHA256SUMS`.

### Plugin not taking effect / blank settings page
- Have the user confirm the plugin is installed on the **current host** and current profile, and that its status in the plugin market is enabled.
- A remote host's plugins are on the host, not on the phone; the app is just the entry.
- A plugin crashing the engine → goes into safe mode; disable the plugin and start again.

### Input method / keyboard anomalies
- First read the existing snapshot and what the user has already given; ask only for missing reproduction steps, time of occurrence or input method. Don't repeat questions about the environment already given, and don't ask for real chat content to be typed or sent. Check that the snapshot time corresponds to the event.
- Distinguish the user's observed focus loss, keyboard hiding and input connection closing; keep the observation but don't conflate them. An ordinary snapshot doesn't contain full focus/keyboard events; the system evidence recorded this time is known show/hide requests or connection closes, which doesn't directly prove the keyboard's actual visibility, nor that the Flutter text field was rebuilt.
- When basic information is insufficient and the current version supports it, a higher-privilege read-only diagnostic can be proposed: first explain the purpose, collection scope and privacy risks, ask the user's willingness, and then have the user approve this collection personally in the native confirmation UI. It only reuses an already configured and running high-privilege channel, reads recent system input-method requests output by this app's process, and returns limited structured events (show/hide requests or input connection closes, time, source and identifiable reason), not raw system log lines; an existing channel authorization isn't permission for this diagnostic. Don't proactively trigger system permission requests; when the channel is unavailable, the user refuses, cancels or collection fails, say so truthfully, don't treat it as evidence of a fault, and don't bypass authorization.
- After the user completes one collection, tap **Let AI see the diagnostics**, then read the system input-method evidence in the snapshot; export a ZIP if more limited events are needed. Collected results stay only in app memory, and aren't kept after clearing or restart; files already exported are not recalled. Don't loop collection, run stress tests or install test APKs on your own.
- Events contain no input text, and raw logs are read transiently at collection time and discarded; other logs, screenshots and diagnostics packages may still contain private information. On Android 12 or some ROMs no matching logs may be produced; `noEvents`, an unknown reason or a missing `fromUser` is not normal evidence, and unknown must not be treated as `false`. When evidence is insufficient, say so clearly, and don't blame the input method, the app or the system from these events alone.

### Phone control failing
- Check the phone control and accessibility state in the diagnostics; not ready or not collected doesn't mean turned off. Ask the user when information is insufficient; some ROMs may turn off the accessibility service by themselves.
- Not being able to read sensitive pages (passwords/payments) is system policy, not a bug; have the user hand off.
- Floating bar anomalies: have the user turn phone control off and on once.

## 3. Generating feedback (issue draft)

When the user wants to report, give them a **ready-to-paste** draft, and don't send it for them:

```md
## Environment
- App: <version> (<build number>)
- Device: <vendor model> · Android <version> (SDK <n>)
- Runtime: <built-in version> / <DSH version> / Node <version>, startup mode <proot|direct>
- Connection: <local | remote | not connected>

## Symptom
<one or two sentences>

## Steps to reproduce
1. …
2. …

## Expected / actual
…

## Diagnostics
<the relevant parts of the diagnostics file: recent errors, performance, connection; see the attachment for the full package>
```

- Copy the environment part straight from the diagnostics; don't compose it by hand.
- Have the user attach the full diagnostics package (zip) to the GitHub issue or send it to the maintainers themselves; the package contains engine logs, so **don't forward it through yourself**.
- Remind the user: before pasting, glance over whether there are paths, account names or device names they don't want public.

## 4. Privacy red lines

- The diagnostics try to redact, but can't guarantee nothing is missed; **paths, device model, account nicknames, chat screenshots and logs** can still expose personal information. Before sharing, ask the user to check manually and decide what to keep or mask.
- Never repeat, echo or write into files tokens, API keys, verification codes or chat text verbatim.
- Without asking the user first, don't: change system settings, install/uninstall apps, clear data, restart the engine.

## 5. When to say "enough"

- Diagnostics + the user's three sentences can reproduce it → just give the draft, and don't ask for more logs.
- Diagnostics missing, logs not matching, appearing only on a specific network/model → only then ask the user for the full diagnostics package.
- When unsure, first say "the current data can't locate it yet", then list **one** next thing needed; don't list five at once.
