# dsh-go polish guide (2026-10)

Goal: go from "usable" to "refined". The temperament references Apple's system apps and the Claude app: **restraint, whitespace, clear hierarchy, motion that is handy without stealing the show, and copy that reads like a proper product**. Large changes to layout and components are allowed, but not to features and data flow.

## 1. Visual

| Rule | How to do it |
|---|---|
| Symmetry and equal spacing (hard) | A round button inside a capsule has equal spacing all around and is concentric with the capsule's ends; left/right counterparts mirror each other; adjacent floating controls have the same height (top bar 44); floating layers on the same level are equidistant from both screen edges (top bar / input area / floating capsule are all 12); a pill's left and right inner padding are equal, with optical compensation only when one side has an icon bringing its own whitespace. **Measure, don't eyeball**: write geometry tests for key layouts (see `app/test/chat/composer_geometry_test.dart`) |
| Hierarchy | One visual center of gravity per screen. Titles at weight 600, the rest 400–500. Use `DshColors.textTertiary` for secondary information; don't stack hierarchy by shrinking font sizes |
| Font size | Use only the theme `textTheme` tiers, creating few custom sizes. Numbers use `AppType.tabular` |
| Color | The primary color goes only to "tappable primary actions" and brand moments (the thinking capsule and the whale tail use the official blue `#4D6BFE`). Status colors express status only. Use neutrals over large areas. UI code always takes colors from the theme (`colorScheme`, `DshSurfaces`, `DshColors`, `NeutralTones.current`), writing no hex values and not referencing `DshPalette` constants; see §1.1 |
| Surfaces | Use the existing `GlassSurface` levels and `SheetGroup` card groups; no boxes within boxes; don't draw dividers when spacing can group |
| Icons | **Phosphor Regular** (1.5 stroke, round caps); selected / lit / on states use the same-skeleton **Fill**; stop, and play / pause in replay inside solid round buttons also use Fill, while actions in rows and capsules always use outline. Use them only through `AppIcons.<role>` (`app/lib/ui/theme/app_icons.dart`), named by role; **writing `Icons.*` directly is forbidden** (`test/icons/app_icons_test.dart` will block it). If a role is missing add a row to `AppIcons` and then run `tool/make_icon_font.py`; for what Phosphor lacks, draw it following its grid and `*-slash` convention. Settings rows use a 32 round background with an 18 icon; floating round buttons 44 / icon 22; the reply action bar 20 / `textTertiary`; icons in the same column share the same size |
| Empty state / loading / error | All need a designed look: one graphic + one sentence + at most one button. For loading prefer a skeleton or a quiet small ring, not a full-screen spinner |
| Narrow screens and large fonts | At 360dp width and system font scale 1.3, don't wrap into vertical stacks or overflow (when a control like `SegmentedPill` doesn't fit, wrap it below the title) |

### 1.1 Color scheme system (Settings › Theme)

A color scheme = two light/dark tone ramps of the accent + which hue the neutrals are tinted toward + the neighboring color of the bottom-left glow (`AppAccent`, `app/lib/ui/theme/accent.dart`). All are derived in OKLCH: the same lightness looks equally bright at any hue, so only hue and chroma change and the contrast lands in the same tier.

**Presets** (the order is the order on the settings page; colors light / dark)

| Preset | Hue · accent chroma | Primary | Neutral | Character |
|---|---|---|---|---|
| Mist blue (default) | 267° · 0.125 | `#4B67B4` / `#97B1F0` | 266° · ×1 | The DeepSeek hue desaturated once, kept as is |
| Daiqing (dark teal) | 238° · 0.085 | `#236185` / `#8CB9D7` | 238° · ×0.9 | Ink blue leaning teal, a notch deeper than mist blue (L 0.47) |
| Dusk purple | 300° · 0.075 | `#726291` / `#B8ABD2` | 295° · ×0.85 | Gray-toned lavender, the glow paired with dusty rose |
| Turquoise | 186° · 0.068 | `#34766F` / `#8DBEB7` | 190° · ×0.7 | Low-saturation teal-green; the neutrals carry only thirty percent of the teal so they don't turn green |
| Amber | 70° · 0.082 | `#8D6636` / `#CCAC87` | 75° · ×0.75 | A restrained gold-brown; the page becomes off-white paper and dark becomes warm charcoal |
| Graphite | 262° · 0.008 | `#2C2E32` / `#E5E8ED` | 262° · ×0.25 | Neutral gray, with the primary near-black in light and near-white in dark |

**Derivation rules** (the same ruler for every hue; back-deriving from the mist blue primary with it gives a per-channel error < 4/255)

| Role | Lightness L | Chroma (× accent chroma) |
|---|---|---|
| seed / pressed | 0.53 / 0.47 | 1 / 0.95 |
| container / onContainer | 0.93 / 0.33 | 0.26 / 0.70 |
| bubble / glow | 0.918 / 0.819 | 0.29 / 0.68 |
| seedDark / pressedDark | 0.764 / 0.704 | 0.76 |
| onSeedDark | 0.231 | 0.39 |
| containerDark / onContainerDark | 0.361 / 0.909 | 0.51 / 0.24 |
| bubbleDark / glowDark | 0.314 / 0.52 | 0.29 / 0.72 |

- White text on the light primary, and same-hue dark ink text on the dark primary.
- **Neutrals** (the page gradient, the surface ramp, each level of text, hairlines, shadows, code wells, terminal cards, the smoky gray of dark glass): the mist blue track is carried over as is to the scheme's hue with the chroma multiplied, **lightness unchanged**, so the text hierarchy and glass layering are the same in every scheme (`NeutralTones`). Light glass itself is white and its highlights are white, not tinted.
- The accent chroma cap is 0.13 and the page neutrals' chroma is < 0.025: whatever scheme, it's "a quiet gray plus a little color".
- **Not changing with the scheme**: brand graphics (the whale tail, the thinking capsule's official blue), semantic colors (success / warning / error / info), dusk purple tertiary (planning), identity colors, tool category colors, ANSI, the role hues of code highlighting, chart category colors. The hue of these colors is itself the meaning.

**Custom and follow wallpaper**

- Custom: a hue bar + 6 recommended colors (coral, rouge, ochre, moss green, lake blue, indigo). The picked color's hue, chroma (capped at 0.13) and lightness (limited to 0.30–0.60, with dark raised by another 0.234) are taken, the full set is derived per the table above, and then passed through the guard.
- Follow wallpaper: from Android 12 it reads the system `system_accent1_500` (`DynamicColorPlugin.kt`, channel `dsh/dynamic_color`), using the same derivation and the same guard as custom; on lower versions the row doesn't appear at all. It re-reads when the app returns to the foreground.
- Neutrals follow the same hue, with chroma scaled by the accent chroma (a near-gray color gives a near-gray page).

**Contrast guard** (`AppAccent.guard`)

- Requirement: the accent against the surface ≥ 3:1 (against the least favorable one: the light and dark `surfaceContainerHighest` respectively); text on the accent ≥ 4.5:1 (white text on light, dark ink text on dark).
- Method: hue and chroma stay, moving only along OKLCH lightness — toward dark for light, toward bright for dark — by 24 bisection steps, stopping at the lightness nearest the original that meets the requirement; used as is if it already does. When outside the sRGB gamut only chroma is reduced.
- The UI draws the guarded colors directly (swatches, the hue bar and recommended colors included), with no prompt shown.
- `test/theme/palette_contrast_test.dart` verifies the requirements above and the text hierarchy item by item for the six presets, a custom color at every 15°, and extreme picks such as pure white / pure black / pure gray / highly saturated primaries.

**Switching**: takes effect once chosen, with a cross-fade across the whole app (`AppMotion.standard`, switching directly when system animations are off); the scheme read at launch has no transition. Persisted in `state/appearance_state.dart` (`appearance.*`), and the appearance mode is still `theme_mode`.

## 2. Motion

- Duration 150–300 ms, curves from `AppMotion` (`std` / `enter` / `exit` / `collapseCurve`), always getting durations through `AppMotion.of(context, …)`: it automatically becomes 0 when system animations are off.
- Used for: press feedback (shrinks to 0.97), expand and collapse (size + fade-in), the first appearance of a list (fade-in + 8dp up, staggered item by item by ≤ 30 ms, only on first appearance), value changes (`AnimatedSwitcher` cross-fade), page and sheet transitions.
- Don't use: bounce / spring-back curves, continuously looping decorative animations (except progress indicators), parallax, large flashes.
- No animation may make the layout jitter; an animation that changes other things' positions (insertion, expansion) must either transition smoothly or have the pushed content move smoothly along.

### Fluid tier

Settings → Performance → **Fluid motion** (`AppMotion.fluid`). On by default, off by default on low-end phones and when hot, and always off when UI motion is turned off; when off the UI is exactly the same as without this tier. The "no bounce" above refers to the standard tier; the fluid tier allows a little bounce, with the rules:

- **Add only cheap effects**: translation, scaling, press glow. No blur, no persistent offscreen layers, no looping animations.
- **Bounce applies only to translation and scaling**, and opacity never exceeds 1; the amount of bounce uses the springs in `AppMotion`, not hand-written ones. The settle after following the finger uses `AppMotion.settle` to catch the finger's velocity.
- **Both tiers must hold**: a new effect first checks `AppMotion.fluid(context)`, and the standard tier takes the original path; the tree structure stays the same in both tiers, so subtree state isn't lost when switching.
- **Each effect has a matching power-saving measure**: the frame-skipping clock (`FrameClock`) lets an animation continue after a stall instead of jumping midway; a page being covered draws a snapshot while moving (`_Recede`), so glass doesn't re-sample every frame.
- The chat list doesn't bounce: bouncing doesn't send `OverscrollNotification`, which `OverscrollForwarder` depends on.

Existing effects: press glow (`AppInkGlow`, `rowSplash`), release bounce (`Pressable`), dialog pop-up (`showAppDialog`, which all new dialogs use), cards expanding into pages (`CardOrigin`, wired into `FeatureCard` / `OverviewCard`), light/dark revealed from the finger (`ThemeRevealHost`), bubbles rising from the composer (`StreamFadeIn.rise`), list bounce (`AppMotion.scrollPhysics`), segmented slider bounce, long-press lift (`HoldLift`), a check drawn in one stroke (`DrawnCheck`), rolling numbers (`RollingCount`), the send key flying out, list springy entrance (`FadeSlideIn`), drawer parallax (translation only, no scaling).

Streaming output: the body uses gpt_markdown's own reveal (`MarkdownBody.reveal`: steady speed, new characters fade in, only the tail is rebuilt; no cursor, and a breathing dot appears below during pauses), the list follows by gliding instead of jumping (`_ChatListState._startGlide`, handing control back immediately on scrolling up or holding), the thinking window slides up continuously (`_FluidTicker`), a running tool is a thin arc (`QuietArc`), and just after success a check is drawn and then goes quiet. No per-character bounce, blur, sweep light or celebration animation.

The approach references [Mochi Compose](https://github.com/feice11/mochi-compose) (Apache-2.0, borrowing only the approach, without copying code). [KhatKit](https://github.com/KhatKit/Android) is AGPL-3.0, so only the effects may be looked at, and code may not be copied.

## 3. Copy

| Rule | Example |
|---|---|
| Short, definite, product-like | ✗ "Tap here to view the detailed trace information of this turn" → ✓ "This turn's trace" |
| Delete explanatory long sentences | Keep subtitles ≤ 16 characters where possible; put explanations in a "Learn more" sheet or delete them. A setting's subtitle says only "what it is", not "why" |
| Use "you can / please / will / carry out" sparingly | ✗ "Please tap the button below to log in" → ✓ "Log in" |
| No internal jargon | Don't write RPC, projection, flavor, rootfs, carrier; technical names that must appear (DSH, SSH, API Key) are written as they are |
| Errors | One sentence: what happened + what to do. ✗ Stack traces / error codes go into "Details" |
| Punctuation | In Chinese use full-width punctuation; no period at the end of single-line labels and subtitles; the ellipsis is "…"; between Chinese and English no manual symbols other than a space |
| Buttons | Start with a verb, two to four characters (in Chinese): "Start", "Retry", "Go to settings" |

Unified terminology (UI text):

| Use | Don't use |
|---|---|
| chat (对话) | session (会话) ("Session details" becomes "Chat details") |
| this phone / remote host | local engine instance, Host |
| engine | DSH process, runtime |
| thinking effort | reasoning strength, effort |
| plugin / skill | extension |
| web version | Web UI |

## 4. Reusable components

`SegmentedPill`, `SettingsSegmentTile` (segmented selection) · `GlassSurface`, `GlassPill`, `GlassIconButton` · `SheetGroup`, `SettingsTile`, `SettingsSwitchTile` · `AppPage`, `showAppSheet`, `SheetHeader` · `TopFade` (a 16dp feather behind a solid background), `BackdropVeil` (the default page top-bar scrim) · `ThinkGlyph`, `WhaleTail`. Put new general components in a **new file** in `app/lib/ui/common/`, with a name that doesn't collide.

## 5. Acceptance

- For every changed page, regenerate the light + dark goldens and **look at the images**; key symmetric layouts have geometry tests.
- All existing behavior tests keep passing (when copy changes, update the assertions in the tests too).
- No changes to features, no changes to data flow, no removal of accessibility labels (`Semantics`).
