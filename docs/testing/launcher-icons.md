# Launcher icon switching and emulator verification

The first time switching from the default mist blue to another icon, the original default entry stays temporarily until returning to the launcher. Android closes tasks that were opened through an explicitly disabled component, so it can't be disabled while that task still shows the app, a browser login page or a file picker. Switching doesn't actively rebuild the Activity; switching between non-default entries uses `DEFAULT` to restore the manifest's disabled state, keeping the current page.

`LauncherIconPlugin` checks the cleanup conditions right after Stop / Destroy; each `set` completion also checks once, covering the race of pressing Home first and finishing the background switch afterwards. It re-checks at startup and on a new task's Resume, handling the case where the process ended between two component writes. The recovery plan prefers a legal saved choice, covering restarting right after switching, when PackageManager's asynchronous component write hasn't landed on disk; `current` still reports the entry actually enabled, and doesn't falsely report success when a write hasn't completed. A stale Recents card (`numActivities=0`) doesn't block cleanup. It keeps waiting while the screen is locked or off, when another app is on the default-entry task, or when the task top can't be determined; closing the external page and returning to the launcher again completes it. Tapping the old default entry to start again still has to wait until that task leaves the foreground.

Rapid consecutive choices are written in order by a serial worker; each cleanup re-reads the last choice and doesn't keep a stale target. After the original mist-blue entry is disabled, returning to mist blue uses `LauncherMistAlt`. The entry count returning to 1 and the OEM launcher cache refresh are two different things; this test records the components, the Launcher query and screenshots separately, and doesn't force-stop the launcher to hide cache problems.

## Debug probe

Installing a normal debug app is enough; use the complete app entry to verify the page is kept. The probe is registered dynamically only under `FLAG_DEBUGGABLE`, and the broadcast sender must also hold `android.permission.DUMP`. Release builds don't register it. The commands below are for dedicated emulators only; they must not be used on a user's phone.

```bash
export ANDROID_SERIAL=emulator-5556
pkg=io.github.ccch1mneyyy.dsh_app
probe() { adb shell am broadcast -a "$pkg.ICON_PROBE" -p "$pkg" "$@"; }
# First open the app normally, then call the same onMethodCall("set") as Dart, not pm enable/disable.
probe --es cmd state --es seq before
probe --es cmd set --es id night --es seq night
adb shell input keyevent KEYCODE_HOME
probe --es cmd state --es seq home
adb logcat -d -s DshIconProbe:I '*:S'
adb shell cmd package query-activities --brief --components -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -p "$pkg"
```

Each `DshIconProbe` JSON contains `seq/status/current/enabled/states/tasks`, plus `activity/engine/foreground/destroyed/task`. `states` is PackageManager's raw state (0=DEFAULT, 1=ENABLED, 2=DISABLED), and `enabled` computes the effective entries from the manifest defaults. Without `status=ok`, a switch can't be regarded as successful. `state` only reads; cleanup comes from the real lifecycle or `set` completion.

To redo a case from the default entry, first force-stop the app in the emulator, then use `pm default-state` to restore the five aliases to the manifest state, and start from `LauncherMist`. This is only a test precondition, not switching verification. Don't clear data, or the page, chats and other probe configuration will be lost.

```bash
# API 35 may require root for the fixture-only component reset.
# Save chosen=mist through the probe before force-stop, then reset aliases.
probe --es cmd set --es id mist
adb root
adb wait-for-device
adb shell am force-stop "$pkg"
for alias in LauncherMist LauncherMistAlt LauncherNight LauncherFrost LauncherInk; do
  adb shell pm default-state --user 0 "$pkg/.$alias"
done
adb shell am start -n "$pkg/.LauncherMist"
```

## Paths that must be recorded

| Path | Foreground / intermediate state | Final effective entry |
| --- | --- | --- |
| Default mist blue → night → Home | After the switch returns it is still the same Activity and the same engine; Mist + Night | Night |
| Default entry, consecutive night → frost → ink → Home | Always at most Mist + the latest choice | Ink |
| Default entry night → frost → mist → Home | Returning to mist blue cancels the delay | Mist |
| Night → Frost → Mist | No wait needed, Activity unchanged | MistAlt at the end |
| Swipe away from recents after set | Stop / Destroy triggers cleanup | The latest choice |
| Open the file picker, set, then Home | DocumentsUI on top of the original task; protects that task and the picker | Two remain temporarily; after returning to the picker and pressing Back, Home again leaves the latest choice |
| Force-stop / restart right after set | Next start recovers according to the actual tasks; after Resume via the new entry the old task can be cleaned up | The latest choice; if the old entry is reopened, wait for Home |
| Screen off / lock after set | Keep the page after unlocking | After unlocking and Home, the latest choice remains |

For an external Activity, use `probe --es cmd picker` to open the system DocumentsUI from the current MainActivity; confirm `tasks[].top` is an external package and `base/orig` is the default alias, then `set`. If the system picker opens a separate task, that run can't prove protection of an external page in the same task, and a real browser Custom Tab should be used instead.

The Destroy fallback can use `probe --es cmd finish`, and a real Recents swipe-away must also be run. After returning to the app, verify the page still keeps input and scroll position, and the `dsh/app` time zone method and ordinary settings still work; an unchanged engine identity is only auxiliary evidence.

To reproduce the Home-versus-worker race stably, first restore the default entry, then run:

```bash
probe --es cmd hold --es seq gate
# Confirm gate / held in logcat. The gate holds for at most 8 seconds, to avoid hanging the worker in tests.
probe --es cmd set --es id frost --es seq raced
adb shell input keyevent KEYCODE_HOME
probe --es cmd release
probe --es cmd state --es seq raced-home
```

`raced` should return success, and `raced-home.enabled` should contain only Frost. In the old implementation, Stop couldn't see the deferred flag set slightly later, and without a next Stop two entries would stay forever.

## Verification levels

The pure-JVM `LauncherIconsTest` covers the cleanup policy above, rapid selection, unknown top and empty Recents cards, but can't replace Android lifecycle, component management and launcher cache verification. Gradle integration compilation, full-app emulator runs and vivo launcher verification should be recorded separately, and pure tests or manual `pm` state writes must not be written up as evidence of an actual fix.

Restart cases should start the currently effective entry through a system MAIN/LAUNCHER query, and must not hardcode starting a target alias that may have been rolled back to disabled. If only Mist remains, after opening the saved target should be restored and converge to a single entry after Home. An immediate adb restart is also used to simulate the boundary where the component write hasn't landed on disk.
