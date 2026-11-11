# Floating pet half-wheel and screenshot acceptance

Goal: outside the app, long-press the pet and slide with the same finger to choose, executing on release; after "Screenshot and ask JDK-Go" takes the screenshot, it automatically returns to the app's new-chat pending-send area, and the user can keep typing, with no automatic send.

## Automated regression

From the repository root, run according to the available toolchain:

```bash
(cd app && flutter analyze --no-pub)
(cd app && flutter test --no-pub test/system_entry test/web/web_mode_test.dart)
python3 app/tool/guide_sync.py --check
python3 app/tool/l10n_merge.py --check
```

Native unit tests run with the Android/JDK toolchain as `:app:testX64DebugUnitTest`, covering `pet.*` and the screenshot entry tests. Geometry/state unit tests can't replace Android window, actual touch stream, system screenshot and OEM background-launch verification. Verification results should attach the actual commands and output, and desktop or stubbed compilation must not be written up as a real-device pass.

## Real-device steps

Use a test page containing no real accounts, payments, passwords or chat privacy; build and install the APK for the matching ABI before running. Don't overwrite-install or stop the app on a phone that is running the current engine without confirmation.

1. With the pet docked left and right respectively, long-press and, while holding, slide to each item; the highlight, slight enlargement and raised effect should change continuously, and releasing executes only the current item once.
2. Releasing right after the long press without moving, sliding back to the center, sliding out of the outer ring, interruption by multiple fingers, system `ACTION_CANCEL`, rotation, screen off and window generation invalidation must all not execute the old option; an ordinary tap, drag snapping and dragging to × to hide keep their original behavior.
3. Verify near the top/bottom, small screens, landscape and enlarged fonts; the half-wheel must not clip the action area and, when necessary, degrades to scrollable full-label buttons; in list degraded mode lifting the finger in place keeps the menu, then scrolling to the last item and tapping, while the regular half-wheel still cancels on lifting in place; accessibility long-press can still select by tap. Tapping outside the wheel collapses it without executing; the original touch stream doesn't grab keyboard focus for the wheel.
4. Operate with system animations on and off respectively; check whether expansion, selection switching and collapsing are smooth, and whether there are stacked animations, leftover floating windows or main-thread jank. Actual frame rate needs real-device frame statistics; don't infer "stable 60 fps" from code.
5. On Android 11+ with accessibility connected, choose "Screenshot and ask JDK-Go" on an external test page: the image must not include the pet, the wheel or the phone-control overlay; it returns to the app automatically, and the new chat's input area shows the image and has input focus.
6. Repeat step 5 with text and attachments pre-written in the original chat and in a new chat respectively: the old draft isn't lost and the new draft's original content is kept; continue typing a question, confirm the image is still there, and that there is no model request or image upload before the user taps send. Check that the private temporary screenshot copy is cleaned up after reading and that the gallery gets no new item.
7. Check separately, with only the overlay permission on but accessibility not on, Android 10 or lower, screenshot timeout/service disconnect, and secure windows: a clear message, the pet restored, no leftover cache, and no automatic entry to a wrong page or sending of messages.
8. With consecutive triggers, and switching host/returning to the foreground/locking the screen during the screenshot, an old operation must not wake up or add attachments repeatedly after it has become invalid; when OEM blocks a background launch, test the notification return entry.
9. Regress all the original "Ask a question", "New chat", "Stop current task", "Switch host", "Don't show today" and "Pet settings"; stop still targets the session fixed when the wheel was opened, and the secondary action for switching host is reachable.
10. With the app set to web mode, the screenshot likewise goes into the web new-chat input area without automatic send; web failure feedback and the attachment budget follow the existing share entry behavior.

## This round's record

2026-11-04, local Linux arm64: `dart analyze` in an isolated worktree passed; targeted system-entry regression 29 passed, web screenshot backfill 1 passed; the native module passed static compilation with the Android 36 platform libraries and the Flutter embedding, the pet JVM regression 148 passed, and the screenshot entry/resource policy regression 13 passed (partially overlapping coverage). The native quick compile used boundary stubs only for R and for engine/A11y adjacent dependencies not changed this time, which is not equivalent to a complete APK build or real-device verification.

When widening the run to the whole system-entry directory, 67 passed and 2 existing share-landing goldens failed; the same differences (3278 pixels in dark, 1774 pixels in light) were reproduced in a separate worktree at the unmodified baseline `1057b48`. Goldens were not updated to hide the differences; this round's targeted screenshot cases are unaffected.

Real-device installation, native drag selection and the end-to-end screenshot are not yet accepted; the standard Gradle/APK build was not run locally. No APK was overwrite-installed on the current phone, and the app/engine hosting the conversation was not restarted as a result.
