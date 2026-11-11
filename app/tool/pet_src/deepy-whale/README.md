# Deepy the little whale: a Clawd on Desk theme pack

A pixel little-whale desktop pet for DeepSeek-powered coding agents, a counterpart to Clawd's little crab. It is an unofficial fan theme and has nothing to do with DeepSeek or Anthropic.

- The canvas `viewBox` is 52×52 (logical pixels). Animation assets are 260×260 APNGs (exported at 5×, with real semi-transparent shadows), 20 fps.
- The idle state uses `idle-follow.svg`, which contains three groups, `#eyes-js`, `#body-js` and `#shadow-js`; the eyes follow the mouse, plus CSS breathing, blinking and tail wagging.
- Validated with Clawd's own `scripts/validate-theme.js`, all passing. Also strictly loaded with its `theme-loader`; the SVG content is unchanged after the sanitizer.

## Installation

1. Copy the whole `deepy-whale/` folder (with `theme.json` directly at the top level) to the directory below:
   - Windows: `%APPDATA%/clawd-on-desk/themes/deepy-whale/`
   - macOS: `~/Library/Application Support/clawd-on-desk/themes/deepy-whale/`
   - Linux: `~/.config/clawd-on-desk/themes/deepy-whale/`
2. In Clawd, open `Settings…` → `Theme` and choose **Deepy the little whale**. If it isn't in the list, restart Clawd once.
3. To have the whale follow DeepSeek's work, connect DeepSeek Harness (experimental) under `Settings…` → `Agents`; other supported agents can drive it too.

## State mapping

| Clawd state / slot | Trigger event | File | Action |
|---|---|---|---|
| idle | No task | idle-follow.svg | Eyes follow the mouse, breathing, blinking, tail wagging |
| idleAnimations | Random while idle | idle.apng / idle-look.apng / idle-spout.apng | Breathing, looking around, happily spouting water |
| thinking | UserPromptSubmit | thinking.apng | Thought cloud, dots hopping in a wave, a flash of inspiration |
| working (1 session) | PreToolUse / PostToolUse | typing.apng | Lying behind the keyboard writing code, a little hop after each stretch |
| working (2 sessions) | Same as above | music.apng | Grooving with headphones on |
| working (3 or more sessions) | Same as above | building.apng | Wearing a hard hat, nudging falling bricks straight |
| juggling (1 subagent) | SubagentStart | music.apng | Grooving with headphones on |
| juggling (2 or more subagents) | SubagentStart | conducting.apng | Keeping the beat with its tail, leading three little whale clones at work |
| error | PostToolUseFailure | error.apng | Startled shaking, ✕, smoke, seeing stars |
| attention | Stop / PostCompact | happy.apng | Celebratory flip, confetti, ✓ |
| notification | PermissionRequest | notification.apng | Exclamation bubble ringing a bell, hopping and flicking its tail |
| sweeping | PreCompact | compacting.apng | Sucking in context fragments, compressing them into a block and spitting it out |
| carrying | WorktreeCreate | carrying.apng | Hopping along with a box on its head |
| sleeping | 60 seconds of inactivity | sleeping.apng | Nightcap, snot bubble, Zzz |
| waking | Mouse moved while asleep | waking.apng | Jolts awake and springs up, nightcap flies off |
| roam | Free wandering | roam-hop.apng | Bouncing forward on its belly (`roamFlipAssets: true`) |
| reactions.clickLeft / clickRight | Double-click on the left half / right half | react-left.apng / react-right.apng | Jelly-like bounce back, hearts pop out |
| reactions.double | 4 quick clicks | react-double.apng | Tickled, shaking with laughter |
| reactions.drag | Drag | react-drag.apng | Picked up, swinging like a pendulum, flapping in a panic |

## Not yet supported

- Mini mode (`miniMode.supported: false`). Enabling it requires drawing 8 more mini states.
- The headwear and mouth accessory catalog (`customization.accessories`).
- The sleep sequence uses `direct` mode: after 60 seconds of inactivity it goes straight into `sleeping`, and plays `waking` when woken.
