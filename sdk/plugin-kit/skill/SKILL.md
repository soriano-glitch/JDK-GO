---
# dsh-go:managed — the dsh-go app keeps this skill up to date; delete this line to keep your own edits.
name: dsh-go-plugin
description: Write a small local plugin for the dsh-go phone app that appears in the **phone's native UI**: capsules above the composer, actions in the reply long-press menu, status strips, native panels, tool result cards, plus reading aloud, stop-on-speech and captions; after writing, check it with the bundled checker and install it on the current host. Load it first when the user wants to add something to the dsh-go app that needs logic or data, e.g. "add a button above the composer that translates the clipboard into English", "add a 'save to notes' to the long-press menu of a message", "show how much I've used today above the composer", "make a panel showing my to-dos", "draw this tool's result as a card", "add a button that reads the reply aloud". Only for the dsh-go phone native UI; when the user wants a Cordis plugin, to change the Harness web / desktop UI, or explicitly means a web plugin, use the official cordis-plugin-development skill, not this skill's directory and install method. Write a small local DSH plugin that shows up natively in the dsh-go phone app; for Cordis / Harness Web UI plugins use the official skill instead.
whenToUse: The user wants to add something of their own to the dsh-go phone app (phone app / native UI) that needs logic or data. For fixed buttons, layout, theme or hiding things use the dsh-go-ui skill (ui.json) instead. For Cordis plugins or the Harness Web UI / desktop, use the official cordis-plugin-development skill — different directory and install entry.
---

# Write a local plugin for dsh-go

A plugin is an npm package directory on the host: the `dshGo` manifest in `package.json` declares what appears in the app, and `lib/index.js` handles taps and pushes data inside the engine. The app only draws the declarations and JSON views; it doesn't execute plugin code.

## Division of labor with the official skills (decide the UI carrier first)

This skill covers only the **dsh-go phone app's native UI**. In creation mode the official `cordis-plugin-development` may also be loaded; it covers plugins for the **Harness Web UI / desktop**, and the two have different directories, manifests and install entries. **Decide the UI carrier first, then pick the skill**; don't go by load order, and don't mix them:

| What the user wants | Which to use | Directory / install |
|---|---|---|
| Add capsules, menu items, status strips, native panels, tool result cards, reading aloud / captions to the phone app | This skill | `$DSH_HOME/dsh-go/plugins/<name>/`, `dsh plugin --profile web add <directory>` |
| Change how the dsh-go app itself looks (top bar buttons, theme, hiding elements) | `dsh-go-ui` (ui.json) | `$DSH_HOME/dsh-go/ui.json` |
| Cordis / Harness Web UI plugins, decorations, slots, MCP, pages | The official `cordis-plugin-development` | Create the package in the workspace + `plugin_manager` → `install_bundle` |
| Agent presets, Cordis compositions | The official composition skills | The official process |

- When the user doesn't name the UI carrier: in this app the default target is the dsh-go phone native UI (`AGENTS.md` also says so); but if the user explicitly wants the web / desktop version, follow the official skill.
- The official skill's "don't create packages outside the workspace, don't create packages under `$DSH_HOME`, don't hand-write the profile's package.json / cordis.patch.yml" is aimed at **Cordis bundles**. A dsh-go native plugin isn't a Cordis bundle: it's an npm package placed under `$DSH_HOME/dsh-go/plugins/` and installed with `dsh plugin --profile web add`. The two rules each govern their own side, don't conflict, and the directories and install methods can't be swapped.
- When the same "add a button" can be done on both sides: first make the native version in dsh-go; if the user also wants a web version, have the official skill make a separate one.

## First decide which to use

| What the user wants | Approach |
|---|---|
| Fixed-text buttons, top bar buttons, hiding elements, themes | No plugin; use the dsh-go-ui skill to change ui.json |
| A button that must read the clipboard / composer / some reply, or compute something | This skill: `composer.actions` / `message.actions` + `on(id)` |
| A line of numbers always visible | This skill: `composer.strip` + `strip(id)` |
| A whole page of information | This skill: `panels` + `panel(id)` |
| An infrequently used but handy tool | This skill: `composer.tools` (the plus panel; needs a newer app) |
| Doing something to the whole chat: export, archive | This skill: `session.actions` (the right sidebar "Info"; needs a newer app) |
| A number visible at a glance each turn | This skill: `turn.note` + `turnNote(id)` (turn footnote; needs a newer app) |
| Drawing a tool's result as a card | This skill: the tool's `output.presentationMeta` returns `{ "dsh-go/view": view }`, no manifest needed |
| Reading a reply aloud, stopping on speech, following captions | This skill: `capabilities` + `media` / `micro` / `overlays` (see "Sound and captions" below) |

Capsules, menus, status strips and panels appear only on hosts with the dsh-go bridge installed: the phone's local engine has it (`/etc/dsh-app/runtime.json` exists means yes); other hosts get only tool cards.

## Steps

1. **Create the directory** (under `$DSH_HOME/dsh-go/plugins/`, which is kept when the engine is reset; `DSH_HOME` defaults to `~/.dsh`):
   ```sh
   P="${DSH_HOME:-$HOME/.dsh}/dsh-go/plugins/local-quote"
   mkdir -p "$(dirname "$P")" && cp -r "${DSH_HOME:-$HOME/.dsh}/skills/dsh-go-plugin/template" "$P"
   ```
2. **Rename**: the `name` in `package.json`, the `name` in `cordis.patch.yml` and the `name` in `lib/index.js` must be the same in all three places, starting with `local-`, with lowercase letters, digits and `-`.
3. **Write the manifest** (`package.json` → `dshGo`, see the table below), declaring only what is used; `wants` only for content actually read.
4. **Write the handlers** (`lib/index.js`): always inside `ctx.inject(['dshGo'], (ctx) => { … })`.
5. **Self-check**, until there are no "errors":
   ```sh
   node "${DSH_HOME:-$HOME/.dsh}/skills/dsh-go-plugin/kit/bin/check.mjs" "$P" --load
   ```
   `--load` loads your code in an isolated environment: it checks that the handlers exist and whether the app can draw the views produced by the view functions. `--json` is for machines.
6. **Install** (takes effect immediately, no restart):
   ```sh
   dsh plugin --profile web add "$P"
   ```
   The profile used by the phone's local engine is `web`. What's installed is a link pointing at this directory: the directory must not be deleted.
7. **After changing code**: changes to the manifest (`package.json`) are re-read automatically; changes to code under `lib/` need the user to restart the engine on the app's "Engine" page to take effect.
8. **Tell the user** what was changed and where to see it: capsules are above the composer; menu items are in the long-press menu of an assistant message, grouped by plugin; the status strip is above the composer; panels are on the chat details page's "Plugins" tab or in "All features". For a button that reads the clipboard / composer / message, the app asks the user once on the first tap.

To uninstall: `dsh plugin --profile web remove local-quote`, then delete the directory.

## Manifest (`package.json` → `dshGo`)

```json
{
  "v": 1,
  "title": { "zh": "引用", "en": "Quote" },
  "icon": "bolt",
  "wants": ["clipboard"],
  "contributes": {
    "composer.actions": [
      { "id": "summarize", "label": "Summarize", "effect": { "type": "insert", "text": "Summarize the conversation above in three points." } },
      { "id": "paste-quote", "label": { "zh": "引用剪贴板", "en": "Quote clip" }, "icon": "document" }
    ],
    "message.actions": [{ "id": "save", "label": "Save to notes", "icon": "note" }],
    "composer.strip":   [{ "id": "today", "icon": "chart", "panel": "stats" }],
    "panels":           [{ "id": "stats", "title": "Stats", "icon": "chart", "placement": ["session.tab", "features"] }]
  }
}
```

| Slot | Per plugin | Text limit | Fields | Tap |
|---|---|---|---|---|
| `composer.actions` | 2 | `label` 10 characters | `id` `label` `icon?` `effect?` | With `effect`: the app runs it directly, no code; otherwise calls `on(id)` |
| `message.actions` | 2 | `label` 12 characters | Same as above | Same as above |
| `composer.strip` | 1 | `text` 24 characters | `id` `icon?` `text?` `panel?` | `panel` → opens that panel; otherwise `on(id)` |
| `panels` | 4 | `title` 16 characters | `id` `title` `icon?` `placement?` `presentation?` `view?` | Buttons / rows / options in the view → `actions` |
| `composer.tools` | 2 | `label` 8 characters | `id` `label` `icon?` `effect?` `panel?` `requires?` | `panel` / `effect` run directly by the app (write only one of them); otherwise `on(id)` |
| `session.actions` | 2 | `label` 12 characters | `id` `label` `icon?` `effect?` `requires?` | Same as capsules |
| `turn.note` | 1 | 16 characters per segment | `id` | Not tappable; in `turnNote(id, (scope, emit) => …)` call `emit({ turnNumber: { text, tone? } })` |

- `title`, `label`, `text` take a string or `{ "zh": "…", "en": "…" }`; neither the Chinese nor the English may exceed the limit. The plugin name `title` ≤ 24 characters.
- `id`: starts with a letter or digit, letters, digits and `_ . -`, ≤ 40 characters; **it can't repeat within the whole plugin** (across slots too).
- `wants`: `clipboard` and `draft` (composer text) go only to capsules and `composer.tools`; `message` (the body of the long-pressed reply) goes only to menu items.
- `placement`: `session.tab` (the chat details page, scope carries sessionId, the default), `features` (All features), `chat.panel` (the sheet opened by the "Plugins" capsule above the chat composer, scope carries sessionId).
- Static `effect` can only use `insert` `command` `open` `link` `toast` `copy`.
- `icon`: bolt star sparkle heart flag bookmark pin bell clock alarm calendar todo note document folder search code terminal globe chart lightbulb book puzzle robot chat mail translate image camera mic link summary wrench bug travel school home play refresh archive team wallet palette coin money speaker read copy quote share edit write save paste add remove delete clear fork regenerate reply select-text qr download downloads external info warning check done success error question pending running tip list table panel sidebar menu more expand collapse file folder-open workspace storage pdf zip slides article text diff gallery audio music video video-file play-video pause stop replay generate-image generate-video diagram plugin bot agent skill model tool workflow goal plan job automation command trajectory web web-search browser history time today timezone schedule repeat reminder user account group chats mention invite announcement reaction poll notification send community forum feedback wechat qq telegram discord phone computer cloud server power restart retry theme color text-size pet featured badge favorite settings

## Handlers (`ctx.dshGo`)

```js
export const name = 'local-quote'
export function apply(ctx) {
  ctx.inject(['dshGo'], (ctx) => {
    // Taps on capsules / menu items / status strips: (scope, event) → effect
    ctx.dshGo.on('paste-quote', (scope, event) => scope.clipboard ? { insert: `> ${scope.clipboard}` } : { toast: 'No text in the clipboard' })

    // Status strip: push { text ≤ 24, icon?, tone? }; return a cancel function
    ctx.dshGo.strip('today', (scope, emit, caps) => {
      const tick = () => emit({ text: caps.locale.startsWith('en') ? `Today ${count()}` : `今日 ${count()}` })
      tick()
      const timer = setInterval(tick, 60_000)
      return () => clearInterval(timer)
    })

    // Panel: view (structure) + data (push the complete object, the bridge computes deltas) + handling of taps in the view
    ctx.dshGo.panel('stats', {
      view: (scope, caps) => ({ type: 'stack', children: [
        { type: 'metric', label: 'Today', value: { $: 'data.today' } },
        { type: 'actions', items: [{ label: 'Reset', action: 'reset' }] },
      ] }),
      data: (scope, emit, caps) => { emit({ today: count() }); return () => {} },
      actions: { reset: (scope, event) => ({ toast: 'Reset', patch: { today: 0 } }) },
    })
  })
}
```

| Parameter | Content |
|---|---|
| `scope` | `{ sessionId?, turnId?, messageId?, callId? }`; on a tap there is also the declared `clipboard` / `draft` / `message` |
| `event` | `{ surface, id, action?, value?, locale }`; panel taps: `action` is the action id in the view, `value` is the args (`options` → `{ value }`, `confirm` → `{ confirmed }`) |
| `caps` | View functions: `{ protocol, app, locale, surfaces, components }`; data functions: `{ protocol, locale }` |

**Effects returned** (at most 4 at a time, executed only if returned within 3 seconds after the tap):

| Form | Effect |
|---|---|
| `{ insert: '…' }` | Puts it in the composer (≤ 2000 characters), **never sends automatically** |
| `{ toast: '…' }` | A one-line notice (≤ 40 characters) |
| `{ copy: '…' }` | Copies (≤ 8000 characters) |
| `{ link: 'https://…' }` | Opens in the browser after the user confirms, https only |
| `{ open: 'panel:stats' }` / `{ open: 'page id' }` | Opens this plugin's panel or an app page |
| `{ command: 'compact' }` | Runs a slash command in the current chat |
| `{ refresh: true }` / `{ patch: {…} }` | The panel re-fetches its view / merges data |
| Several keys in one object | All executed in order, e.g. `{ copy: md, toast: 'Copied' }` |

**For slow work (calling a model, going online) use a deferred effect**: first reply `pending`, and the app shows waiting; the result arrives within ≤ 60 seconds and can only be `insert` `copy` `toast` `patch`; at most 2 at once per plugin; `signal` fires on cancel / timeout / disconnect, and stop when you receive it.

```js
ctx.dshGo.on('translate', (scope) => ({
  pending: { label: 'Translating', timeoutMs: 60_000 },
  result: async (signal) => ({ insert: await translate(scope.clipboard, signal) }),
}))
```

## Views (panels, tool cards)

A JSON component tree. Any value can be a binding `{ "$": "data.a.b" }`, taken from the pushed data and shown as "—" if not found; tool cards have no data, so write values directly.

**Choose the view version first**: a root without `v`, or with `v: 1`, uses the v1 components and original styles; when you need new controls, structural components or bounded styles, write `v: 2` on the root. The manifest's `dshGo.v` is still `1`, separate from the view version.

The table below lists only v1's basic components. The complete v2 components and fields are in the bundled `kit/schema/view.schema.json`; the app repository's `docs/plugins/components.md`, `styles.md` and `inputs.md` explain the new components, styles and forms. Don't reject v2 because a component isn't in the table below. To stay compatible with old apps, downgrade per `caps.components` / the SDK's `adaptView`, keeping basic fields such as `text` for the copy.

```json
{"v":2,"type":"stack","accent":"teal","children":[
  {"type":"text","text":"Example","style":{"size":"title","weight":"bold"}},
  {"type":"emptyState","title":"Nothing here yet"}
]}
```

| Component | Fields |
|---|---|
| `stack` / `row` | `children` (row wraps automatically on narrow screens); the root can carry `title` |
| `text` | `text`, `tone?: muted` |
| `metric` | `label` `value` `tone?: good\|warn\|bad\|info` `caption?` |
| `chart` | `kind: bar\|hbar\|line\|donut` `categories` `series: [{ name?, values }]` `unit?` `caption?` |
| `compare` | `items: [{ title, badge?, rows: [[name, value]] }]` (2–4 items) |
| `steps` | `items: [{ label, status: done\|current\|todo\|failed, detail? }]` |
| `callout` | `text` `tone?: info\|good\|warn\|bad` |
| `list` | `items: [{ title, subtitle?, trailing?, icon?, tone?, action? }]` (≤ 50) |
| `keyValue` | `items: [[name, value], …]` or `[{ label, value, tone? }]` or `{ name: value }` (≤ 24) |
| `progress` | `value` `max?` (default 100) `label?` `caption?` `tone?` |
| `table` | `columns: [text \| { label, align? }]` (≤ 8) `rows: [[…]]` (≤ 50) |
| `actions` | `items: [{ label, action, icon?, style?: primary\|plain }]` (≤ 4, at most one primary) |
| `options` | `id` `options: [{ label, value? }]` `multi?` `selected?` |
| `confirm` | `id` `confirmLabel?` `cancelLabel?` |
| `image` | `src`: a same-origin path `/dsh-go/v1/…` or a `data:image/…` ≤ 64 KiB; `alt?` `aspect?` |

`action` takes an action id string, or `{ "id": "open", "args": { … } }` (args ≤ 1 KiB). Limits: panels 32 KiB / 120 components / 8 levels; tool cards 8 KiB / 40 / 6 levels, and in phase 0 not tappable.

Tool card:

```js
presentationMeta: (args, value) => {
  try {   // throwing, or returning undefined / NaN, makes the whole tool call fail
    const text = JSON.stringify({ type: 'stack', title: `${value.city} · Today`, children: [{ type: 'metric', label: 'Temperature', value: `${value.temp}°` }] })
    return text.length < 8000 ? { 'dsh-go/view': JSON.parse(text) } : {}
  } catch { return {} }
},
```

## Sound and captions (v1.2, optional)

Add `"capabilities": ["audio", "voice", "micro", "overlay"]` to the manifest (write whichever of them you use), add `media: [{ id }]`, `micro: [{ id }]`, `overlays: [{ id, channel }]` to `contributes` (each ≤ 2, with ids not repeating other contributions); a button that uses sound gets `"requires": ["audio"]`.

```js
ctx.dshGo.on('read', (scope) => [   // same instance: the app treats it as one session
  { type: 'audio', op: 'play', instance: 'reading', src: 'media:speech', key: 'k1' },
  { type: 'voice', op: 'start', instance: 'reading' },
  { type: 'overlay', op: 'show', instance: 'reading', id: 'subtitle' },
])
ctx.dshGo.media('speech', async (scope, { key, signal }) => ({ body: wavBuffer, contentType: 'audio/wav' }))   // the whole clip, ≤ 16 MiB, within 30 seconds
ctx.dshGo.micro('caption', { data: (scope, emit) => { emit({ text: 'Reading to here', progress: 0.3 }); return () => {} } })   // only { text ≤ 240 characters, progress 0–1 }
ctx.dshGo.onCapability((scope, { event }) => {})   // audio.ended / voice.speechStart / …; the return value isn't executed
```

Put slow things (TTS) in `media`, not in `on`. The app handles: on speech, stopping playback first and then notifying; asking whether the user can listen; only in the foreground; automatically stopping listening and closing captions after the sound ends. Without TTS you can synthesize a placeholder sound as `examples/plugins/dsh-go-example-readaloud` does.

## Rules

- v1 keeps the original style; v2 can use the colors, semantic font sizes, weights, spans and container styles listed in the docs. Don't write arbitrary CSS, font files, sizes, opacity, gradients or animation parameters; the actual geometry, readable colors and content bounds are still decided by the app.
- Keep copy short, and use full-width punctuation in Chinese; error messages should read like human language ("No text in the clipboard"), not English exceptions.
- Don't put keys or tokens in views, manifests or code; the clipboard / message read is used only for that one tap.
- Don't do anything with side effects when there's no tap; `insert` never sends.
- Write fields per the chosen view version's schema and component catalog, and verify with the bundled checker; don't make up unsupported fields. The complete documentation is in the app repository's `docs/plugins/`.
