# Desktop pet action acceptance entry

`app/lib/dev/pet_actions_probe_main.dart` is a standalone debug entry that uses a local loopback HTTP/WebSocket service in place of the Host and voice model, so an Android emulator can perform real floating-window actions. The official `main.dart` doesn't reference it; the entry refuses non-debug mode, and no official logic or native code was changed.

## Real chain and replacement boundaries

| Scenario | Actually executed | Controlled replacement |
|---|---|---|
| Ask a question, original / new session | `PET_PROBE ask` opens the native input bar → tap send → `dsh/pet_overlay` → `PetOverlayActions` → `ChatController.waitForSync/send` → `DshClient` → HTTP RPC; the sync snapshot is received by the real mux | `FakeDsh` provides an isolated Host and an empty session snapshot; the session provider fixes the candidate, and creation still calls `session/create` |
| Allow once / Reject / simple question | The control interface only writes a waterfall to the real WebSocket; `DshClient` parses → `ChatAlertsController` creates a token → `PetOverlayBridge` pushes a native bubble → tap → `answerFromPet` → `$events/result` | Reuses `FakeAlertSource` to provide the session list and the exact tool-call text; a test reducer fixes the pet display state, and the token still comes from the real tracker |
| Voice backfill | Native press-and-hold to talk; after receiving the WAV, it calls the real `transcribe` action; the foreground fallback still uses `PetVoiceDialog` and `VoiceInputController`; both send an actual `speech/transcribe` HTTP request | The local model always returns `probe voice words`. The foreground fallback's recording bridge provides a one-second PCM16 WAV, and the native floating-window recorder is not replaced |

Voice verification only proves the recording/fallback interface, the request protocol, text backfill, and that "backfill doesn't send automatically"; it doesn't prove the effect of a real recognition model. The foreground fallback uses a synthetic WAV and can't be used to claim a hardware microphone has been accepted. Notification popups are isolated by a test channel to avoid triggering other system notifications; the pet's MethodChannel isn't mocked to return success. Every `native-result` is the result of the actual Dart handler.

All model/session business requests only access the in-process `127.0.0.1` service, with no real accounts, external Hosts, model downloads or paid calls. Dart preferences use in-process test values. `pet_probe_support.dart` copies pure-Dart fixtures from the three existing test helper files with their source marked, so Android's package URIs needn't reach outside `lib/`; it doesn't import `flutter_test` or `WidgetTestBinding`, and has no desktop-specific APIs. The test binding is used only for the separate smoke test.

## Local smoke

Run in `app/`:

```bash
TZ=Asia/Shanghai flutter test --no-pub tool/pet_actions_probe_smoke_test.dart
flutter analyze --no-pub lib/dev/pet_actions_probe_main.dart tool/pet_actions_probe_smoke_test.dart
python3 -m py_compile tool/pet_actions_probe.py
```

The smoke calls the real Dart actions directly, checking the HTTP prompt, session creation, the two approval results, the question answer, and that voice backfill doesn't submit a prompt. It doesn't go through an Android MethodChannel and can't be taken as a native end-to-end result. Native results must come from the UI script in the next step.

At handoff of the entry: local smoke 1/1 passed, targeted analyze of the three Dart files has no issues, and the Python syntax check and `git diff --check` passed. This entry hasn't been built yet and the Android UI script hasn't been run; emulator results should be supplemented by the JSON and logs from an actual run, and this section's smoke result can't be rewritten into an emulator pass.

## Emulator execution

To be executed serially by whoever is responsible for builds and the emulator; this document and the script won't build, install or start an emulator themselves. The target must be Android 35 x86_64:

```bash
# Repository root; run only after existing build tasks finish.
tooling/build-apk.sh --debug -f x64 -t lib/dev/pet_actions_probe_main.dart

# Install only to the explicitly specified emulator. The example assumes it is already started.
adb -s emulator-5556 install -r app/build/app/outputs/flutter-apk/app-x64-debug.apk
adb -s emulator-5556 shell appops set io.github.ccch1mneyyy.dsh_app SYSTEM_ALERT_WINDOW allow
adb -s emulator-5556 shell pm grant io.github.ccch1mneyyy.dsh_app android.permission.RECORD_AUDIO
adb -s emulator-5556 shell am force-stop io.github.ccch1mneyyy.dsh_app
adb -s emulator-5556 shell monkey -p io.github.ccch1mneyyy.dsh_app -c android.intent.category.LAUNCHER 1

python3 app/tool/pet_actions_probe.py --serial emulator-5556 --output /tmp/pet-actions-probe-result.json
```

The script first verifies read-only the input devices of the dedicated emulator, then reads `fixture=dsh-pet-actions-probe-v1` through `adb forward` and requires the counts to be zero, and only then operates the floating window; an ordinary app or old test results can't pass as the entry. The full flow supports only this round's dedicated `emulator-5556`, Android 35 x86_64, 720×1280 portrait, and refuses real devices and other device mappings. On the existing emulator it enables the desktop pet and "Always show", returns to Home, then locates and taps via UIAutomator's control text/description and bounds, without substituting forged RPCs for native taps. Ordinary input and sending still use `adb input tap`; voice uses a long-press on the native microphone button; if Android switches to the foreground fallback, it waits for the real dialog flow to return to the floating window.

The native approval/question buttons still keep the 600 ms anti-mistouch time and `PromptInputPolicy`: taps that are obscured, from virtual devices or injected by accessibility are rejected. `adb input tap`'s `deviceId <= 0` is rejected, so these three button taps use `sendevent /dev/input/event2` specifically, entering Android through the emulator's `virtio_input_multi_touch_1` hardware input. The script uses MT slot 0, finger type, a positive tracking ID, X/Y and pressure, then releases the tracking ID; the shell's exit/signal handling performs the release so no pressed state is left after a failure. This device has no `BTN_TOUCH`, and the script doesn't send that key. Screen coordinates are mapped to 0..32767 per the InputReader's 32768-value axis range. The production guard is unchanged; occlusion, injection protection or action expiry should still make the acceptance fail.

A purely read-only pre-check can be done while someone else operates the emulator:

```bash
python3 app/tool/pet_actions_probe.py --serial emulator-5556 --check-hardware
```

It reads only `getprop`, `wm size`, `getevent -lp` and `dumpsys input`, and outputs device information and a down/up event plan for center point `(360,640)` → `(16384,16384)`, marked `sent: false`; it doesn't forward ports, broadcast, capture UI or send events, and doesn't require the dev entry to be started. The pre-check requires the `event2` name and axis range, a positive Android device ID, a primary-display DIRECT binding, rotation 0 and no active touch points. A read-only check on 2026-10-31 confirmed this mapping's Android device ID as 12; after reconnecting that ID can change, so the script verifies it's positive rather than fixing it to 12. When the device mapping changes, the fixture should be re-verified, and the official guard must not be loosened.

At hardware adaptation handoff, only the read-only pre-check, the coordinate/event plan and offline checks of invalid input were run, and no hardware touches were sent. Whoever is responsible for the emulator needs to run the full script and judge pass or fail from the actual `$events/result` and `native-result`; the pre-check output can't be taken as a native acceptance result.

Success record requirements: 3 prompts (original session, new session, a manually sent voice draft), 3 `$events/result` (`allowed-once`, `rejected`, Blue), 1 `speech/transcribe`, and the `handled` results of 3 native answers; after voice backfill into the native EditText and before the manual send tap, the prompt count must be unchanged. A missing recording permission, a UI locating failure, a floating window not appearing or a backfill not returning all fail and save the current record, and don't degrade to calling Dart directly.

The result JSON clearly distinguishes `nativeUi` from `recognitionModel`, and records in `hardwareTaps` the device, screen coordinates and raw coordinates of the three approval/question taps. On failure it additionally saves `[pet-actions-probe]` and `DshPet` from `adb logcat -d`, and the current UI dump. Each re-run first force-stops and then starts the entry to avoid accumulating counts; don't treat accumulated records as a new round passing after a test failure. When finished, installing/starting an ordinary app build is enough to exit this entry.

## Manual diagnostics

The entry page shows each action and RPC. The control interface listens on the device loopback `38080` (the script forwards it to the computer's `38081`):

```text
GET  /state      Current counts, native-action/native-result, RPC and voice metadata
POST /approval   Creates an approval waterfall, doesn't decide on the user's behalf
POST /question   Creates a simple question with only Blue/Red, doesn't submit an answer
```

The `lastRequest` of `/state` carries the token generated by the tracker; `speech` records keep only the byte count, provider and fixed response, not the recording base64. The control interface has no "success" or "send" shortcut, and every acceptance action must enter from the native UI. The current entry is for this round's controlled verification and doesn't include a full acceptance of disconnect/reconnect/concurrent invalidation; those are still covered by the official unit tests and separate run tests.
