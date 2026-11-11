# dsh-go page design plan v2

> 2026-10-24. To be used together with [polish-guide.md](polish-guide.md) (the rules): that one covers "how to make each part", this one covers "what the whole looks like".

## 0. Problem and direction

What's not elegant now is not at the level of individual controls, but the **lack of a unified page skeleton and visual rhythm**:

- Almost every page is "big title + groups of settings rows", with no primary/secondary distinction, like flipping through a config file;
- The icon background colors are a different color per row, like a rainbow, stealing attention from the text;
- Explanatory text is plentiful and long, so pages read like a manual;
- There's no "protagonist of this page": status, data and content aren't highlighted and are buried in rows.

Direction in one sentence: **let the content be the protagonist and the interface step back**. Like the Claude app: lots of whitespace, clear text hierarchy, color only where attention is needed; like Apple's system apps: each kind of page has a fixed skeleton, so a user switching pages still knows where things are.

## 1. Five page skeletons

Every page falls into one of these five. Pages with the same skeleton must have a consistent top, spacing and way of grouping.

| Skeleton | Used for | Structure |
|---|---|---|
| **A Hub page** | Settings home, All features | Big title → **overview card** (the most important status of this page, see §3) → groups. Group titles small and pale; rows carry icon backgrounds |
| **B Detail page** | Chat details, engine, plugin details, automation task details, host details | **Header** (`PageHero`: graphic + title + one line of status + 2–3 data points) → pill tabs (`SegmentedPill`, optional) → content cards. The header collapses into the top bar on scrolling |
| **C List page** | Automations, background tasks, plugin market, skills, app list, action log, remote hosts | Big title → pill filter (optional) → list. Uniform row anatomy: 32 graphic on the left, main title one line, subtitle one line, meta info or status dot on the right. When empty use `EmptyView` |
| **D Form page** | API key, SSH host, relay login, fill-in steps in onboarding | Title + one sentence → grouped inputs → **primary button fixed at the bottom** (sticking to the keyboard when it's up). Errors shown in place under the field |
| **E Sheet** | Model choice, host switching, usage, artifact menu, update, confirmation kinds | Drag handle → title row (title left, close right, both vertically centered) → content → at most one primary button. Corner radius 28, content 20 left and right |

## 2. Navigation and information architecture

| Position | Now | Changed to |
|---|---|---|
| Home | Chat | Unchanged: chat is home |
| Drawer top | Brand + host capsule, search, new chat | Brand + **new chat button** (a prominent primary-color capsule, the only primary color in the drawer) → search |
| Drawer middle | Chat list | Grouped by time (Today / Yesterday / This week / Earlier), with pale group titles; the current chat has a soft selected background; a running chat has a breathing small dot at the end of its row |
| Drawer bottom | A row of five icons: web / remote / plugins / engine / settings + an "All features" row | **An "identity bar"**: host graphic on the left + "This phone · Running" (tap to switch hosts, with "Manage remote hosts" inside), and two equal round buttons on the right: All features, Settings (holding Settings goes straight to search). Plugins and engine move into the settings home; the entry to the web version is the switch key on the brand row, All features › Web version, Settings › Interface › Open web version, and the drawer no longer piles up entries |
| Settings home | One long list of groups | Hub page skeleton: search capsule + overview card (account / engine) + six groups by intent (AI / Capabilities / Appearance / General / Hosts / Help and about), see §3 and `settings-ia.md` |
| All features | A long list | Hub page skeleton: two columns of **feature cards** (`TileGrid` / `FeatureCard`), with a badge marking the "web version" items. Only features you "go and do now" are placed, ending with a group of "Settings" shortcut cards (Models, Permissions, Phone control, Remote hosts) and a row "All settings", which opens the same page as in Settings. The nine main features (Terminal, Files, Workspaces, Subagents, Plugins, Automation tasks, Model channels, Phone control, Community) use **feature tiles**, see below |

**Feature tiles** (`FeatureTile(kind, size)`, `lib/ui/common/feature_tile.dart`): large graphics of the nine main features, used by All features, their empty states and the phone control overview card, replacing round-background icons.

- **Three styles to choose from, default flat duotone**: flat duotone · minimal geometry · glass gradient, chosen by the user under Appearance (`TileStylePicker`), persisted in `tileStyleProvider`.
- **Colors follow the accent**: no longer one hue per group. Flat duotone and minimal geometry are vector (masters `app/assets/tiles/<style>/*.svg`, with `tool/make_feature_tiles.py` generating Dart paths), and the four tones (wash / mid / ink / on) are all taken from the theme: `primary`, `inversePrimary`, `primaryContainer`, `onPrimary`. Light is a dark subject with a light backing block, and dark is the reverse; the lightest block is at least 1.5 : 1 against the card background, and if not it's pushed toward the primary. The glass gradient is a bitmap (288px WebP), hue-rotated by the hue difference from the default accent (mist blue), and desaturated at the same time for low-chroma accents. When distinguishing by group is needed, a `tint` (identity hue) can be passed, unused by default.
- **Sizes**: 36 in cards (same position as the original round background), 48 in compact empty states, 64 in empty states, 52 in overview cards.
- To add a feature tile: draw one master for each of the two vector styles; the glass gradient is generated additionally with the same prompt and reference image archived in `make_feature_tiles.py`, then cropped to 288px with `--glassy`. The remaining features in All features still use round-background icons, which likewise follow the accent (`primaryContainer` background, `primary` icon).

## 3. Key pages

**Chat empty state**: centered slightly above the middle, the whale-tail brand shape (static, very pale blue) + a time-of-day greeting ("Good afternoon") + a very short subtitle; below it 2×2 equal-width quiet suggestion capsules (one per row on narrow screens with large fonts; one line of text + a small icon, with scale feedback on press); when the engine can't be reached only one primary button "Reconnect" remains. The composer at the bottom is the only protagonist, and no other banner may take its place.

**Settings home** (hub page):
- A search capsule at the top ("Search settings"), the same width as the cards below.
- The overview card: a round avatar slot on the left (the DeepSeek account avatar or initial; a key graphic when not logged in), two lines "account name / balance" on the right; below, a thin divider, then "This phone's engine · Running · DSH 0.2.1" with a status dot. Tapping the card enters the account page.
- Groups (one hue per group, with icons in the group the same color), by intent: AI (Models, Permissions, Personalization) · Capabilities (Phone control, Web search, Plugins) · Appearance (Theme, Text size, Collapse steps, Pets) · General (Interface, Language, Notifications, Voice input, Performance, Background running, Privacy and sharing) · Hosts (Local engine, Remote hosts, Engine parameters) · Help and about (Help, Community, Diagnostics, About dsh-go). Rows entering subpages show the current value on the right; relaxing protection, deleting and resetting are all not on the home page. See `settings-ia.md` for details.

**Chat details** (detail page): the header has the chat title (within two lines) + "12 minutes · 34 steps · 5 files changed", with pill tabs below: Trace / Changes / Files / Progress / Context / Subagents (horizontally scrolling pills if they don't fit).

**Engine** (detail page): the header is a status ring (a slowly breathing thin primary ring when running, red on error), with the version and uptime beside it; below it "Start / Stop / Restart" three equal-width capsule buttons; the log is a dark terminal card (monospace, copyable), using a dark background even in light mode.

**Plugins** (list page + details sheet): like an app store. Row: a 40 rounded-square icon (the initial if none), name, author · one sentence, and a "Get / Installed / Update" capsule button on the right. Details sheet: big icon, name, author, three cells of data (downloads / version / update time), description, primary button.

**Phone control**: a variant of the hub page. The overview card shows the master switch and a status sentence ("Can operate the phone" / "One step left: turn on accessibility"), and preparation is a checklist of steps with ticks, with completed items faded.

**Onboarding**: the first screen is full-screen whitespace + the whale-tail brand shape slowly appearing + one sentence (such as "Put DeepSeek in your pocket", the wording left to the copy) + one primary button; later steps use a thin progress bar at the top, one question per step, with no piles of explanation.

## 4. Visual rhythm

| Item | Rule |
|---|---|
| Spacing | Multiples of 4. Page content 16 left and right; 24 between groups; 8 from group title to card; row height 52 for one line, 64 for two |
| Corner radius | Cards 20, sheets 28, capsules and round buttons fully round, small tags 8 |
| Icon backgrounds | Only on hub pages: the settings home has **one hue per group**, chosen from the existing 8 identity colors and consistent within the group; All features follows the accent (see feature tiles in §2). Rows on other pages carry no background by default and, when needed, use a size-20 line icon in the secondary color |
| Primary color | At most one solid primary-color element per screen (the primary button or the selected state). Besides the new chat button, the send key and the selected capsule slider, use it sparingly elsewhere |
| Dividers | No lines between rows inside a card, relying on row height and whitespace; groups are separated by a 24 gap |
| Data | Numbers use tabular figures, with the unit a size smaller in the secondary color ("minutes" in "12 minutes") |

## 5. Motion language

- **Pushing a second-level page**: iOS-style horizontal push, with the previous page shifting slightly left and dimming; the back gesture follows the finger.
- **Sheets**: rise from the bottom with slight damping; dragging down follows the finger to dismiss.
- **First appearance of a list**: fade-in + up 8, staggered item by item ≤ 30 ms, for at most the first 8 items.
- **Press**: tappable cards, tiles and suggestion cards shrink to 0.97 when pressed and spring back on release (not past 1).
- **State changes**: values and status text cross-fade; status dot colors fade.
- **Header collapse**: a detail page's header fades out as you scroll and the title moves into the top bar.
- All through `AppMotion.of`, 0 when system animations are off.

## 6. Shared components and owners

New components all go into a new file in `app/lib/ui/common/`. **Only the owner creates and modifies them**; others use them through the interfaces below, and if one hasn't appeared yet, do other parts first, or write a private version in your own file with a comment to be replaced.

| Component | File | Owner | Interface notes |
|---|---|---|---|
| `PageHero` | `page_hero.dart` | Shell and onboarding | `leading` (graphic), `title`, `subtitle`, `stats: List<(String value, String label)>`, `trailing`; can collapse on scrolling |
| `EmptyView` | `empty_view.dart` | Shell and onboarding | `icon` / `art`, `title`, `message?`, `action?` (one button) |
| `Pressable` | `pressable.dart` | Shell and onboarding | Wraps any child: scale 0.97 on press, light haptics, optional `onTap` / `onLongPress` |
| `FadeInList` / `FadeSlideIn` | `fade_in.dart` | Shell and onboarding | Fade-in and up on first appearance, with `index` controlling the stagger |
| `StatusChip` / `StatusDot` extension | `status_chip.dart` | The settings family | Small capsule with a colored dot: "Running", "Stopped", "Error", with color fades |
| `OverviewCard` | `overview_card.dart` | The settings family | The hub page's overview card shell: avatar slot, two lines of info, optional bottom status bar |
| `TileGrid` / `FeatureCard` | `tile_grid.dart` | The features pages | Two-column cards: graphic (a feature tile or a round-background icon following the accent), title, a line of description, badge |
| `FeatureTile` | `feature_tile.dart` | Feature tiles | `FeatureTile(kind, size:)`: the large graphics of the nine main features, with the style per settings (§2) |
| `SegmentedPill` | `segmented_pill.dart` | Done | See polish-guide |
| `SideSafeArea` / `MirroredSideInsets` | `side_insets.dart` | Shell (landscape) | See §7 safe area: mirrors the left and right safe areas at the root; pages with a self-drawn top bar wrap their body |

## 7. Landscape and tablets

Goal: quiet, centered and with reasonable whitespace on iPad and in landscape; not desktop-like, and no separate set of pages for landscape.

**Breakpoints** (`AdaptiveLayout`, `lib/ui/shell/adaptive/adaptive_layout.dart`)

| Window | Criterion | Layout |
|---|---|---|
| Phone portrait | Width < 600 | Single column; drawer pulled out; chat details pushed as a page |
| Phone landscape | **Height < 480**, regardless of width (e.g. 915×412) | Same as portrait: single column centered, no two-pane |
| Medium | Width 600–840, height ≥ 480 | Single column; chat details is a widened bottom sheet (half / full height) |
| Large | Width ≥ 840, height ≥ 480 | Rail or sidebar + chat + a permanent chat details pane on the right |

A landscape phone doesn't get two panes: with 412 of height minus the status bar, top bar and composer there are only a few lines left, and the keyboard takes half; two panes would leave each pane a sliver, the chat column would be even narrower than in portrait, and the point of turning the phone to see wide code and wide tables would be lost. Separating phones from tablets by the shortest side is consistent with the usual Android practice.

**Reading width**

| Item | Rule |
|---|---|
| Reading column | 720 (`AppSpace.readingWidth`), centered; body 16 left and right within the column |
| Controls floating on the column | Composer, to-do / goal bar, slash panel, empty-state suggestions, replay bottom bar, wide-screen search box: 696 (`AppSpace.floatingWidth`), 12 from the column edge, 4 wider than the body on each side, same as on the phone |
| Second-level pages | An `AppPage`'s title and content share one 720 column; the top bar's keys stay at the window's two sides, like iPad |
| Floating keys | The back-to-bottom key sits 12 inside the reading column's right edge, not against the window edge |
| Terminal | The terminal card spans the full width (the column count matters); the shortcut-key row has each cell at most 64, the whole row centered |

**Panels and sheets**

| Item | Rule |
|---|---|
| Bottom sheet | At most 640 wide, centered between the left and right safe areas; in a short window (height < 480) it grows with content, up to below the status bar, and scrolls beyond that |
| Dialog | Width 280–560 |
| Chat details | Medium-screen sheet at most 744; large-screen right pane 360–420 (30% of the window, keeping the chat column at least 400) |
| Share image | In a short window the preview is on the left, and options and buttons on the right (options column 320) |

**Safe area**

- A landscape phone's cutout and three-button navigation bar are reported on one side only. At the app root, the larger of the left and right safe areas is taken and made the same on both sides (`MirroredSideInsets`, same as iOS landscape): content is centered on the glass, with left and right keys mirroring each other.
- The background extends to the screen edges; content, top bar keys and the composer make way for the safe area, and the top bar keys sit at "safe area + 12". Pages with a self-drawn top bar wrap their body with `SideSafeArea`: it yields the safe area on both sides and collapses the subtree's MediaQuery width and left/right safe areas together, so inside it you just write as for a phone.
- On large screens the rail or sidebar absorbs the left safe area, and the right pane or chat column absorbs the right one; the chat column itself no longer receives left/right safe areas.

**Vertical space in short windows**

- When the keyboard is up (height < 480): the chat top bar fades out and moves up, the to-do / goal bar and running bar collapse, and a feather layer is left below the status bar; they're restored after the keyboard is dismissed. The latest message is always above the composer.

**The status bars above the composer stack into one pile** (2026-11-01, group feedback: when to-dos, goals, the running bar and the plugin status row appeared at once they took three or four lines)

- The to-do bar, goal bar, running bar (activity bar) and plugin status row are the same pile of cards (`ui/chat/dock/dock_stack.dart`). With two or more they stack by default: the bottom one in front, taking one line; each one behind it shows 6 above it, 5% smaller each, and paler, with at most two showing, edges only, without letting the text of cards behind show through.
- Tapping the stacked pile (anywhere) expands it, each bar returning to a column where its own contents can be tapped; when expanded there is a "Collapse ˅" at the upper right. Motion 340 ms (`AppMotion.emphasized` + `glide`), each card slides straight into place, with height changing continuously; with reduced animations it switches directly. Whether stacked is remembered on this device and kept next time.
- While stacked, swiping up and down on the pile brings another card to the front (smart-stack style): swiping down pulls the next one behind to the front and sends the previous front one to the back; swiping up does the reverse. Cards follow the finger, and on release the distance (past 0.35 of a card) or velocity (300/s) decides whether to swap, at most one card per swipe; a successful swap gives a light haptic. Screen readers have "Next card" and "Previous card" actions. When a bar appears or disappears it returns to the default: the bottom card in front.
- While stacked the to-do bar is behind the running bar, and the running bar's right end gets the to-do progress added. The "Auto-allowing ⓧ" and "Full access" on the right of the running bar can be tapped directly even when stacked, and when what's brought to the front is another card, they stay beside the card at the front.
- When a bar has just grown in or is retracting, it takes part in stacking by the fraction it has grown: a new running bar rises from underneath to cover the goal bar, without the whole pile jumping. With only one card it's an ordinary single row.
- Drawer: brand, search and filters scroll away with the list, and the list can show about six rows.
- The onboarding page scrolls as a whole, and when the keyboard is up the input scrolls into view; the ring preparing the runtime environment shrinks to 128 so that it fits on one screen.

**Rotation**: the same page is the same tree at any width, and the safe area and column width change only values without swapping parent components, so after rotation the scroll position, drafts and expanded state are all kept. The only exceptions are the short-window layouts of the drawer and share image (their structure differs), where rotation resets only their own scroll positions.

**Acceptance**: the geometry tests and goldens in `test/landscape/` measure four tiers (915×412 landscape phone, 600, 840, 1280); `test/landscape/capture/` produces screenshots of the four tiers.

## 8. Not doing

Flashy gradient buttons, frosted glass on frosted glass, shadows everywhere, large colored block backgrounds, continuously flashing hints, full-screen spinner loading, a back key whose position differs on every page.
