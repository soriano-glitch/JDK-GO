# Voice input: the on-device speech model

> 2026-10-28. The research is based on main `2e37d13` (the line numbers in §1 refer to it), and the implementation is rebased onto main `722ae3f` (including the image-generation app side and S6's voice "Change"); the locally built runtime `r11-direct-r4-dsh0.2.1-rc.2` (`runtime/out/*`), and the DSH 0.2.1-rc.2 install package (`~/.dsh-runtime/npm/lib/node_modules/@deepseek-ai/dsh/node_modules/@deepseek-ai/`, read-only).
>
> Markers: **〔source〕** source code read; **〔measured〕** run on this machine; **〔inferred〕** not measured. External sources are marked per Appendix A: **V** (official page or source fetched), **S** (only a search snippet seen), **U** (unverified), all dated 2026-10-28.

**Conclusion**: voice input on the phone switches to DSH's bundled speech suite. In the engine it runs SenseVoiceSmall INT8 with sherpa-onnx; the model is about 241 MB, and is usable offline after a single download. The current path depends on Android `SpeechRecognizer`, which can't be used on domestic ROMs without GMS, and no amount of tuning solves that (§1).

The suite is already packed into our runtime, the interfaces are complete, and enabling it takes effect hot (§2). The real obstacles are two, both addressed together this time:

- **The native UI has no download entry**: this time added the settings, automatic download on first launch, a progress notification and retry on failure (§4).
- **Both of the official model download sources are unreachable from China**: hf-mirror.com redirects all these files with 308 back to huggingface.co, and downloads failed when measured on this machine. Changed so that the app first downloads **byte-identical** files from ModelScope and puts them in the engine's model cache. The official plugin checks the cache by size and SHA-256 before downloading and uses it directly on a hit. When ModelScope fails, it hands back to the official download (§2.3).

Measured (x86_64 local machine, 2 threads):

| Item | Result |
|---|---|
| Worker process resident memory | About 360–396 MB |
| Inference on 10 s of audio | 0.26–0.49 s |
| Inference on 30 s of mixed Chinese-English speech | 0.72–1.2 s, with punctuation |
| Cold load | 1–4.6 s |

Numbers for phones are extrapolated from the public RTF and need confirming on a real vivo device (§3, §6).

**The strongest argument against it**: it takes 241 MB of storage and about 400 MB of memory, and needs the engine online. Phones where system recognition works (with GMS) don't actually need it. So "Auto" mode prefers the model only when the model is ready, and otherwise still goes through system recognition (§4.3).

## Contents

1. [Why the status quo doesn't work](#1-why-the-status-quo-doesnt-work)
2. [Verifying the official speech suite](#2-verifying-the-official-speech-suite)
3. [Measured: resource use and heat](#3-measured-resource-use-and-heat)
4. [Implementation](#4-implementation)
5. [Alternatives (brief)](#5-alternatives-brief)
6. [To confirm on a real vivo device](#6-to-confirm-on-a-real-vivo-device)
7. [Risks and follow-ups](#7-risks-and-follow-ups)
8. [Decisions for the owner](#8-decisions-for-the-owner)
- [Appendix A: external sources](#appendix-a-external-sources)

---

## 1. Why the status quo doesn't work

What the app has always used is the `android.speech.SpeechRecognizer` recommended by group members (`VoicePlugin.kt:174`). It's only a client interface, and behind it there must be a recognition service registered in the system and allowed to be called by third parties.

| Failure point | Explanation | Basis |
|---|---|---|
| "Available" doesn't mean usable | `isRecognitionAvailable()` only checks whether a service implementing `RecognitionService` exists, regardless of whether it can be bound or used. Huawei's `FakeRecognitionService` and vivo's Copilot service both make it return true | AOSP `SpeechRecognizer.java` (Appendix A1, V) |
| vivo's service isn't open to third parties | OriginOS (Android 16)'s default recognition service is `com.vivo.ai.copilot/.framework.wakeup.CopilotRecognitionService`, platform-signed, with empty locales, and calls return `ERROR_CLIENT` directly. Changing the default service with `settings put` is silently ignored | Appendix A3 (V, a single user report) |
| Xiaomi, Huawei | Xiaomi: `com.miui.voiceassist` fails to bind, or error code 9 when Xiao AI has no permission. Huawei: a `SecurityException` is thrown when binding `FakeRecognitionService`. OPPO's newer ColorOS: can't be found | Appendix A4–A6 (V) |
| No default service | Android 10/11 binds inside the app process, and an empty default service or a failed bind both return `ERROR_CLIENT`. From 12 on it goes through system_server, and when the specified component can't be resolved it returns **10 (`ERROR_TOO_MANY_REQUESTS`)**, a misleading code | Appendix A1, A2 (V) |
| On-device recognition | `createOnDeviceSpeechRecognizer` and `isOnDeviceRecognitionAvailable` exist only from API 31, and need the ROM to configure `config_defaultOnDeviceSpeechRecognitionService`, which domestic phones don't. Our `targetSdk = 28`, and package visibility (`<queries>` is needed only from API 30+) isn't a problem | Appendix A1 (V); `app/android/app/build.gradle.kts:44` |
| Automatic switching of routes almost comes to nothing | In auto mode, if a recognition service is found it goes through system recognition first. After an error it switches to the engine, but engine transcription requires first enabling the voice suite on the web plugin page and preparing the model, and the app has no entry for that, so after switching routes it can only prompt "go configure" | `voice_controller.dart:132,222-223,322` (main `2e37d13`) |
| It can't remember "unreliable" | The unreliable marker requires `Settings.Secure.voice_recognition_service` to have a value. On ROMs without a default service it is null, so every tap first hits system recognition | `VoicePolicy.kt:17-24` |
| Service-side permission errors don't switch routes | Error code 9 is treated as the user not having granted permission. But the app has already confirmed microphone permission before starting, so the 9 here is the service's own problem (Xiaomi's case) | `voice_bridge.dart:70`, `VoicePolicy.kt:45` (main) |
| The bar for engine mode | `VoiceMode.engine` goes through the official `speech/catalog`, `speech/transcribe` (`speech_api.dart`), available only after the official voice suite is enabled, and is **unrelated to `dsh-voice-scribe`**. `dsh-voice-scribe` is a third-party plugin, for which the app only made a settings page (`plugin_inventory_page.dart:384`), and the composer's microphone never calls it. Whether it registers itself into the official speech service can't be told from source (U) | `speech_api.dart:107-135`; `voice_scribe_settings.dart:1-3` |

**Scenarios where SpeechRecognizer is still worth keeping**: phones with GMS (Google services work), and models where the vendor service happens to be open to third parties. Keep it as the "System" mode, and as the choice in "Auto" mode when the model isn't ready.

## 2. Verifying the official speech suite

### 2.1 Whether the packages are in the runtime

| Question | Conclusion | Basis |
|---|---|---|
| Whether it's in the dependency lock | Yes. `@deepseek-ai/dsh-experimental-voice-input-bundle` brings four packages: `speech-to-text`, `speech-to-text-sensevoice` (depends on `sherpa-onnx-node` 1.13.8), `api-speech-to-text`, `client-ui-voice-input` | `runtime/locks/dsh-0.2.1-rc.2/package-lock.json:540,2351,2433,9016-9042` |
| Whether it was pruned at build time | No. Pruning only removes docs, `*.d.ts`, `*.map`, prebuilt libraries for other platforms and musl libraries (`rtbuild.py:718-745`). In the arm64 build report sherpa's ELFs are all there: `libonnxruntime.so` 34.6 MB, `libsherpa-onnx-c-api.so` 4.6 MB, `sherpa-onnx.node` 0.8 MB, 64 KiB aligned | `runtime/out/arm64-v8a/build-report.json` 〔measured〕 |
| Unpacked x86_64 rootfs | The five voice packages and `sherpa-onnx-linux-x64` are all under `/opt/dsh/node_modules` | 〔measured〕 |
| Whether it's on by default | No. In plugin management it's an optional bundle (`optional: true`, `enabled: false`). After `pluginManager/setBundleEnabled` turns it on, `application: "applied"`, taking effect hot in about 0.26 s, with no restart | 〔measured〕 |
| Whether it can load under proot | There's no measured evidence on arm64, and the reference project also writes "not yet verified on proot arm64" | Needs a real device (§6) |
| Whether it can load under direct launch | On x86_64 `sherpa-onnx.node` loaded successfully (the measured log is not checked in). Direct run lets through only `.node` files audited at packaging time (audit D3), and sherpa is on the list. `DirectLaunch.kt:72` already added `sherpa-onnx-linux-$arch` to the library path. "A5 R2 blocked (B3 native addon)" in agents.md passed in R3 | x86_64 〔measured〕; arm64 needs a real device |
| Whether rc4 changed anything | From rc2 to rc4 the voice-related packages have **no source changes**. From rc4 to alpha2 the web-side voice UI changed (6 files of `client-ui-voice-input`) and the `voice-input-bundle` manifest has changes too, while the recognizer itself didn't | `031-R2-ENGINE.../source-delta-inventory.json` |

### 2.2 Interfaces

| Method | Purpose | Basis |
|---|---|---|
| `speech/catalog`, `speech/follow` (stream) | Lists recognizers and preparation state: `unprepared` / `downloading` (with `completedBytes`, `totalBytes`) / `checking` / `loading` / `standby` / `ready` / `failed` (with `download.reason`) / `cancelled` | `dsh-experimental-speech-to-text/lib/types/types.d.ts` |
| `speech/prepare {providerId, options?}` | Starts or joins the engine-side preparation task, returning immediately. It checks, downloads, verifies and loads in turn | Same as above; `api-speech-to-text/lib/index.js` |
| `speech/cancelPreparation`, `speech/configure {patch}` | Cancel preparation; set the default recognizer and language | Same as above |
| `speech/transcribe` | A whole 16 kHz WAV, returning the final text (non-streaming) | `speech_api.dart` |
| Delete | **No interface**. The app's approach: first turn off the bundle so the engine lets go, then delete the model directory in the rootfs | §4 |

### 2.3 Model download: source, size, location, verification

| Item | Conclusion | Basis |
|---|---|---|
| Files | `model.int8.onnx` 239,233,841 B; `tokens.txt` 315,894 B; `silero_vad.onnx` 1,807,522 B. Total 241,357,257 B (about 241 MB), with the revision and SHA-256 pinned in the lock file | `sensevoice/runtime/assets.json` |
| Location | `$DSH_HOME/speech-to-text/sensevoice/models/{sensevoice-onnx,silero}/`. On the phone it corresponds to `filesDir/runtime/rootfs/root/.dsh/...` | `sensevoice/lib/index.js:209-216`; the bundle `cordis.patch.yml` |
| Verification | First compare sizes, then compute SHA-256 over the whole file. Every time the bundle is enabled (that is, every engine start) the 239 MB is hashed in full (0.2 s on this machine) | `index.js:186-199,337-338` |
| Resume | The official download's temporary file name is `.<uuid>.part`, and after a failure the **whole file is downloaded again**. Files already verified are reused | `index.js:258-316` |
| Timeout | The download has no stall detection, only the total time limit `prepareTimeoutMs` of the preparation phase, 1 hour by default | `index.js:902` |
| Default sources | `huggingface.co` and `hf-mirror.com`, with concurrent HEADs and the one that answers first picked. **Measured on this machine (domestic exit, Shanghai Mobile): hf-mirror redirects all of these files with 308 to huggingface.co, finally landing on `us.aws.cdn.hf.co`, stalling at 5.6 MB for minutes and then failing: `network (UND_ERR_SOCKET)`** | `index.js:893`; 〔measured〕 |
| Domestic mirror | On ModelScope, `pengzhendong/sherpa-onnx-sense-voice-zh-en-ja-ko-yue` (revision `73eca476`) and `v4/` of `pengzhendong/silero-vad` (revision `370539c7`), the sizes and SHA-256 of the three files are **exactly identical** to the lock file, with Range supported. 239 MB downloaded in 30.8 s on this machine | Appendix A8 (V, hashes checked via API); 〔measured〕 |
| Can the official plugin be switched to ModelScope | Not directly: `modelOrigins` accepts only HF-compatible origins (`^https?://host/?$`), and ModelScope's path format differs | `index.js:893` |
| Relation to third-party plugins | See the last row of §1: engine mode goes only through the official speech service | — |

**The approach: the app puts the files into the engine's cache first.** The app downloads from ModelScope per the lock file, supporting resume (`*.dsh-go.part` + Range), computes SHA-256 while downloading in a background isolate, and renames to the final file name after verification passes. It then turns on the bundle and calls `speech/prepare`. The plugin finds the files already there with matching hashes, skips downloading, and goes straight to verifying and loading.

Full-chain measurement on this machine: with files preplaced, `speech/prepare` finishes the model step in about 0.9 s (only computing hashes), verification takes about 0.7 s, loading about 4.6 s, and then `ready`.

The mirror is matched by SHA-256. When the lock contains a hash the app doesn't recognize, such as when the model is changed after rc4, the mirror isn't used and it's left to the official download.

## 3. Measured: resource use and heat

Local test: the x86_64 rootfs (the same one the app packages), running `dsh web` in bwrap. The machine is a Ryzen 7 7745HX, `threads = 2`. The audio is the `zh.wav` and `en.wav` that SenseVoice ships on ModelScope, spliced into 10 s and 30 s clips.

| Item | Measured (x86_64) | Phone estimate 〔inferred〕 |
|---|---|---|
| First load (the `load` step, cold page cache) | 4.6 s | 5–15 s |
| Cold wake (standby → first transcription, 10 s audio) | 1.31 s total, worker CPU 1.66 s | 3–8 s |
| Worker resident memory (after loading) | 360 MB; 392–396 MB after transcribing 30 s | Same order (decided by the model weights) |
| 10 s audio | Inference 0.26–0.49 s, CPU 0.58–0.96 s | RK3588's A76 single-thread RTF is 0.099 (Appendix A9); two threads about 0.6–1.5 s |
| 30 s mixed Chinese-English speech | Inference 0.72–1.2 s, CPU 1.6–2.4 s | About 2–4 s |
| Verification at each engine start | SHA-256 of 239 MB, 0.2 s | Around 1 s (with ARMv8 crypto instructions) |
| Recognition quality | "开饭时间早上9点至下午5点。The tribal chieftain called for the boy and presented him with 50 pieces of gold." with punctuation. There are wrong characters where the clip was cut off mid-way | — |

**Where heat and lag come from**:

- It uses CPU only while inferring, a few seconds each time, running in the engine process and not occupying the UI thread.
- An idle worker process burns no CPU, but holds about 400 MB of memory. This increases the probability that the system reclaims the engine process.

**Configuration on the phone** (delivered via an overlay, without changing the official package):

| Item | Value | Reason |
|---|---|---|
| `idleTimeoutMs` | 90 s (default 300 s) | Cold wake is estimated at 3–8 s on a phone. The dictation bursts within a conversation are mostly under 1–2 minutes apart, which 90 s covers, while still releasing about 400 MB after 1.5 minutes |
| `threads` | 2 (unchanged) | On this machine RTF is 0.03–0.05, and no data says it needs changing. More threads only run hotter |

Implementation: `SpeechGuest.kt` writes `/opt/dsh-app/speech.patch.yml` on each engine start, passed to `dsh web` with `--patch`. This is the same approach as the two overlays for message search and the login bridge.

- **Whole-block replacement**: the patch replaces this item's `config` as a whole block, so the bundle's original `dataRoot` must be carried.
- **When the bundle is off**: this patch matches no entry, only logs a warning and is skipped (`cordis-plugin-include/lib/index.js:50`).
- **Measured on this machine**: the worker process got `"idleTimeoutMs":15000` and was reclaimed after being idle; the bundle was toggled twice and the engine was normal both times.

## 4. Implementation

### 4.1 Flow

```
Voice chosen in onboarding (onboarding_wants_voice=true, size shown)  or  Settings › Voice input › Download
        │ (record voice_model_wanted=true; after being killed, continue downloading when the engine is next ready)
        ▼
Local engine ready → read the lock file in the rootfs → check free space (missing bytes + 100 MB)
        ▼
Download from ModelScope into the model cache (Range resume, 30 s stall timeout, SHA-256, atomic rename) ── on failure ─┐
        ▼                                                                                                          │
setBundleEnabled(true) → speech/prepare → read state every 0.7 s                                                      ←┘ official download fallback (cancel after 60 s without progress)
        ▼
ready → configure(providerId=sensevoice-local) → "Voice input is ready"
```

| Module | File |
|---|---|
| Lock file parsing, mirror table, disk state | `app/lib/voice/voice_model_assets.dart` |
| Resumable download (background isolate) | `app/lib/voice/voice_model_download.dart` |
| State machine (download, cancel, delete, resume, first launch) | `app/lib/state/voice_model_state.dart` |
| The model card in the settings page | `app/lib/ui/settings/voice_settings_page.dart` |
| Light prompts, notification copy, foreground/background switching | `app/lib/ui/notify/voice_model_host.dart` (mounted on `home_shell.dart`) |
| Completing the speech interface | `packages/dsh_client/lib/src/speech_api.dart` |
| Notification progress row, overlay | `DshService.kt`, `RuntimePlugin.kt` (`voiceModelLine`), `SpeechGuest.kt`, `DshProcess.kt`, `RuntimeController.kt` |

### 4.2 Interaction

| Scenario | Behavior |
|---|---|
| Voice chosen in onboarding | Treated as having agreed to download (the size was seen when choosing), not limited to Wi-Fi. At the start a light prompt "Voice model download started · about 241 MB" |
| While downloading | The voice settings page shows a progress bar, percentage and "108 MB / 241 MB". The engine's persistent notification changes to "Downloading voice model 44%", with a progress bar, visible even when the app is in the background. The notification row is updated at most every 0.5 s (items arriving in between keep only the latest, sent when the time comes), and isn't sent if identical to the previous one: the download reports progress every 0.25 s, and Android drops notifications beyond 5 per second per app |
| Done | A light prompt "Voice input is ready". When the app is in the background, the notification row shows the same sentence, restored to normal after returning to the foreground |
| Failure | A bottom prompt "Voice model download failed: network connection failed", with a "Retry" button, disappearing on its own after 8 seconds. The settings page keeps showing the reason and "Retry". After a failure it doesn't retry on its own and never loops |
| Killed or restarted | Next time the engine is ready it continues downloading, with a light prompt "Continuing the voice model download · about X MB left". Completed files and `.dsh-go.part` are both kept |
| Manual download (download, continue, retry and re-download in the settings page, and "Retry" on the failure prompt) | On a metered network (mobile data, with no Wi-Fi or Ethernet) a dialog "Download over mobile data? The voice model is about X MB" first, and it downloads only after confirming. All manual entries go through the same confirmation (`downloadVoiceModel`). A download in progress shows "Continue download", and the dialog shows the remaining size |
| After ready | Two equal-width buttons, "Re-download" and "Delete", stacked top and bottom when they don't fit (narrow screens, large fonts), still of equal width. Delete asks for confirmation; deleting first stops the file download (waiting for it to report stopped, at most 10 seconds; an old download that was cancelled before and hasn't yet reported stopped is waited on too, and a new download finishing doesn't substitute for the old one), turns off the bundle, then deletes the files. If it hasn't reported stopped within 10 seconds, nothing is touched or deleted, with the prompt "The download is still stopping, please delete later", and waiting until timeout doesn't count as stopped. If the engine didn't confirm turning off the bundle (an error or not `applied`), nothing is deleted either, with the prompt "Couldn't delete the voice model, please retry" |
| Re-download | New files are first downloaded to `speech-to-text/sensevoice/dsh-go-staging` (on the same file system as the model), each file checked against the engine lock file for size and SHA-256, and only once all have arrived are the original files replaced by renaming one by one; the engine needn't turn off the bundle, and voice input is available throughout. If cancelled or failed midway, the original model is kept intact, and the failure prompt's "Retry" tries the re-download again. The temporary copies in staging also count as "may still be writing": deletion waits until all downloads (including those cancelled before and not yet reported stopped) have reported stopped; if they haven't stopped, it's kept, and deletion then isn't allowed per the row above, and tapping re-download again also waits for them first (at most 10 seconds; if it can't wait it prompts failure and touches nothing). The disk must hold a second copy. When some file has no mirror it can only be downloaded by the engine into its own cache, and then it's delete-then-download as before |
| Insufficient space | Stopped before the download: "Not enough storage, about X MB more needed" |

The copy has no "experimental" wording. Both Chinese and English are in `app/lib/l10n/parts/voice_{zh,en}.arb`.

### 4.3 Recognition modes and fallback

| Mode | Behavior |
|---|---|
| Auto (default) | When the current host is the local engine and the model shows "Ready", **use the model directly** instead of first hitting system recognition. Before recording it also confirms once more with the engine; if the engine says it isn't ready, it goes to the system service as before. When the model isn't ready, the system service starts immediately as usual, without waiting for the engine's probe. After a system service error (including the service's own 9) it re-records using the model once. When neither side is usable it prompts "System recognition isn't available, you can download the voice model in voice settings", with S6's "Change" button (opening voice settings, which has the recognition mode and the model). Remote hosts as before: the model is in the phone's engine, which doesn't count for a remote host (`modelReady` in `chat_screen.dart`) |
| Voice model (formerly "Engine") | Uses only the engine's model. When there is no model it prompts "Please download the voice model in voice settings first" |
| System | Uses only `SpeechRecognizer`, kept for phones with GMS |

### 4.4 Tests

| Test file | Coverage |
|---|---|
| `test/voice/voice_model_download_test.dart` | Tested on a local HTTP server: resume, re-download without Range, verification failure, switching mirrors, stall timeout, cancel, isolate |
| `test/voice/voice_model_assets_test.dart` | The rc2 lock file, unknown hashes, rejecting abnormal paths, disk state |
| `test/voice/voice_model_state_test.dart` | First-launch download, mirror failure falling to official, insufficient space, cancel, delete, resume after being killed, waiting for the engine, already ready, mapping of official failures, official stall, no bundle, changing the default recognizer, notifications |
| `test/settings/voice_model_card_test.dart` | Light and dark goldens for four states and an English golden; symmetry measured at 320 and 390 dp at 1× and 2× font size: equal left and right padding, equal button widths, tap targets ≥ 48, progress bar the same width as the buttons; metered-network confirmation; delete confirmation |
| `test/chat/voice_model_route_test.dart` | Auto mode preferring the model, switching routes even when the service reports 9, the prompt carrying "Change" |
| `SpeechGuestTest.kt` | Location, content and writing of the overlay |
| `references_api_test.dart` | The newly added speech fields and parameters |
| Adjusted existing tests | `composer_voice_test`: the model takes priority when the model is ready, and when there is no model the system takes priority without probing the engine. `voice_continuation_test`: a service-side 9 switches routes, with the copy changed. `voice_fallback_test`: the model not ready at the start but ready when switching routes |

## 5. Alternatives (brief)

| Option | Chinese quality | Streaming | Size | License | Conclusion |
|---|---|---|---|---|---|
| **DSH suite: SenseVoice-Small INT8** (this plan) | AISHELL-1 CER 2.96, WenetSpeech net 7.84 (Appendix A10) | No, whole-clip recognition | 241 MB download; native libraries already in the runtime | Runtime library Apache-2.0 + MIT; weights under the FunASR license, commercial use allowed, attribution required (A11) | Adopted |
| Embedding sherpa-onnx + a streaming model in the app (such as X-ASR zh-en 134 MB, paraformer bilingual 226 MB) | Text appears as streamed | Yes | APK about 20 MB larger (arm64 native libraries) + the model | Same as above | Consider later if text appearing as you speak is wanted; needs a separate set of inference outside the engine (V2) |
| Vosk small-cn | SpeechIO-02 23.5 (poor), no punctuation | Yes | 42 MB | Apache-2.0 | Not adopted |
| whisper.cpp tiny/base | Far worse than SenseVoice on AISHELL, traditional/simplified indeterminate, makes up sentences in silence | No | 32–60 MB | MIT | Not adopted |
| Cloud: SiliconFlow SenseVoiceSmall | Same model | No | — | Free, OpenAI-compatible | Can be an option for "users who already configured a key" (V2) |
| Cloud: Bailian Paraformer, qwen3-asr-flash | — | Yes | — | ¥0.00022–0.00033/s, using a DashScope key | Same as above |
| Cloud: Doubao streaming 2.0 | — | Yes | — | ¥1/h | A key must be applied for separately, and **an Ark key can't be used** |
| Cloud: iFlytek, Tencent | — | Yes | — | Free quota | A key must be applied for separately |

The sources for the cloud rows are Appendix A12–A15. By media-generation's design, keys are stored in the host plugin and the app can't get them, so cloud recognition can only be made as a host-side speech provider.

## 6. To confirm on a real vivo device

| # | What to confirm | How |
|---|---|---|
| 1 | Evidence of the current state | `adb shell settings get secure voice_recognition_service`; `adb shell pm query-services -a android.speech.RecognitionService`. Compare with the vivo report in §1 |
| 2 | sherpa can load under proot | Settings › Voice input › Download, wait until "Ready", then say a sentence in the composer |
| 3 | Also works under direct launch | Switch the developer switch to direct launch, restart the engine, repeat #2 |
| 4 | Download on domestic networks | Run through once on mobile data and once on Wi-Fi. Confirm the dialog, progress, the notification-shade progress bar, and ModelScope's speed |
| 5 | Memory and heat | After loading, look at the engine process tree with `adb shell dumpsys meminfo`. Dictate 10 times in a row and watch the body temperature, recording the time for 10 s / 30 s text to appear and the cold-wake time |
| 6 | Resume after being killed | Swipe the app away from multitasking midway through the download, and on reopening it should continue downloading |
| 7 | vivo background | Whether the "high background power use" restriction cuts the network during a background download (stepped on before) |
| 8 | Onboarding | After voice is chosen in onboarding, the download should start as soon as the engine is ready |

## 7. Risks and follow-ups

- **Third-party mirror**: the copy on ModelScope is under a personal account (pengzhendong, a contributor to k2/WeNet). SHA-256 guards it, so the content can't be wrong; but the repository may be deleted or changed. The alternative is hosting it ourselves (§8 D2).
- **The official fallback is probably also unreachable in China**: if it fails, give up after 60 s and give the reason and "Retry".
- **Hashing 239 MB at every start**: this is the official plugin's behavior, which the app can't change. A suggestion could be made upstream: cache the verification result by size and modification time.
- **Deletion has no official interface**: the app turns off the bundle and then deletes the directory. If the user turns the bundle on again on the web plugin page, the plugin shows "Not prepared", which is normal.
- **Gradle's network**: this machine's Gradle JVM doesn't read the sandbox's `HTTPS_PROXY`, so connecting directly to dl.google.com fails the TLS handshake, and `--offline` lacks kotlin-stdlib 2.4.0. This round's workaround was passing the proxy to Gradle via `-Dhttps.proxyHost/Port`, with Kotlin unit tests passing 441/0.
- **V2**: streaming text appearance (embedding a streaming sherpa-onnx model in the app, or a cloud provider on the host side), press-and-hold to talk, and `dsh-voice-scribe` connecting to the official speech service.

## 8. Decisions for the owner

| # | Item | Recommendation | Reasons against |
|---|---|---|---|
| D1 | Use ModelScope's personal copy as the download source, with official HF only as a fallback | Adopt: measured 7–8 MB/s in China, hashes identical | Depends on a third-party account staying online long-term |
| D2 | Whether to host a copy ourselves (domestic object storage, HF-compatible paths) | Not for now: do it if ModelScope has problems. The FunASR license allows redistribution, with attribution | Costs money and needs maintenance |
| D3 | "Auto" prefers the model when the model is ready (no longer prefers system recognition) | Adopt | On phones with GMS, Google recognition is streaming and shows text faster, and once the model is ready it ends up unused. People who truly care can choose "System" |

## Appendix A: external sources

- A1 AOSP `SpeechRecognizer.java` (android11/12/14-release), `SpeechRecognitionManagerServiceImpl.java` (android14); developer.android.com's SpeechRecognizer reference page and package-visibility page (V). https://android.googlesource.com/platform/frameworks/base/+/refs/heads/android14-release/core/java/android/speech/SpeechRecognizer.java ; https://developer.android.com/reference/android/speech/SpeechRecognizer
- A2 Same as above, `RecognitionService.java:182-201` (V).
- A3 vivo OriginOS: https://github.com/OpenMinis/OpenMinis/issues/431 (V, a single report).
- A4 Huawei: https://github.com/csdcorp/speech_to_text/issues/402 , #471, #652 (V).
- A5 Xiaomi: https://github.com/react-native-voice/voice/issues/236 ; https://github.com/jamsch/expo-speech-recognition/issues/138 (V).
- A6 A roundup of domestic phones (2019): https://www.jianshu.com/p/a46c0bd8f961 (V).
- A7 hf-mirror 308 → huggingface.co: measured on this machine with `curl -I`, with the same result for different UAs (2026-10-28).
- A8 ModelScope file listing API (including SHA-256): https://www.modelscope.cn/api/v1/models/pengzhendong/sherpa-onnx-sense-voice-zh-en-ja-ko-yue/repo/files ; …/pengzhendong/silero-vad/repo/files (V).
- A9 sherpa-onnx SenseVoice pretrained model page (RK3588 RTF): https://k2-fsa.github.io/sherpa/onnx/sense-voice/pretrained.html (V).
- A10 SenseVoice paper: https://arxiv.org/html/2407.04051 (V).
- A11 FunASR MODEL_LICENSE: https://github.com/modelscope/FunASR/blob/main/MODEL_LICENSE ; the clarification on commercial use in the SenseVoice README: https://github.com/FunAudioLLM/SenseVoice (V).
- A12 SiliconFlow: https://docs.siliconflow.cn/docs/api/audio-transcriptions-post ; https://siliconflow.cn/pricing (V).
- A13 Bailian: https://help.aliyun.com/zh/model-studio/real-time-speech-recognition ; …/qwen3-asr-flash ; …/obtain-temporary-authentication-token (V).
- A14 Doubao speech: https://docs.volcengine.com/docs/6561/1354869 ; …/1359370 (V).
- A15 iFlytek: https://www.xfyun.cn/doc/asr/voicedictation/API.html ; Tencent: https://cloud.tencent.com/document/product/1093/35799 (V).
- On-device candidates (Vosk, whisper.cpp, X-ASR, streaming paraformer): https://alphacephei.com/vosk/models ; https://huggingface.co/ggerganov/whisper.cpp ; https://github.com/k2-fsa/sherpa-onnx/releases/tag/asr-models (V).
