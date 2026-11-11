# Live activity (status bar capsule / Dynamic Island)

## 0. Conclusion

When DSH is working, waiting for you, or operating the phone, it posts a persistent notification and asks Android 16 to promote it to a Live Update (live activity), shown in the status bar capsule, at the top of the notification shade and on the lock screen. HyperOS 3.1+, ColorOS 16 and MagicOS 10 put this kind of notification into their own islands; Pixel shows it in the status bar capsule.

Each vendor's private Dynamic Island protocol requires an allowlist and sideloaded APKs can't pass it, so no private protocols are written for them. The one exception is Xiaomi's focus-notification template: it is attached only when the system confirms it allows this app, and not added otherwise.

## 1. Each vendor's road

| Vendor | Private protocol | Can we use it | Standard Live Updates |
|---|---|---|---|
| Xiaomi | Focus notification / Super Island `miui.focus.param` | China ROM needs enterprise certification, a Xiaomi store listing, signature binding and review; the international version has a user switch | HyperOS 3.1+ goes into the Super Island (community-measured, not stated officially) |
| vivo | Atomic Island `notification.superx.*` | Needs a vivo store listing and email review, with an allowlist by package name + scenario | Overseas OriginOS 6 works; China OriginOS 6 doesn't |
| OPPO / OnePlus | Fluid Cloud (intent-sharing ContentProvider) | Needs enterprise certification and OPPO authorization | ColorOS 16 / OxygenOS 16 support it; the per-app switch is off by default in some versions |
| Honor | Dynamic Capsule (Kit / intent sharing) | Needs review | MagicOS 10's official docs explicitly support it, with no review needed |
| Samsung | Now Bar private extras | Package-name allowlist | One UI 8 allows only Samsung's own apps by default; third parties need developer options |
| Huawei | Live Window | Supports only HarmonyOS 5 native apps | Not applicable |

### 1.1 Real-device evidence (vivo X200, China OriginOS 6, `PD2405C_A_16.1.24.23`, 2026-11-01)

- `sdk_full=36.0`, i.e. a QPR0 base. In `framework.jar`, `android.app.FeatureFlagsImpl.uiRichOngoing()` is compiled to the constant `false`, so `Notification.hasPromotableCharacteristics()` takes the old branch (recognizing only ongoing CallStyle or colorized). `canPostPromotedNotifications()` returns false for both targetSdk 28 and 36, and the system doesn't define `POST_PROMOTED_NOTIFICATIONS`. On this phone nobody can get a live activity.
- When a third-party app sends extras such as `notification.superx.island` in vivo Wallet's format, the system deletes the island-related fields and sets the tag `VIVO_SUPERX_TAG` to null. The allowlist is `mAllowAppSupportSuperXNoti` in `vivo-services.jar`, with data from `/data/bbkcore/vivo_superx_info_list.xml` (cloud-controlled, not readable by shell).

So on this phone we can only verify that "when unsupported, nothing is sent"; the island effect can't be seen.

### 1.2 targetSdk 28 is unaffected

In AOSP 16.0 / QPR1 / QPR2 / 17, `Notification.hasPromotableCharacteristics()` and `NotificationManagerService.fixNotificationWithChannel` check only the notification itself, the channel importance (can't be MIN) and the `POST_PROMOTED_NOTIFICATIONS` permission (`normal|appop`, granted at install), with no targetSdk or CompatChange. `EXTRA_REQUEST_PROMOTED_ONGOING` (`"android.requestPromotedOngoing"`) and the permission constant become public only in SDK 36.1, so the code writes the literal and needn't raise compileSdk.

If some version later adds a targetSdk gate to the promotion path, we will be the first to break: every major Android version must be regressed once on a real device.

## 2. Product rules

### 2.1 When it's shown

It is sent only when the system will really promote it: `canPostPromotedNotifications()` is true (Android 16 QPR1+ and this app's switch is on), or HyperOS allows this app's focus notification. On other phones nothing is sent, to avoid an extra persistent notification.

| Source | State | Capsule | Body |
|---|---|---|---|
| Phone control (native) | Task in progress | "Operating" / "Paused" | "DSH is operating the phone" + the current action, with a "Stop operating" button |
| Pet notification | Waiting for your confirmation / answer | "To confirm" / "To answer" | Chat title + "Waiting for your confirmation" |
| Pet thinking / working / juggling / sweeping | Running | Timer (counted from the start of this turn) | Chat title + "Thinking / Working / Subagents are helping / Tidying up context", with "· N chats running" added when there are several chats |
| Pet attention / error | Done / errored | "Done" / "Error" | Shows the pet's moment only when the app is not in the foreground, following the two notification switches "Turn complete" and "Error or stopped" |

- Phone control takes priority: DSH is moving your phone, which is the thing you most need to see and most need to be able to stop at any moment.
- The wording comes from the pet state reduction (`PetMood`), so the island and the pet always agree; the large icon is the first frame of the current pet in this state (Deepy typing at the computer, holding a sign, hopping), and is left out if no pet is chosen.
- Tapping opens the pet's "most relevant chat", the same place as tapping the floating pet.
- Approval buttons stay only on the "Waiting for your confirmation" notification; the live activity doesn't duplicate them.
- When the lock screen hides sensitive content, only generic text like "DSH is working" is shown, with the title redacted per `alertTitle`.

### 2.2 Switch

"Settings → Notifications → Live activity", on by default, subject to the master notification switch. When the system doesn't support it the switch is grayed out with a note; when the system supports it but hasn't allowed it (off by default in some ColorOS versions) it shows "Turn on", jumping to `ACTION_APP_NOTIFICATION_PROMOTION_SETTINGS`, falling back to notification settings if that can't be resolved.

## 3. Implementation

| File | Role |
|---|---|
| `app/lib/notify/live_activity.dart` | Pure function `liveActivityOf`: pet state → wording, capsule, timer start, target chat |
| `app/lib/state/live_activity_state.dart` | Combines pet state, the running list, pending items and notification switches, and pushes changes to `dsh/notify`'s `live` |
| `notify/LiveContent.kt` | Live activity content (pure Kotlin), and the trade-off that phone control takes priority |
| `notify/LiveActivity.kt` | Single-thread publishing: minimum interval 600 ms; no re-send when content is unchanged; re-sent every 4 minutes, with a 10-minute timeout (15 seconds in the done state), so that "working" isn't left in the notification shade even if the process dies |
| `notify/XiaomiFocus.kt` | When `canShowFocus` allows it, attaches the focus template, putting the pet and capsule text on the island; the template stays within 3072 bytes |
| `pet/PetSprites.kt` | `portrait`: decodes only one cell, crops to the opaque area, and scales pixel art by integer multiples |
| `phone/PhoneControl.kt` | Refreshes the live activity at task start/end and on each status-line change |

The channel `dsh-live` uses default importance but no sound and no vibration: when there is no promotion on the HyperOS focus path, the status bar icon is still kept.

## 4. Verification

- Unit tests: `LiveContentTest` (JVM), `test/notify/live_activity_test.dart`.
- Real device: needs a Pixel (Android 16 QPR1+), ColorOS 16, MagicOS 10 or HyperOS 3.1+ device, or an Android 16 QPR2 emulator. Check the capsule timer, the capsule text while waiting for confirmation, lock-screen redaction, tap navigation, and "Stop operating" during phone control. On China OriginOS 6 nothing should be sent.

## 5. Possible later work

- **Step progress bar**: when a chat has a todo list (`TodoWriteEvent`), use `ProgressStyle` segmented by todo, with the pet running forward as the tracker icon on the progress bar. It needs subscribing to the log stream for background chats, whose cost must be evaluated first.
- **Engine unpacking / voice model download**: change `DshService`'s progress notification to a `ProgressStyle` Live Update, with the pet running along the progress bar.
- **Phone control waiting for confirmation**: let the confirmation dialog during control also turn the capsule into "To confirm".
- **Approving directly on the island**: follow the floating pet's rule, giving "Allow once / Reject" only when the full command is shown, and requiring unlock.
- **Vendor allowlists**: vivo and Xiaomi both require listing in their own app stores first, and OPPO needs enterprise certification. This is a business decision, not a technical problem.
