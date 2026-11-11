# The phone control floating bar (ball · capsule · card)

The control bar that floats above other apps while DSH operates the phone through the accessibility service. The code is in `app/android/app/src/main/kotlin/io/github/ccch1mneyyy/dsh_app/phone/a11y/`: `ControlOverlay.kt` (windows, the confirmation card, the handoff card, and orchestration between forms), `OverlayCapsule.kt` (capsule and card), `OverlayBall.kt` (ball), `OverlayLook.kt` (colors, shapes, markers), `OverlayModel.kt` and `FoldClock.kt` (pure-Kotlin state and sizes, covered by JVM unit tests).

## 0. Conclusion

One control, three forms; it is the same object changing shape:

- **Capsule** (default): one line of "what is being done" + pause / stop. Solid surface, doesn't fade.
- **Card** (tap the line of text on the capsule): the capsule grows a second layer downward — target app, no-confirm, recent steps, lifted limits, interjection, collapse to ball.
- **Ball** (tap the marker at the capsule's left end): says only the state, snaps to an edge, draggable, fades when idle.

Stop is one step away in any form: the right end of the capsule and card is always **Stop**; the ball **stops directly when held for 1 second** (screen readers have a "Stop DSH's operation" action).

## 1. The three forms

| Form | Size | Content | How in / out |
|---|---|---|---|
| Ball | Diameter 48, 10 left around the window for the shadow; 12 from the screen edge, default on the right at 30% height | The state marker (see §3), and a brick-red dot at the top right when limits are lifted | Tap the marker at the capsule's left end or the card's "collapse to ball"; with "auto-collapse when idle" on, the capsule collapses after 3.5 s idle. Tapping the ball returns to the capsule (not directly to the card) |
| Capsule | Height 48, width follows this line of text: narrowest 120, widest "screen width − 24" and ≤ 400, rounded to 8; top centered, 6 below the status bar | Marker · this line of text (maybe preceded by a lock) · ⌄ · pause · stop | Appears when the task starts; the card retracts after 8 s idle; confirmation, handoff and stopped retract the card to the capsule |
| Card | Width same as the capsule's widest; height by content (typically around 300) | Header on the same row as the capsule; below: app · no-confirm, recent steps, lifted limits, interjection box, collapse to ball | Tap the capsule's line of text; retracts to the capsule on tapping that line again, after 8 s idle, and on confirm / handoff / stop; stays open while typing |

All forms use one corner radius 24: the capsule's ends, the card's four corners and the ball are the same curve, so corners don't re-bend when morphing. The card is slightly rounder than the page spec's card (20) to be continuous with the capsule ends.

### The capsule's width

The width follows this line but doesn't follow its jitter: a longer line widens immediately (240 ms, `glide`); a shorter line must persist for 1.2 s before narrowing, and only narrows when it's at least 24 dp narrower. When the agent alternates every second between "Looking at the screen" and "Tap '…'", the width stays stable. At the widest, the end is truncated with an ellipsis.

### The card's content (top to bottom)

1. Header: the same row as the capsule, with ⌄ turned into ⌃.
2. App · no-confirm (12, tertiary text), right under the header line like its second line.
3. Recent steps: at most 3 (1 on short screens), newest on top; hung on a thin timeline below the marker. Only actions are recorded (tap, input, scroll, key), not "Looking at the screen"; and the one identical to the header isn't repeated.
4. Lifted limits (when any item is lifted): light brick-red background, "Limits lifted" in bold, the next line says which items were lifted, and "View ›" on the right opens `dshgo://open/phone-unlocks`.
5. Interjection box: takes the keyboard only after a tap (the window wasn't focusable before); once there's text the send key becomes a primary-color circle. After sending it retracts to the capsule, and that line shows "Sent to DSH: …" for 2.5 s.
6. Collapse to ball: with a line "Hold the ball for 1 second to stop directly", teaching the ball's stop gesture.

## 2. Information hierarchy

- **The capsule says only what's being done.** The status line given by the core is "No confirm · DSH is operating · tap 'Send'"; the capsule itself is DSH's, so it shows "Tap 'Send'"; the prefix is stripped per the core's own format (`phone_waived_status`, `phone_acting`, in the app language), so it matches even when the language changes. Non-action lines like "DSH is looking at the screen" are shown as is.
- **No-confirm** drops to the first line of the card.
- **Lifted limits** no longer take a segment of text in the capsule: the capsule only puts a brick-red open lock (14) before this line, and the ball has a brick-red dot at its top right; the full explanation and the entry are in the card.
- When paused this line is "Paused" and the pause key becomes a primary-color ▶; when waiting for confirmation it's "Confirm below" and the marker becomes three dots; after stopping it's "Stopped", the keys retract, the capsule shrinks, and the whole thing leaves after 4 s.

## 3. Visual

| Item | Rule |
|---|---|
| Surface | Solid, with the app's glass chrome layer's non-blurred fill made opaque: light `#FDFDFF → #F5F7FC`, dark `#2C313C → #262A34`, the gradient only within the header's 48 of height, so the lower part of the card doesn't darken |
| Edge | 1 dp hairline stroke (light cool ink 10%, dark white 10%) + a highlight on the top edge (light white 90%, dark white 14%, fading out by 1/3 of the height); in dark it separates from the black background with it |
| Shadow | Capsule and card elevation 6, ball 5; on API 28+ the shadow is tinted with the app's cool ink color (`#0B152D`), not pure black |
| Text | Header 14 medium weight, primary text color (≥ 13 : 1 against the surface); card steps 13 secondary color; notes 12 / 11 tertiary color (≥ 4.6 : 1) |
| Keys | Touch area 48×48; visible circle 36, concentric with the capsule end (6 all around). Pause: neutral light background + ink double bars; resume: primary light background + primary ▶; stop: brick-red light background + brick-red square. 4 between the two keys (16 between visible circles). On press it shrinks to 0.92 + ripple |
| Marker | 22 square: when working, a thin primary ring + dot, the ring breathing once per 2.4 s; paused is two vertical bars; waiting for confirmation is a primary ring + three dots; stopped is a rounded square |
| Not done | Text outlines (the old `HaloText` has been deleted); making the capsule and card translucent as a whole |

Colors take the default scheme mist blue (`app/lib/ui/theme/palette.dart`, `surfaces.dart`), and the danger color is the app's low-saturation brick rose, not M3's pure red.

## 4. Motion

All follow the system animation scale; with "remove animations" the forms switch directly and the breathing stops at a full ring.

| Change | How it moves | Duration / curve |
|---|---|---|
| Appear | Fade-in + down 6 + 0.96 → 1 | 220 ms, emphasized |
| Capsule → card | The same surface grows downward and to both sides to card size; the header row follows the surface's width, with the stop key moving along the right end; the second layer fades in over the last 70% and moves down 6; ⌄ rotates to ⌃ | 340 ms, emphasized |
| Card → capsule | The reverse, with the second layer fading out over the first 40% | 340 ms, emphasized |
| Capsule → ball | The surface collapses into the circle at the end nearer the docking side (a card first collapses into the circle at the header end), the row content pinned in place and clipped by the outline, fading out over the first 40%; once collapsed into a circle, the ball takes over at the same position, the marker fades in, then slides to the docking position | 340 ms + 260 ms glide |
| Ball → capsule | The ball slides back to the capsule end and the marker fades out; the capsule window is already prepared as a transparent circle when the ball sets off, and after arrival grows from the circle back into the capsule, with the row content fading in over the second half | 220 ms glide + 340 ms |
| This line changing text | Old text fades out in 70 ms, new text fades in in 160 ms; for width see §1 | |
| Marker changing state, pause ↔ resume | Cross-fade + 0.7 → 1 | 160 ms |
| Ball idle | The whole ball fades together to the "opacity when idle"; a touch restores it in 120 ms | 400 ms |

At handoff the two windows overlap for about 3 frames (48 ms), and both are the same circle, so there's no flicker.

## 5. Interaction

| Where | Action | Result |
|---|---|---|
| Capsule / card | Tap the marker at the left end | Collapses to a ball (kept for this task until the ball is tapped) |
| Capsule | Tap this line (including ⌄) | Expands the card |
| Card | Tap the header line | Retracts to the capsule |
| Capsule / card | Pause / resume | While paused the driver rejects every action until resumed |
| Capsule / card | Stop | Stops immediately, and any pending confirmation and handoff are answered "stop" |
| Card | The lifted-limits row | Opens the app's lift-limits page |
| Card | Interjection box | Takes the keyboard; back key or tapping outside the window collapses the keyboard |
| Ball | Tap | Expands into a capsule |
| Ball | Drag | Follows the finger, snapping to the nearer side on release (a fast flick follows the flick direction), the position is remembered and is still there for the next task |
| Ball | Hold still for 1 second | Stop (see §6) |

## 6. Stop: one step away in any form

DSH is moving the user's phone, and it must be possible to stop it at once at any time:

1. **Capsule and card**: the stop key is always at the far right of the header, in the same position and look in both forms, not in a menu and not needing expansion first. The stop key has no injection-guard interception (stopping is the safe direction), but while the agent injects gestures all floating windows are untouchable, so it can't tap them.
2. **Ball**: **hold for 1 second to stop**. After 0.3 s of pressing (shorter than the system long-press of 0.4 s) a brick-red progress starts being drawn around the marker's ring, and when it completes a full circle (1 s in total) it vibrates once and stops; releasing midway cancels (neither stops nor counts as a tap); moving the finger beyond the system touch threshold is a drag and never becomes a stop. The timing advances by frame callbacks on the real clock, independent of animation, so it works the same with "remove animations"; if the main thread is so busy it misses that frame, the stop is also made up on release. The ball can also be **tapped once to expand**, with stop at the right end of the capsule.
3. **Screen readers**: the ball carries a "Stop DSH's operation" custom action (in TalkBack's actions menu), stopping in one step.
4. Other entry points are unchanged: "Stop operating" on the engine notification in the notification shade, screen off, lock screen, and accessibility service disconnect.

After stopping, the capsule shows "Stopped" (the ball shows a square), and if the core has no new state within 4 s the whole thing leaves.

## 7. Idle and settings

- **Opacity when idle** (Settings › Phone control › Floating bar, 30–100%, default 70%) now applies only to the **ball**: if nobody touches the ball for 3 s it fades as a whole to this opacity. The capsule and card don't fade — they carry this line of text, and translucency would make the text hard to read over the page; to make them move out of the way, collapse to a ball.
- **Auto-collapse when idle**: the capsule collapses to a ball after 3.5 s idle; it expands automatically on confirmation, handoff and interjection.
- During actions the screen stays on (`FLAG_KEEP_SCREEN_ON`), and when this round of the reply ends the control is certain to close.

## 8. With the confirmation card and the handoff card

- The confirmation card is at the bottom of the screen and the capsule at the top, so they don't block each other. When a confirmation appears, the card first retracts to the capsule (to avoid two cards competing for attention), and the capsule shows "Confirm below"; an auto-collapsed ball expands, a manually collapsed ball stays, with the marker turning into three dots.
- The old-path handoff card is at the top, and when it appears the capsule and ball both make way, returning to the capsule afterwards.
- The confirmation card and handoff card (the old path in `ControlOverlay`) were switched to the same solid surface and colors; the shared `PhonePromptUi` card is unchanged.

## 9. Accessibility

- Every key has a description: the marker "Collapse to ball", this line reads out the current content and carries the tap hint "Expand details / Collapse details", pause "Pause DSH's operation" / "Let DSH continue operating", stop "Stop DSH's operation", and the ball reads by state "DSH is operating the phone, tap to expand, hold to stop" and so on. The keys' role is button.
- On pause, resume and stop the new state is spoken once; ordinary status lines aren't spoken (they change every second).
- The copy is all in `res/values*/phone_a11y_strings.xml`, taken by app language (`AppStrings`).

## 10. Verification

- JVM: `FoldClockTest` (three-form switching, idle, various waits), `OverlayModelTest` (stripping the status-line prefix, recent steps, the stop key always rightmost and ≥ 48, width rounding and debouncing, tap / cancel / drag / make-up stop of hold-to-stop), `BallGeometryTest` (the ball against the capsule end, docking margin).
- Emulator (API 35, 1080×2400, 420 dpi): the debug probe `A11yProbe`'s `form` / `press` / `unlocks` / `app` / `freeze` / `state` commands can bring up every form and state without a full task, and light/dark, landscape, animations off, interjection typing and hold-to-stop were all viewed on the emulator.

## 11. Needs confirmation on real devices

- On Chinese ROMs (vivo OriginOS and others), whether `TYPE_ACCESSIBILITY_OVERLAY` shadows, corner-radius clipping and window size changes match native.
- Conflicts between the ball's edge snapping and dragging and the system edge-back gesture.
- The feel of hold-to-stop (whether 1 s is suitable), and whether the ROM intercepts vibration on floating windows.
- When the ball is dragged to the bottom it may cover the buttons of the bottom confirmation card (windows of the same app don't trigger obscuring interception, but visually they do block).
