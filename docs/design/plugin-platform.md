# Plugin platform: seams, open interfaces and stability promises

> 2026-11-05. Answers three questions: how others' plugins connect into dsh-go; what interface people writing plugins specifically for dsh-go get; and how far the native UI can be opened while staying stable.
> It continues [plugin-seams.md](plugin-seams.md) (seam spec), [native-plugins.md](native-plugins.md) (the native route) and [plugin-ui-v3.md](plugin-ui-v3.md) (web plugin compatibility and new places), rather than starting a separate set. This document sets direction and rules; protocol details are still governed by [native-plugins-protocol.md](native-plugins-protocol.md).

## 0. Conclusions

| Question | Decision |
|---|---|
| How others' plugins connect | Three routes, in increasing cost: change no code (commands, skills, settings forms, tools) → add a native card to a tool → write a `dshGo` manifest. Plugins with an existing web interface keep going through the web island, and can be switched to native item by item |
| What people writing specifically for it get | One protocol, one SDK (types, validation, a test host, preview), and a set of places with explicit budgets. Logic runs in the engine; the app only draws declared components |
| How far it opens | Add as much as possible: places and components keep expanding. The skeleton of the app's look isn't handed over: no replacing the official UI, no running plugin code in the app, and plugins don't decide geometry and motion |
| How stability is guaranteed | Every place has limits on count, characters, frequency and time; one wrong item drops only that item; continued violations downgrade automatically; new places are negotiated and old apps are unaffected. These are written as [promises to authors](../plugins/stability.md) |
| What this round does | Adds 5 places: plus panel tools, chat actions, turn notes, a panel on the plugin detail page, a panel as a sheet. See §4 for the rest |

## 1. Three kinds of authors, three routes

| Author | Current state | Which route | What to do |
|---|---|---|---|
| An existing DSH plugin, no UI | Commands, skills and settings are already native | Change no code | Nothing to do; for nicer results, add `presentationMeta` to tools |
| An existing DSH web plugin | Seat planning is handled automatically: native adapter → web island → "Open in web" | Don't change first; migrate item by item when you want better | Add `dshGo` in `package.json`; the app uses the native UI and the web version keeps using the web UI, without affecting each other |
| Written specifically for dsh-go | Starting from scratch | The `dshGo` protocol | Use `@dsh-go/plugin-kit` and follow [From zero to the market](../plugins/from-zero.md) |

The author entry is [Choose a path](../plugins/choose-path.md); you needn't read the whole protocol first.

## 2. Seam map

Each place answers only four things: where it goes, what goes in, how much, and who can use it.

| Place | Manifest | Content | Per plugin | Text | Status |
|---|---|---|---|---|---|
| Tool card | `presentationMeta` | View (read-only) | Doesn't count | 8 KiB | Existing |
| Composer capsule | `composer.actions` | Button | 2 | 10 | Existing |
| Message menu | `message.actions` | Menu item | 2 | 12 | Existing |
| Status strip | `composer.strip` | One line of text | 1 | 24 | Existing |
| Panel | `panels` | View | 4 | 16 | Existing |
| Plus panel | `composer.tools` | Tool tile | 2 | 8 | **This round** |
| Basic info | `session.actions` | Action row | 2 | 12 | **This round** |
| Turn footnote | `turn.note` | A line of text | 1 | 16 | **This round** |
| Plugin detail page | `panels[].placement: "plugin"` | View | Counts toward panels | 16 | **This round** |
| Panel opened as a sheet | `panels[].presentation: "sheet"` | View | Counts toward panels | 16 | **This round** |
| Right sidebar exclusive | `panels[].placement: "side.panel"` | View | Counts toward panels | 16 | Branch `feat/side-panel-placement`, not merged |

`session.actions` isn't placed in the "⋯" of the chat-details header per plugin-ui-v3 §4.1: that row is already a mirror of the back key and the terminal key, and adding one more would break the symmetry. The right sidebar's "Info" is the overview of this conversation, one action per row, with the plugin name on the right, so attribution is there too.

## 3. Stability rules

A new place must satisfy all of the following at once. Missing one means it isn't opened.

| Rule | How it's implemented |
|---|---|
| Add only, don't change | Within protocol v1 only optional content is added; old apps ignore keys they don't know. For a plugin that doesn't use the new places, its row in `contributions` is exactly the same as before (guarded by `native-capabilities.test.mjs`) |
| New places are negotiated | The app declares what it can draw in `caps.surfaces`. A panel placed only in a new place falls back to `session.tab` for old apps and doesn't disappear |
| Has limits | Count, characters, data size, push frequency and callback time all have constants, checked once each by the bridge, SDK and app |
| Breaking only breaks itself | One wrong item drops only that item; a callback that throws or times out is caught by the bridge; after 5 consecutive violations, the plugin is downgraded for this run |
| The user decides | Every place has a switch in the plugin details; reading the composer, clipboard or reply body asks before the first tap |
| Doesn't slow chat | Plugins without declarations produce no subscriptions and requests. The turn note subscribes only when some plugin declares it, and is the first to be dropped when space runs out |
| Geometry belongs to the app | Plugins give only text and semantic tone; size, spacing and motion are decided by the app |
| Attribution | The user can always see which plugin the content comes from |

**Never done:** running plugin code in the app (Flutter is AOT-compiled, and the security boundary would disappear); replacing the top bar, composer or sidebar; arbitrary CSS, HTML or author animations; message-level web islands. For the reasons see [native-plugins.md](native-plugins.md) §2 and [plugin-ui-v3.md](plugin-ui-v3.md) §9.

## 4. Roadmap

| Batch | Content | Status |
|---|---|---|
| This round | The 5 items marked this round in §2; the author entry and stability promise docs | This PR |
| Next batch | Tool card interaction (`tool.card`); in-app notifications (`notify`); the three effects `attach`, open a chat, and open this plugin's web panel | Not started, design in plugin-ui-v3 §4.1 |
| Later | Installing the bridge on SSH hosts; desktop widgets; background system notifications; pet packs | Not started |
| Waiting for information | Integration of btw-style plugins | Waiting for the maintainer to name a specific plugin |

The next batch starts with tool card interaction: it must verify that the tool really belongs to this plugin, which is the item most likely to have security issues and needs separate review.

## 5. Steps for adding a seam

`side.panel` and this round's 5 items all took this route; do the same in future:

1. Bridge: add the limit in `limits.js`, parse and render in `manifest.js`, and change `routes.js` and `core.js` when needed.
2. SDK: `node scripts/sync-bridge.mjs` syncs the parser; update `schema/*.json`, `scripts/types/*.in`, `lib/check.js`, `lib/testing.js`, then run `gen-types` and `sync-skill`.
3. Client: parse in `dsh_go_api.dart`; declare in `DshGoSurfaces.all`.
4. App: add providers in `native_model.dart` and `native_state.dart`, then draw the UI; the switch in `native_plugin_section.dart` appears automatically.
5. Tests: bridge unit tests, SDK tests, app component tests, and goldens for layout.
6. Docs: `docs/plugins/slots.md` in Chinese and English, the protocol docs, and the compatibility notes in `versions.md`.

## 6. Not yet verified

- The turn note takes its data by `TurnTrace.turn` (the turn number in the conversation record), and hasn't been run with a real plugin.
- This round's new places haven't been run end to end on a real device and a real DSH host.
