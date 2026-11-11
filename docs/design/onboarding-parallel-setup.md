# First launch: extract while setting up

> 2026-10-27. Answers the owner's question: on first launch with "This phone" chosen, extracting the runtime environment takes a minute or two of waiting; can the user finish the other settings while it extracts, reducing the felt wait.
> Scope: only the first launch (after choosing "This phone" in "Where does DSH run?"). The remote host path, upgrading / resetting the runtime environment, and "Install local runtime environment" in settings are all unchanged.

## 0. Conclusion

| Question | Conclusion |
|---|---|
| Can it run in parallel | Yes. Extraction isn't owned by the page to begin with: the native `RuntimeController`'s worker thread runs it, the `DshService` foreground service + wake lock keep the process alive, and progress goes into `localRuntimeProvider` from the EventChannel. Paging away or going to the background doesn't affect it; what's missing is just "who starts it, who displays it, when to wrap up" |
| New flow | Choose "This phone" → start extracting in the background immediately → **Appearance** → **Connect DeepSeek** → if extraction isn't finished, go to a quiet waiting page, and when it's done enter the home page directly. Steps go from 2 to 3, but steps 2 and 3 are done during the waiting time, and pure waiting drops from a minute or two to "the remaining stretch after settings are done" |
| How progress is visible | A fixed glass capsule at the bottom of the Appearance and Connect pages: `◔ Runtime 42%`. No popups and no blocking of operations; tapping opens a status sheet (progress / remaining time / log; on failure, retry / use a remote host instead / view log) |
| What if it finishes early | The waiting page: a large ring + percentage + remaining time, "Enters automatically when done"; when notifications are on there's an extra line "You'll be notified when it's done" — the user can leave directly and gets a notification when it's installed. It does **not** let the user into the app first (reasons in §4) |
| Account login needs the engine | DeepSeek account login goes through the local engine's callback and can't be done before extraction finishes. The Connect page shows "Log in with a DeepSeek account" as usual; tapping it during extraction switches the page to a waiting state "DeepSeek login will open automatically when ready", and login connects automatically once installed. An API key doesn't depend on the engine and can be saved any time |
| Interruption recovery | A new preference `onboarding_setup_step` remembers which page it got to; after the app is killed, re-entering returns to that page, and if extraction hadn't finished it restarts automatically (native clears staging and extracts from scratch, without changing the extraction format) |
| Native changes | Very small: when extraction finishes / fails and the app isn't in the foreground, a notification is sent, and the progress notification can be tapped to return to the app. There are unit tests (§7) |

## 1. Status quo

### 1.1 Flow

```
Welcome ─[Start]→ Where does DSH run?
   ├─[Remote host · Continue]→ Host list → select → Home
   └─[This phone · Continue]→ Extraction page (ring 0→100%) ─ about 40 s – 2 min, only watching ─→ Ready (0.9 s)
         → Connect DeepSeek ─[Account login]→ Start the engine (a few seconds) → browser authorization → Home
                        ─[Use an API key]→ Enter, save → Home
                        ─[Other providers / Set up later]→ Home
```

The step bar: choosing / extracting counts as step 1, Connect DeepSeek as step 2, 2 steps in all.

### 1.2 Time costs

| Segment | Time | What the user does |
|---|---|---|
| Extracting the rootfs (about 150 MB xz → 750 MB) | About 40 s – 2 min, depending on the model (copy says "First-time preparation takes about a minute or two", emulator log 41 s) | **Can do nothing**, staring at the ring |
| Starting the engine before account login | Cold start 2–3 s (emulator, `runtime-cold-start.md`), longer on a real device | Watching "Starting the engine" |
| Android 13 notification permission dialog | Once | Appears on the extraction page |

### 1.3 Who drives the extraction (from reading the code)

- **Start**: `RuntimeSetupPage._install()` → `LocalRuntimeController.install()` → MethodChannel `install` → `RuntimePlugin` first `startForegroundService(ACTION_INSTALL)` (foreground notification + wake lock), then `RuntimeController.install()` extracts on a single-thread worker.
- **Preventing duplicates**: two gates natively — in the plugin `phase == INSTALLING` returns `install_busy` directly; `RuntimeController.install()` checks once itself. The Dart side has no dedup, relying on the page calling only once.
- **Progress**: `RuntimeInstaller` reports `(done, total)` every 512 KB read → `emit(progress)` → EventChannel → `localRuntimeProvider.progress`; the same sink also updates the percentage on the foreground notification.
- **Remaining time**: estimated by sampling inside the `RuntimeSetupPage` page itself (page state, not shared).
- **Leaving the page / going to the background**: unaffected (worker + foreground service). The comment in the install page in settings says "Back key leaves any time, installation continues in the background, the notification shows progress".
- **Failure**: `phase = error`, `error = "install failed: …"` (insufficient space, verification failure, etc.); the page gives "Retry / View log / Use a remote host instead".
- **Killed by the system**: if the process dies, extraction dies; at next launch `installedVersion == null`, `phase == notInstalled`, and the root gate returns to "Where does DSH run?" and asks again. Only when the Activity is swiped away but the process is still there is `phase == installing`, returning to the extraction page to keep watching.

## 2. The new flow

```
Welcome ─[Start]→ Where does DSH run?
   ├─[Remote host]→ Host list → Home                                   (unchanged)
   └─[This phone · Continue]→ ① Start extracting in the background (foreground notification + wake lock; on Android 13 the notification permission is asked here)
         │
         ├→ Appearance (2/3)         Light/dark · palette (· low-end phones: lightweight mode)      Bottom capsule: ◔ Runtime 42%
         │     └[Continue]
         ├→ Connect DeepSeek (3/3)                                      Bottom capsule
         │     ├[Log in with a DeepSeek account] ─ Ready → log in as usual
         │     │                       └ Extracting → waits in the page "DeepSeek login will open automatically when ready" → ready → logs in automatically
         │     ├[Use an API key] → save ┐
         │     ├[Other providers] → save   ├→ Extraction done? Yes → Home
         │     └[Set up later] ──────────┘              No → waiting page → done → Home
         │
         └ Whenever extraction completes: the capsule ✓ once and then fades, and the engine starts in the background immediately (account login and saving other providers both need it)
```

Upgrade, reset and installing from settings: still the original extraction page → Connect DeepSeek (2 steps), not entering the parallel flow — those users are already configured and have nothing to parallelize.

### 2.1 What to configure in parallel

| Candidate | In or out | Reason |
|---|---|---|
| Connect DeepSeek | **In, put last** | The only truly necessary step. Account login depends on the engine, and putting it last lets extraction run as far as possible; an API key doesn't depend on the engine and can be saved any time |
| Appearance (light/dark, palette) | **In, put in the middle** | Depends on nothing; one tap changes the colors of the whole app instantly — the most "rewarding" thing during the wait; it reuses the same `ThemeModePicker` / `PalettePicker` as settings, so what the user later sees in settings is this same page |
| Performance mode | **Appears only on low-end phones**, merged into the Appearance page | On low-end phones "Auto" is already lightweight, and here it merely lets the user confirm: one "Lightweight mode" switch, on by default. On mid- and high-end phones "Auto" is the full effect, there's nothing to confirm, so no disturbance |
| UI language | Out | Defaults to following the system; the target users (Chinese / English) almost never get it wrong; Settings › Language can change it any time |
| Phone control | Out | It needs the local runtime environment ready and accessibility turned on in the system, so in onboarding only a block of explanation could be placed — against "one question per step, no piles of explanation". Entries exist on the empty chat page and in settings |
| Pets | Out | Needs the overlay permission (go to system settings) and is off by default in lightweight mode; it's in Settings › Theme |
| Visual replies | Out | On by default, and it can't be explained what it is before seeing a reply |
| Custom color / follow wallpaper / feature icons / desktop icons | Out | All in Settings › Theme; onboarding has only the six presets, which fit in one row even at 320 dp width |

Result: during the parallel period only one extra page (Appearance), and Connect DeepSeek was there already. 3 steps in total, 1 more than now, but pure waiting basically disappears.

### 2.2 Every page can be walked through

- **The Appearance page has only "Continue"** and no separate "Skip": options take effect on tap, the default (follow system · mist blue) is already in use, and pressing "Continue" without tapping anything is equivalent to skipping. Adding a "Skip" would only do the same thing as "Continue". This matches the iOS Setup Assistant's Appearance page (only "Continue").
- Connect DeepSeek keeps the original "Set up later" and "Other providers".
- The in-page waiting for login has "Cancel", returning to the Connect page where one can switch to an API key or set up later.
- The waiting page has no button to press and needs none: it enters automatically on completion; on failure it gives retry / use a remote host instead / view log.

## 3. Page wireframes

Sizes are for a 390 × 844 phone; all pages use `OnboardingScaffold` (a fixed 56 row at the top holds the step bar, the body has 24 margins left and right, max width 440, scrollable).

### 3.1 Appearance (step 2 of 3)

```
┌──────────────────────────────────┐
│             ━━━ ━━━ ───            │  Step bar 2/3
│                                  │
│  ▣                               │  Icon block (palette)
│  Choose an appearance              │
│  You can change it any time in Settings │
│                                  │
│ ╭──────────────────────────────╮ │  One group card
│ │ ┌────┐   ┌────┐   ┌────┐     │ │  Three samples: Light / Dark / Follow system
│ │ │    │   │    │   │  ▐ │     │ │  (drawn in the current palette, with a primary-color ring on the selected one)
│ │ └────┘   └────┘   └────┘     │ │
│ │  Light    Dark   Follow system    │ │
│ │   ●    ●    ●    ●    ●    ●  │ │  Six preset color dots (custom not included)
│ │  Mist blue  …                  │ │
│ ╰──────────────────────────────╯ │
│ ╭──────────────────────────────╮ │  Low-end phones only
│ │ Lightweight mode          ( ●) │ │
│ │ Fewer resident effects and less resource use │ │
│ ╰──────────────────────────────╯ │
│                                  │
│ (            Continue            ) │
│                                  │
│        ( ◔ Runtime 42% )           │  Capsule, fixed at the bottom
└──────────────────────────────────┘
```

Tapping any option cross-fades the entire onboarding page (background, button, capsule) with the theme — this page is itself the preview.

### 3.2 Connect DeepSeek (step 3 of 3)

The layout is the same as now, with an extra capsule at the bottom. When the keyboard is up (API key input), the capsule and its slot make way together so they don't compete with the keyboard for room.

### 3.3 In-page waiting for login (tapped "Log in with a DeepSeek account" during extraction)

```
│             ━━━ ━━━ ━━━            │
│                                  │
│              ╭─────╮              │  Ring 148, extraction progress
│              │ 42% │              │
│              ╰─────╯              │
│        Preparing the runtime environment      │
│   DeepSeek login will open automatically when ready │
│        48 / 120 MB · about 30 s        │
│                                  │
│ (            Cancel            ) │
```

This page is itself the progress, so no bottom capsule is shown. Once ready, it switches in place to the existing login state ("Starting the engine" → browser), without paging. If the app isn't in the foreground when ready: the browser isn't opened behind the user's back (Android doesn't allow launching pages from the background either, and the login would look abandoned), the engine starts as usual, and login opens the moment the user returns to the app (via the notification or the desktop icon). If extraction fails: return to the Connect page and pop up the status sheet automatically (§3.6).

### 3.4 Waiting page (settings all done, extraction not yet)

```
│                                  │  No step bar shown (not a step)
│              ╭───────╮            │  Ring 184
│              │  86%  │            │
│              ╰───────╯            │
│        Preparing the runtime environment      │
│          Enters automatically when done          │
│       103 / 120 MB · about 10 s       │
│                                  │
│          🔔 You'll be notified when it's done          │  When notifications are available; otherwise "Done entirely on this phone"
│              View log               │
```

It's the original extraction page with a different line of body text and a line at the bottom, familiar to the user and with zero new components. On completion: ✓ "Ready" 0.9 s → Home (starting the engine at the same time). On failure: the original failure view (red ring, reason, retry / view log / use a remote host instead).

### 3.5 Capsule

```
( ◔ Runtime 42% )     Extracting: a 16 dp progress ring + text, the percentage in tabular figures
( ◌ Preparing runtime )      Started, no progress yet: an indeterminate ring
( ✓ Runtime ready )    Done: stays 2.4 s then fades
( ! Install incomplete )       Failed: danger color, stays
```

- A glass capsule (`GlassTier.pill`), with equal padding all around (10); the progress ring concentric with the left semicircle.
- The slot is **kept all the time** on the pages of the parallel flow: after the capsule fades it doesn't collapse, so buttons don't jump under the user's finger.
- Tap → status sheet; screen readers read it as "Preparing the runtime environment, 42%".
- The text is short enough to fit even at 320 dp × 2× font size: Chinese at most 7 characters, and English `Runtime 42%` / `Runtime ready` / `Install failed`.

### 3.6 Status sheet (tap the capsule)

```
│               ━━                 │  Only a drag handle, no × (S9: `dismissal: drag`, pull down or tap the handle to close)
│              ╭─────╮              │  Ring 112
│              │ 42% │              │
│              ╰─────╯              │
│        Preparing the runtime environment      │
│     First-time preparation takes about a minute or two    │
│        48 / 120 MB · about 30 s       │
│              View log               │
```

On failure the ring turns red with an exclamation mark in the middle and the body is the reason ("Not enough storage: about 900 MB needed…"), with "Use a remote host instead" and "Retry" below: when both names fit on one line at half width they're side by side at equal width (Retry on the right); when they don't fit (English, 320 dp, large fonts) they're stacked at full width with Retry on top, and don't wrap inside half-width buttons — consistent with the system dialog's button rules. Below that "View log". While the sheet is open the state changes live (after a retry it changes straight back to progress).

## 4. When it finishes early: why a waiting page and not entering the app first

| Option | Pros | Problems |
|---|---|---|
| Enter the read-only parts of the app first | Looks like no waiting | A freshly installed app has no chats and no workspaces, so there's almost nothing to "browse"; the composer accepts typing but can't send, and the first impression is "broken"; everywhere on the home page would need to handle the new state "runtime still installing", with a large change surface and high risk |
| **Waiting page + a notification even if you leave** (adopted) | Quiet and predictable; remaining time is generally only tens of seconds; leave if you want and get a notification when it's done | The user does have to wait for the remaining stretch |

When settings are done, extraction is usually already past halfway (Appearance takes ten-odd seconds, Connect DeepSeek tens of seconds), so the remaining wait is short. On slow models more remains, which the notification covers: the waiting page says "You'll be notified when it's done", and the user can go back to the desktop.

The notification is sent only when the app is not in the foreground (when in the foreground the waiting page enters the home page itself), and tapping it returns to the app. When the notification permission is off, the waiting page doesn't write that line (not promising what can't be done), and uses the original "Done entirely on this phone" instead.

## 5. How completion / failure / finishing early look

| Moment | Appearance / Connect pages | In-page waiting for login | Waiting page |
|---|---|---|---|
| Extraction complete | The capsule ✓ "Runtime ready" fades after 2.4 s; the engine starts in the background | Login begins in place (start the engine → open the browser); when the app is in the background, wait for the user to return before opening | ✓ 0.9 s → Home |
| Extraction failed | The capsule turns red "Install incomplete", without interrupting the current page; tap to open: retry / use a remote host instead / view log | Returns to the Connect page and automatically pops up the failure status sheet | The original failure view: retry / view log / use a remote host instead |
| Settings finish first | — | — | Enters the waiting page |
| Completes / fails while the app is in the background | A notification "Runtime ready" / "Runtime install incomplete", tapping returns to the original page | Same as left | Same as left |

"Use a remote host instead" goes to the original host list; selecting a host enters the home page, and both the appearance and any saved API key are kept (harmless).

## 6. Revisiting and interruption recovery

A new preference `onboarding_setup_step` (`appearance` / `connect` / `finishing`): written as `appearance` on choosing "This phone", updated on entering each page, and cleared on entering the home page or switching to a remote host. Without it, it's the original behavior, so users who upgraded in the middle from an old version are unaffected.

| When interrupted | Process | After re-entering |
|---|---|---|
| Appearance / Connect page, extracting | Only the UI was swiped away, process still there (foreground service) | Return to that page, and the capsule keeps showing the same extraction's progress |
| Appearance / Connect page, extracting | Process killed | Return to that page, **extraction restarts automatically** (native clears staging and extracts from scratch), and the capsule runs from the beginning |
| Appearance / Connect page, already extracted | Any | Return to that page, and the capsule doesn't appear |
| Connect page, with an API key / already logged in / chose later | Any | Go straight to the waiting page (unfinished) or the home page (finished) |
| Waiting page | Any | Unfinished: the waiting page (re-extracting if necessary); finished: the home page |

The extraction format isn't changed, so there is no resume from a breakpoint: being killed means starting from scratch, which is existing native behavior.

### 6.1 Extraction uninterrupted, not repeated, and progress with a single source

- Extraction is still executed by the native worker + foreground service, and paging and going to the background can't touch it.
- A single new Dart entry `runtimeInstallProvider.install()`: only one request is in flight at a time, and a second request gets the same Future; native `install_busy` is still the second gate. The root gate (choosing local, resuming extraction on re-entry), the waiting page, and retry after failure all go through it.
- Progress is read only from `localRuntimeProvider`; the remaining time moves from page state to `installEtaProvider`, and the capsule sheet, the waiting page and the in-page waiting for login show the same number.
- Who starts the engine after completion: the root gate listens for "runtime environment ready", and in the parallel flow as soon as it's ready it calls `EngineControl.ensureStarted` (the same as what the extraction page used to do when it ended, only no longer waiting on the page).

## 7. Native changes (small)

| Change | Location | Why |
|---|---|---|
| When extraction ends, if the app isn't in the foreground and notifications are available, send "Runtime ready · tap to continue setup" / "Runtime install incomplete · tap to view" | `DshService` `ACTION_INSTALL_DONE`; the decision logic extracted as the pure function `InstallAlert.choose()` | The waiting page promised "You'll be notified when it's done" |
| The install result rides along with `ACTION_INSTALL_DONE` (`ok`) | `RuntimePlugin` | The item above needs to know success or failure |
| The extraction progress notification is tappable and returns to the app | `DshService.buildInstallNotification` | Currently tapping does nothing |
| A new notification channel "Runtime environment" (default importance, with sound, no banner) | Same as above | The existing low-importance channel is too quiet, and the "Engine stopped" channel has the wrong name |

Unit tests: `InstallAlertTest` (none in the foreground, none when notifications are off, what is sent on success / failure).

## 8. Acceptance

- Every step of the new flow, skipping, extraction completing / failing between steps, finishing early into the waiting page, the in-page waiting for login connecting, resuming on re-entry, and the remote host path being unchanged: `test/onboarding/parallel_setup_test.dart`.
- Capsule padding equal all around, progress ring concentric with the end, the slot not changing with fading; no overflow of the Appearance / Connect / waiting pages at 320 dp × 2× font size: `parallel_setup_geometry_test.dart`.
- Goldens (light and dark): the Appearance page, the Appearance page (low-end phone), the Connect page with the capsule, in-page waiting for login, the waiting page, the capsule failure, the status sheet (progress / failure), the English Appearance page: `parallel_setup_golden_test.dart`.

## 9. Needs the owner's decision

1. The Appearance page has only "Continue", with no separate "Skip" (§2.2).
2. When it finishes early the user isn't let into the app first; a waiting page + a notification even if they leave is used (§4).
3. Performance mode appears only on the low-end phone's Appearance page (§2.1).
4. The new notification channel "Runtime environment" uses default importance (it rings once); if it should be quieter, it can be changed to low importance.

## 10. Addendum (2026-10-28): enabling permissions by feature

After Appearance and before Connect DeepSeek, one more step, "What would you like JDK-Go to help you do", is added, making the parallel flow 4 steps (Choose → Appearance → Features → Connect). It is also during extraction's waiting time and doesn't lengthen first launch; it appears only on first launch for the local phone, and remote hosts, upgrades and resets don't go through it.

```
Feature multi-select (none ticked by default, skippable) → enable item by item (one at a time, auto-detected on returning to the app) → summary → Connect DeepSeek
```

| Feature | Items used (deduplicated in the order walked) |
|---|---|
| Read and write files on the phone | File access (when ticked, first passes "Let AI access phone files?") |
| Desktop pet and overlay | Display over other apps |
| Phone control | Notifications, accessibility (when ticked, first passes the prominent disclosure; restricted settings go in three steps by system state), pop-ups from the background (vivo, Xiaomi) |
| Keep running in the background | Notifications, ignore battery optimization, vendor background switches (vivo high background power use / Xiaomi power-saving policy / Huawei and Honor app launch management / OPPO background behavior), auto-start (vivo, Xiaomi) |
| Voice input | Microphone; before ticking it states the model of about 241 MB and prompts about data usage on mobile data; the choice is written to `onboarding_wants_voice` |

- Ticking "Phone control": after the prominent disclosure, a confirmation mode is chosen once more, one of two with no preselection — "Ask me at key steps" (`ask`) or "Fully automatic" (`always`; on selection it explains that system settings and permission pages, passwords and verification codes, and JDK-Go itself are still operated by the user, banking and payment apps are not touched by default, and that going to Settings › Phone control › Lift limits can loosen this). Closing the selection box means it isn't ticked. On pressing "Enable selected" it writes phone control's policies (the same `setPolicies` as Settings › Phone control › Confirmation mode); if it can't be written it's kept in `phone_confirm_pending` and written again at the summary page's "Continue", at the next launch, and when the phone control page is opened. The three "Lift limits" switches don't appear in first launch.
- Items that can be detected are re-read when returning to the app, and when enabled they tick and move on to the next; vendor switches don't report state to the system, so after the user has gone there they tap "I've set it up", and the state is recorded as "Went to settings", not treated as enabled.
- When "Continue" is pressed on the summary page (re-reading on the spot, so ones enabled additionally in the summary count too): "Access phone files" is turned on only if the files are reachable, the phone control master switch is turned on, and "Show outside the app" is turned on only if the pet can be drawn; if the engine is running or starting (the old settings were taken along at startup) it restarts only once.
- Returning to the same step after being killed: the selected features and skipped items are stored in `onboarding_access`, cleared only when "Continue" is pressed and the settings above have been written.
- Settings › General › System permissions is the same list, grouped by feature, and tapping a row not yet enabled goes into the same single-item page.
- Code: `lib/state/access_state.dart`, `lib/ui/access/`, `lib/ui/onboarding/access_step.dart`; the vendor page table is in `VendorSettings.kt`, and the restricted-settings state in `RestrictedSettings.kt`.
