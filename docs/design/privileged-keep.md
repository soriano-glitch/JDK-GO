# Privileged channel keep: settings, recovery and integration agreement

W12-P1, based on the public archive ca3c420. This item adds an explicit persisted choice for root, Sui, Shizuku and self-connected ADB; the virtual display still requires Android 14/API 34 or higher. For the original channel protocol and device matrix see [Privileged channels](privileged-paths.md). All real-device items are awaiting verification on this machine, and device success is not derived from JVM or source tests.

## 1. One user choice, several independent facts

Off by default. Only after the user explicitly turns on the keep switch for the current channel does the app save keptMode. There is no migration from the old mode/rootSelected/WSS state; switching from Sui, Shizuku or ADB to root doesn't inherit the keep authorization. A successful save means only that the setting was committed; it doesn't mean authorization, transport or display capability is ready.

| Operation | Save and invalidation rules |
| --- | --- |
| Turn on keep for the current channel | First save the explicit choice, then on success trigger one recovery; root is still handled through its manager for authorization |
| Turn off keep | First revoke the old recovery intent, then save the off state; a healthy connection continues to be used by the current selection |
| Switch channel, choose off, turn off phone control | First revoke the old keep intent; saving the off state and the original task/channel release each complete in their respective queues, and persistent off is confirmed only when the save succeeds; the new channel's keep is off by default |
| New process start | Only when keep is valid, phone control is on and the version threshold is met is the in-memory selection restored; initialization itself does no IO |
| Save failure | Returns failure and shows persistenceFailed; the current process stops that recovery intent, and can't claim that off was saved to disk |

An in-flight root manager request can't be withdrawn; after turning off, late connection publication is not accepted. A permission grant already completed also can't be rolled back by a cancel button. Automatic recovery only rebuilds the transport; it doesn't replay phone control tasks or grant WSS automatically.

## 2. Native and Dart contract

The two parameters of the method dsh/phone.setBackgroundKeep:

    {"mode": "root", "enabled": true}

mode allows only root, sui, shizuku, adb, and must agree with the actual current selection. A stale page request returns ok=false, reasonCode=selectionChanged and a localized reason, and can't implicitly switch the channel. ok=true means only that the setting was saved. The page then follows the latest state, and doesn't first optimistically show it as on or connected.

Under the existing background.privileged (v=1), an omittable keep is added:

    {"enabled": false, "mode": "off", "phase": "disabled", "reasonCode": null}

| Field | Range | Meaning |
| --- | --- | --- |
| enabled | boolean | The explicit keep intent currently executable |
| mode | off/root/sui/shizuku/adb | The current keep target; not a recommendation, and a save success is confirmed separately by the action result |
| phase | disabled/idle/restoring/connected/waiting/failed | Off, waiting for trigger, restoring, transport connected, waiting for a precondition, failed |
| reasonCode | fixed string or null | An observable failure reason; an unknown reason can't be guessed to be user refusal |

When an old v1 state lacks keep, Dart takes disabled/off; an unknown phase is taken as waiting. The original mode/ready/reason/root/shizuku/adb projections keep their original semantics. keep.connected means only that identity and transport passed; it doesn't upgrade effectiveReady, nor prove that the virtual display or input has been measured. When no gate result has been obtained, the original ready algorithm stays as it was, and the page can't translate it into "all capabilities verified".

| Reason group | Fixed codes | Page handling |
| --- | --- | --- |
| Setting/selection | persistenceFailed, selectionChanged | Keep the real current state, prompt to retry or refresh |
| Preconditions | phoneDisabled, unsupportedAndroid, serviceUnavailable, providerChanged, permissionRequired | Explain the missing precondition; don't authorize automatically or change identity |
| ADB | notPaired, wirelessDebuggingOff, networkUnavailable | Guide to the existing pairing, system wireless debugging or Wi-Fi operation |
| Recovery | connectFailed, restoreBusy | Show not connected; an unknown network trust or timeout reason must not be inferred |
| root | rootTimeout, rootCancelled, rootIdentityMismatch, rootDisconnected, rootStartFailed | Use the existing fixed reasons, not showing the full su output |

The Dart entry is PhoneController.setBackgroundKeep; the page reads status.background.keep. The existing supportedModes gate is kept, and no extra capability negotiation is added for the same APK.

## 3. Recovery triggers and concurrency

App plugin attach, the Activity returning to the foreground, before a new phone control task starts, and availability events such as Binder/network related to the selected channel trigger a merged recovery. Changes in other channels still notify the page but don't trigger the current channel's recovery; an old ADB network callback after unregistering doesn't wake a later-selected root. No new periodic polling or two-second recovery timer was added. A cached Flutter engine doesn't re-attach every time it goes to the foreground, so the foreground has its own independent entry.

When a service, permission, pairing or Wi-Fi is clearly missing, it is waiting, with no connection-failure backoff. A real connection exception is failed; it is re-checked only when the next actual event arrives at least 5 seconds after the failure, with no scheduled wake-up. Events suppressed within the interval are not promised to be replayed automatically at the 5th second, and later foreground, new tasks or valid events can continue the check.

One actual recovery occupies a single work slot, and other events share the result; closing and reopening produces a new generation, and the old result can't overwrite or swallow the new selection. Setting control, cancel and status reads aren't queued behind blocking root/ADB IO queues. The keeper's short lock only guards state; liveness probes, closing connections and persistence IO are not inside it.

root publishes ready after the final guard checks mayStart, and that is the linearization point of connection success. Turning off keep only cancels pending work that is no longer needed; an already published healthy connection isn't closed by mistake. Cleanup uses the actually captured channel identity, and an old failure doesn't close a new connection. A new start slot isn't opened before Shizuku's same-label unbinding and the ADB manager's old operations have really converged, and one can't infer from Future.cancel that the underlying IO has stopped. Only when a recovery was actually rejected by an old busy slot is an availability notice registered once; after the old operation successfully publishes a reusable connection or cleanup finishes, that notice is delivered outside the lock. A failure of its own connection doesn't register this kind of notice, and doesn't use cleanup completion to bypass the backoff and retry itself.

An old Flutter detach only invalidates the old UI intent, keeping a healthy manual root connection and a still-valid keep recovery; this doesn't grant automatic su permission without a keep setting. Phone control tasks are still bound by the original task generation, cancellation and time budget, and ended tasks aren't restored. The original root 30 seconds, Shizuku bind wait of 15 seconds and the 8-second range configured by libadb are each different; the latter can't be written as covering the total deadline of OPEN/PROBE.

## 4. Recovery per channel

| Channel | Preconditions and action for automatic recovery | Inferences not made |
| --- | --- | --- |
| root | Keep root explicit; fixed su/app_process arguments; OP_PROBE checks uid=0 and the revision | Whether the manager pops up a dialog and whether it allows is decided by the manager; no automatic gate or grant |
| Sui | The current actual source is Sui, a valid Binder, and rebinding the UserService after existing authorization | Sui.isSui is only the initialization source and doesn't prove the Binder is alive; it isn't guaranteed that an arbitrary Sui hot restart in the same process will redeliver the Binder |
| Shizuku | The current source matches, the service is available, and rebinding after existing authorization | No automatic requestPermission; the API's permission cache doesn't prove real-time revocation notices always arrive |
| ADB | Reuses the original pairing identity, discovery, TLS, fixed app_process and PROBE flow | The local paired flag, the system setting value and a port appearing all don't prove a real connection succeeded |

Automatic recovery doesn't call OP_GATE, create a virtual display, perform taps or releaseAll. Actual user verification and the original task flow can still carry out display and input operations for their own purposes.

## 5. Boot and system limits

BOOT_COMPLETED and the app's own package update schedule just one Job, and don't start an Activity, a Flutter engine or a resident foreground service. It uses the existing credential-encrypted storage and adds no LOCKED_BOOT_COMPLETED. The boot path obtains BackgroundControl directly and calls A11yKeeper.check once; it doesn't construct a PhoneControl that would start a two-second tick for this.

The ADB Job requires only the Wi-Fi transport; root/Sui/Shizuku need no network. There are no extra INTERNET/VALIDATED requirements, and deadlines are not used to bypass network constraints. The Job's NetworkRequest is a scheduling precondition and doesn't mean libadb's socket is bound to JobParameters.network; real routing under VPN and multiple networks still needs device measurement.

The Job is only an observer of the keep recovery. onStopJob doesn't cancel a recovery that may already be shared with the foreground or a task, and doesn't reschedule (returns false). After stopping, Android no longer guarantees the process or wake state survives; later completion is not a promise. A late call to jobFinished by an old thread after stopping is ignored by the system as a stale callback. Turning off keep/the channel and phone control still invalidate recovery through generations.

Force-stopping the app, an unlocked-never device, system/vendor background limits, and a manager not started yet can all prevent recovery. The following official documents explain the scheduling boundaries: [Broadcast exceptions](https://developer.android.com/develop/background-work/background-tasks/broadcasts/broadcast-exceptions), [JobScheduler](https://developer.android.com/reference/android/app/job/JobScheduler), [Android 15 stopped state](https://developer.android.com/about/versions/15/behavior-changes-all#stopped-state).

## 6. WSS and wireless debugging: Android 11–17

When the user has explicitly turned on keep for ADB, a pairing identity already exists locally, the developer master switch is on, Wi-Fi is observed and WRITE_SECURE_SETTINGS has actually been granted, an attempt to write the fixed Global key adb_wifi_enabled=1 is allowed. Each explicit keep choice / process recovery consumes at most one write opportunity; waiting for Wi-Fi doesn't consume it, and foreground, repeated network callbacks or task starts don't top it up. When the system writes back 0, it isn't forced in a loop. Without WSS it can still try to connect to wireless debugging that is already on, with no automatic su grant.

Below, each version is bound to the first-release AOSP tag. The mechanism checks for 11–13 don't lower this app's background-display API 34 threshold; later QPRs and OEMs aren't proven by this. WSS isn't MANAGE_DEBUGGING, and can't confirm a trusted network on the user's behalf, create a pairing or read the system's pairing list/port. The reconnect flag and Wi-Fi 2.0 of 17 also don't prove real-device compatibility of the current libadb 3.1.1.

| Android / API | Verified tag and commit | WSS and observation chain | Network and enable result |
|---|---|---|---|
| 11 / 30 | `android-11.0.0_r1`; `34a1b9c951c38537ab96b69bc308f6e0884823f5` | [Global write permission L1283](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-11.0.0_r1/packages/SettingsProvider/src/com/android/providers/settings/SettingsProvider.java#1283); [observer L196](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-11.0.0_r1/services/core/java/com/android/server/adb/AdbService.java#196) | [Enable branch L988](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-11.0.0_r1/services/core/java/com/android/server/adb/AdbDebuggingManager.java#988); without a current Wi-Fi or an untrusted network it writes back 0; TLS is turned on only after a trusted network. |
| 12 / 31 | `android-12.0.0_r1`; `cebf5c06997b64f4e47a1611edb5f97044509d76` | [Global write permission L1428](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-12.0.0_r1/packages/SettingsProvider/src/com/android/providers/settings/SettingsProvider.java#1428); [observer L196](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-12.0.0_r1/services/core/java/com/android/server/adb/AdbService.java#196) | [Enable branch L987](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-12.0.0_r1/services/core/java/com/android/server/adb/AdbDebuggingManager.java#987); without a current Wi-Fi or an untrusted network it writes back 0; TLS is turned on only after a trusted network. |
| 13 / 33 | `android-13.0.0_r1`; `0d3ff311e6e80dee7fe88a2a2cfa272ce231c3c6` | [Global write permission L1452](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-13.0.0_r1/packages/SettingsProvider/src/com/android/providers/settings/SettingsProvider.java#1452); [observer L199](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-13.0.0_r1/services/core/java/com/android/server/adb/AdbService.java#199) | [Enable branch L1025](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-13.0.0_r1/services/core/java/com/android/server/adb/AdbDebuggingManager.java#1025); without a current Wi-Fi or an untrusted network it writes back 0; TLS is turned on only after a trusted network. |
| 14 / 34 | `android-14.0.0_r1`; `299fe6f5d6fc6f1af7c3411dcf4e5efdf7217368` | [Global write permission L1472](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-14.0.0_r1/packages/SettingsProvider/src/com/android/providers/settings/SettingsProvider.java#1472); [observer L199](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-14.0.0_r1/services/core/java/com/android/server/adb/AdbService.java#199) | [Enable branch L1052](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-14.0.0_r1/services/core/java/com/android/server/adb/AdbDebuggingManager.java#1052); without a current Wi-Fi or an untrusted network it writes back 0; TLS is turned on only after a trusted network. |
| 15 / 35 | `android-15.0.0_r1`; `4e43ad12e1b211f15152e9c5b16b0fe88e6b93f3` | [Global write permission L1518](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-15.0.0_r1/packages/SettingsProvider/src/com/android/providers/settings/SettingsProvider.java#1518); [observer L199](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-15.0.0_r1/services/core/java/com/android/server/adb/AdbService.java#199) | [Enable branch L1067](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-15.0.0_r1/services/core/java/com/android/server/adb/AdbDebuggingManager.java#1067); without a current Wi-Fi or an untrusted network it writes back 0; TLS is turned on only after a trusted network. |
| 16 / 36 | `android-16.0.0_r1`; `99b01a65cc4c104933788b3143285ab6bae65827` | [Global write permission L1557](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-16.0.0_r1/packages/SettingsProvider/src/com/android/providers/settings/SettingsProvider.java#1557); [observer L186](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-16.0.0_r1/services/core/java/com/android/server/adb/AdbService.java#186) | [Enable branch L1049](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-16.0.0_r1/services/core/java/com/android/server/adb/AdbDebuggingManager.java#1049); without a current Wi-Fi or an untrusted network it writes back 0; TLS is turned on only after a trusted network. |
| 17 / 37 | `android-17.0.0_r1`; `94b4c163b7dfe5ce3607f7bb8456f9573f7de57d` | [Global write permission L1658](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-17.0.0_r1/packages/SettingsProvider/src/com/android/providers/settings/SettingsProvider.java#1658); [observer L175](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-17.0.0_r1/services/core/java/com/android/server/adb/AdbService.java#175) | [Enable branch L932](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-17.0.0_r1/services/core/java/com/android/server/adb/AdbDebuggingManager.java#932); with the reconnect flag on it keeps enabled and monitors the network; an unknown / untrusted network doesn't mean TLS is ready. |

A successful write or reading back 1 doesn't equal TLS/PROBE success. On 11–16, no Wi-Fi / an untrusted network can write back 0; on 17 with the related reconnect flag on, it can keep enabled while waiting for a trusted network. First-time pairing, network confirmation, and system forget / authorization expiry still go through the system flow. The app doesn't change the developer master switch, USB debugging, the trust table or authorization validity. The original behavior that wireless-debugging state is null on API>=36 is kept, and null is not translated into off.

## 7. Local page wiring and real-device acceptance

The do-not-disturb mode page (`dnd_mode_page.dart`) adds, in the "In use: X" card, right below it, a row "Keep X channel" switch, shown only for the channel in use; old native (without the privileged block) doesn't show it. The switch value comes only from native keep.enabled, and setBackgroundKeep is called only when the switch is tapped; build, refresh and state events never write settings. When off or connected, under the switch is written the meaning of keeping this channel (root: JDK-Go will again apply to the root manager itself, and the manager decides; Shizuku/Sui: only existing authorization is used; ADB: only the existing pairing is used, and with WSS it tries once to turn on wireless debugging), with the text not truncated. When on and not connected, it is rewritten as progress: restoring, waiting (explained separately for serviceUnavailable/providerChanged, permissionRequired, networkUnavailable and notPaired, and generic waiting for the rest), failed. A save failure shows the reason returned by native. When root is connected, the root panel's description has two variants depending on whether it's kept; the entry "reactivate after reboot" under "Conditions" isn't shown when keep is on. For screenshots see dnd_keep_* in `test/phone/dnd_mode_golden_test.dart`.

| Scenario | Result that must be observed |
| --- | --- |
| Default off, read-only page, foreground/background, tasks | No automatic su, authorization or wireless-debugging setting writes |
| root keep on, kill the app / restart / reboot the phone | Only the selected manager is requested; connected is reported only after a real probe; no display is created and no tap is made automatically |
| Turn off keep / change mode / turn off the master switch while root is waiting | Control returns promptly, the old intent doesn't publish late; a later manual or new keep connection isn't closed by the old cleanup |
| Only turning off keep after a healthy connection, Flutter detach | The already published healthy connection is kept as agreed; no new automatic authorization |
| Sui/Shizuku restart, revocation, source change | Uses real Binder/authorization/source results; failure stays on the selected identity, with no automatic permission popup |
| ADB at boot with no Wi-Fi then connecting, trusted/new networks | Record the number of setting writes, system confirmation, mDNS/TLS/PROBE; paired/setting values can't substitute |
| Revoking WSS, system forget, authorization expiry, turning off developer options | No re-authorization, no silent pairing, no repeated forced setting writes |
| onStopJob, force stop, background limits, VPN/multiple networks | Record real scheduling, routing and process survival; no fabricated promise of continuous recovery |
| New task / ended task, display/input capability | Only the transport needed by the current new task is restored, old tasks aren't replayed; display/input results are recorded separately |

All the real-device rows above are unexecuted. The verification in the repository consists of JVM tests (`PrivilegedKeepStateTest`: keep intent, generations, save failure, backoff) and Flutter tests (`privileged_keep_test.dart`: protocol parsing and the page actions not writing settings); they don't prove the actual behavior of Android services, OEMs or root managers.
