# Accessibility feedback interruption vs. stopping phone tasks

Refs #570. This contract distinguishes Android's feedback interruption from an explicit stop of a DSH phone task. The Android device regression has not been run yet, so the Huawei Clock issue is not declared fixed on this basis.

Android's `AccessibilityService.onInterrupt` requests interrupting the feedback the service is currently providing; it is not a service-unbind notification and doesn't carry the user's intent to stop a DSH phone task. `AccessibilityManager.interrupt()` requests all bound services to interrupt feedback. DSH's callback should not therefore retire the PhoneTasks owner, cancel confirmations or interrupt the phone worker.

Currently this service doesn't hold any ongoing TTS, audio or vibration feedback tasks. The floating bar's `announceForAccessibility` hands the event to the accessibility system, and the long-press ball's `performHapticFeedback` is one-off feedback; no whole-task cancellation is added for these calls. This callback only records that a feedback interruption was received; if ongoing feedback held by this service is added in the future, only that feedback must be stopped here.

Explicit stops by the user in the app, notification, floating bar, confirmation dialog or handoff, as well as screen off, service unbind/destroy and engine exit, keep their respective original stop paths. It is forbidden to swallow worker Interrupted, ignore owner invalidation, turn gesture onCancelled into success, or retry automatically.

Only in debug builds does the existing A11yProbe add a public `AccessibilityManager.interrupt()` trigger and task snapshot read. The FLAG_DEBUGGABLE and android.permission.DUMP gates are kept; it isn't triggered automatically and isn't exposed through the assistant tools. This request affects the feedback of all bound services on the device; the owner runs it only deliberately on their own test device.

Device-first gate: in the probe-only original, first establish a task with the normal phone tools, then after a public interrupt confirm that the original's task stops; in the full candidate, first confirm the callback arrives, then check that the task id/lifecycle and active are kept; additionally confirm that explicitly tapping the user Stop still invalidates the old owner and stops subsequent actions. Platform requests are asynchronous; "sent" can't be treated as "callback arrived". The actual Huawei Clock tap still needs independent recording of the callback and stop source; platform contract tests don't replace reproducing it on that device.

Official sources:

- https://developer.android.com/guide/topics/ui/accessibility/views/service#methods
- https://developer.android.com/reference/android/view/accessibility/AccessibilityManager#interrupt()
- https://android.googlesource.com/platform/frameworks/base/+/android-12.0.0_r1/services/accessibility/java/com/android/server/accessibility/AccessibilityManagerService.java
- https://android.googlesource.com/platform/frameworks/base/+/android-12.0.0_r1/core/java/android/accessibilityservice/AccessibilityService.java
- https://android.googlesource.com/platform/cts/+/android-12.0.0_r1/tests/accessibilityservice/src/android/accessibilityservice/cts/AccessibilityEndToEndTest.java
