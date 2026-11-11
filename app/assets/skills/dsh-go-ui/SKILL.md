---
# dsh-go:managed — the dsh-go app keeps this skill up to date; delete this line to keep your own edits.
name: dsh-go-ui
description: Configuration of the dsh-go phone app's native UI ($DSH_HOME/dsh-go/ui.json): top bar buttons, quick capsules above the composer, new-chat suggestion cards, drawer grouping and sorting, density, hidden elements, theme and accent color, tablet shortcuts, plugin seats. Changes only the **dsh-go phone native UI**; when the user wants to change the Harness web UI / desktop, build a Cordis plugin or a web plugin, use the official skills, not this one. Load it first when the user wants to change how the app itself looks, e.g. "replace XX in the top bar with YY", "add a summarize button above the composer", "put a few common questions on the new-chat page", "sort the drawer by creation time", "hide the turn footnote", "switch to dark / daiqing", "add a ctrl+k shortcut to open search". Change how the dsh-go phone app's native screens look and behave by editing ui.json; the Harness Web UI / Cordis plugins are the official skills' business.
whenToUse: The user asks to change the dsh-go app (phone app / native UI) itself. Not for the Harness Web UI, Cordis plugins or DSH settings; anything that needs logic or data is a plugin (dsh-go-plugin).
---

# dsh-go UI configuration (ui.json)

The dsh-go app reads `$DSH_HOME/dsh-go/ui.json` (`DSH_HOME` defaults to `~/.dsh`) and changes its own native UI according to the declarations in it. After you save, the app picks it up automatically within a second or two, with no restart.

The file can only declare, not execute: no scripts, no network requests, no installing anything. Buttons can do only four kinds of actions (see below), and each happens only when the user taps it themselves.

## Division of labor with the official skills

- **This skill**: changes the dsh-go phone app's native UI (ui.json).
- **dsh-go-plugin**: adds capsules, menus, status strips, native panels and tool cards to the phone app; use it when logic or data is needed, not ui.json.
- **The official `cordis-plugin-development` and the like**: plugins, decorations, slots, pages and MCP for the Harness Web UI / desktop; the directory is in the workspace, and installation goes through `plugin_manager → install_bundle`.
- When the user doesn't name the UI carrier, the default on the phone is the dsh-go native UI; decide the carrier first and then pick the skill, not by load order. Don't mix the two configurations (ui.json / Cordis bundle), and don't apply the official web plugin approach to the app.

## How to change it

1. Read the existing file first: `cat "$DSH_HOME/dsh-go/ui.json"` (create it if absent, and `mkdir -p` if the directory doesn't exist).
2. Change only what the user asked for, keeping other keys as they are. Don't delete the user's earlier configuration.
3. Write it back: strict JSON, UTF-8, no comments, no trailing commas, no more than 64 KiB. Best to write a temporary file first and then `mv` it into place.
4. Self-check: `node "$DSH_HOME/skills/dsh-go-ui/scripts/check.mjs"`. The output is exactly what you'd see in the app's settings (the script's messages are in Chinese; the labels below are shown with English glosses):
   - `错误 /composer/quickActions/2/action/url：只支持 https 链接` ("error … only https links are supported"): this item doesn't take effect, the rest as usual;
   - `忽略` ("ignored"): parts the app doesn't recognize or that exceed limits;
   - `提示` ("notice"): automatically corrected (e.g. text too long and truncated), still in effect;
   - `ui.json 没有生效：…` ("ui.json did not take effect: …"): the whole file wasn't read in (syntax error, wrong version), and the app keeps using the last valid configuration.
   Fix until there are no `错误` (errors). Add `--json` for machine-readable results.
5. On this machine (the engine on the phone) there is also `$DSH_HOME/dsh-go/ui.status.json`, which is what the app actually read, and can be compared.
6. Tell the user what was changed. If the user wants to undo one item, delete that key; or in the app's settings tap "From ui.json" (来自 ui.json) → "Restore defaults" (恢复默认), which only makes the app ignore that item and doesn't change the file.

The complete field definitions are in `schema.json` in the same directory, and examples in `examples/`.

## Fields

```json
{
  "version": 1,
  "header": { "actions": ["schedule", "detail", "newChat",
    { "id": "daily", "icon": "bolt", "label": "Daily", "action": { "type": "send", "text": "Write today's daily report from the template" } }] },
  "composer": { "quickActions": [
    { "label": "Summarize", "action": { "type": "send", "text": "Summarize the conversation above in three points" } },
    { "label": "Compact", "action": { "type": "command", "name": "compact" } } ] },
  "emptyState": { "suggestions": [
    { "title": "Check today's to-dos", "subtitle": "Read TODO.md in the workspace", "action": { "type": "send", "text": "Read TODO.md and tell me what to do first today" } } ] },
  "drawer": { "groups": ["pinned", "folders", "today", "yesterday", "thisWeek", "earlier"], "sort": "activity", "filter": "all" },
  "density": "compact",
  "hide": ["turnFooter", "tokenCount"],
  "theme": { "mode": "system", "accentPreset": "daiqing" },
  "shortcuts": [ { "keys": "ctrl+k", "action": { "type": "open", "page": "search" } } ],
  "plugins": { "seats": { "conversation.input.dock": { "dsh-cost-meter": "hidden" } } }
}
```

| Key | Format |
|---|---|
| `version` | Required, `1` |
| `header.actions` | Buttons on the right of the chat top bar, shown in order. Built in: `newChat` (new chat), `detail` (chat details), `schedule` (scheduled-task clock), `agents` (subagent capsule), `model` (model capsule). Built-in buttons not listed are hidden, and `[]` hides all. At most 3 custom buttons: `id` (starts with a lowercase letter, letters, digits and -), `icon` (see below), `label` (≤ 8 characters), `action` |
| `composer.quickActions` | Capsules above the composer, ≤ 8; `label` ≤ 10 characters + `action`. They collapse automatically while a reply is being generated |
| `emptyState.suggestions` | Suggestion cards on the new-chat page, ≤ 6; `title` ≤ 20 characters, `subtitle` (optional) ≤ 40 characters, `action` |
| `drawer.groups` | Order and visibility of chat list groups: `pinned` pinned, `folders` folders, `today`, `yesterday`, `thisWeek`, `earlier`; groups not listed are hidden |
| `drawer.sort` | `activity` (recent activity) or `created` (creation time) |
| `drawer.filter` | Filter when opening the drawer: `all`, `running`, `pending`, `unread` |
| `density` | `compact` or `comfortable` |
| `hide` | Elements to hide: `turnFooter` (turn footnote), `tokenCount` (token count), `reasoningDetails` (reasoning), `activityStrip` (activity strip while generating), `whaleTail` (whale-tail animation), `todoPill` (to-do strip), `goalBar` (goal bar), `pluginCapsule` (the "Plugins" entry drawn by the app above the chat composer) |
| `theme.mode` | `system`, `light`, `dark` |
| `theme.accentPreset` | `mist` mist blue, `daiqing` daiqing (dark teal), `dusk` dusk purple, `turquoise` turquoise, `amber` amber, `graphite` graphite |
| `theme.accent` | Custom accent color `#RRGGBB` (the app adjusts it automatically to meet contrast); pick either this or `accentPreset` |
| `pet` | `id`, `position` (`top-left` / `top-right` / `bottom-left` / `bottom-right`), `quiet` (boolean). Validated only until the pet feature goes live |
| `shortcuts` | Tablet external keyboard shortcuts, ≤ 20: `keys` such as `ctrl+k`, `ctrl+shift+n`, `alt+1`, `f5` (must include ctrl or alt, except F keys; meta/cmd/win can't be used; `ctrl+a/c/v/x/y/z`, `ctrl+shift+v/z`, `alt+f4` are taken) + `action` |
| `plugins.seats` | How plugins appear in the native UI: `{ "<slot>": { "<npm package name>": "native" \| "island" \| "web" \| "hidden" } }` (drawn natively / embedded web / open in web / hidden). For slot names see `x-dsh-go.slots.known` in `schema.json`; what's in `unseatable` is the app's own UI, which takes no plugins |

Icons (`icon`): bolt star sparkle heart flag bookmark pin bell clock alarm calendar todo note document folder search code terminal globe chart lightbulb book puzzle robot chat mail translate image camera mic link summary wrench bug travel school home play refresh archive team wallet palette

To hide the chat page's "Plugins" entry, add `pluginCapsule` to the existing `hide` array, e.g. `{"version":1,"hide":["pluginCapsule"]}`. It hides only the app's aggregate entry; it doesn't disable plugins, doesn't hide the plugins' own quick capsules, and doesn't change the entries in "All features" or "Chat details". Remove the item or restore defaults on the UI configuration page to show it again. `plugins.seats` configures plugin slots, not this app entry; don't use `chat.panel` / `dsh-go.panel` seat settings as a substitute.

## Actions (action)

| `type` | Fields | After the user taps |
|---|---|---|
| `send` | `text` (≤ 2000 characters) | Puts the text into the composer for the user to tap send themselves; never sends automatically |
| `open` | `page` | Opens an app page: `new-chat`, `settings`, `search`, `files`, `terminal`, `jobs`, `skills`, `schedules`, `models`, `plugins`, `cordis`, `engine`, `web`, `session-detail`, `workspaces`, `account`, `remote`, `phone`, `notifications`, `diagnostics` and so on; all are in `$defs.page` of `schema.json` |
| `command` | `name` (without `/`), `args` (optional, single line) | Runs `/name args` in the current chat |
| `link` | `url` (only `https://` accepted) | Opens in the browser after a confirmation |

## Notes

- Each host has its own ui.json, and the app uses the one for whichever host it connects to.
- One wrong item affects only that item; on a syntax error in the whole file, the app keeps the last valid configuration.
- Don't put secrets such as keys or tokens in the file.
- Don't make up fields or values; anything not in the tables above isn't recognized by the app.
