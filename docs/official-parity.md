# Official feature comparison (DSH 0.2.1-rc.2)

> Checked item by item on 2026-10-24 against the official web client of DSH 0.2.1-rc.2. The engine built into the app was later upgraded to 0.2.2-rc.1, and this table has not been re-checked item by item against the new version; the new official page has manual creation of automation tasks added, while the app's creation still goes through chat.

Conclusion: every feature a user can touch in the official web client (`dsh-client-ui-*`, `dsh-experimental-client-ui-*`, and the packaged `dsh-web-frontend`) has an entry in the app, and now has a native page or native flow (approving runs of Cordis plugin panels and plugin UIs are still in the web version); "All features" prefers native entries, and the web version keeps only its standalone entry and the voice plugin settings. The summary page is in "All features": the all-features key on the identity bar at the bottom of the drawer, or `/All features` in the composer; it places only features you "go and do now", settings entries are gathered in Settings, and a group of "Settings" shortcut cards is left at the end. Settings itself is grouped by intent (AI, Capabilities, Appearance, General, Hosts, Help and about), with search at the top of the home page (`docs/design/settings-ia.md`).

Status legend: ☑️ native exists · 🔄 part is native, the rest in the web version · ⬜ not native, the entry is a web-version deep link · ➖ not applicable on a phone (reason given). ☑️ means code and tests are done and doesn't mean verified on a real device; items not yet verified on a real device are listed under "Gaps and follow-ups" at the end. In the "App entry" column below, "All features › X" means a row in the summary page; "Web version › …" means the official page the deep link lands on.

The basis of the package-by-package check is each package's `README.zh.md` and `lib/client.js` (Chinese copy, slots, remote names); deep links were tested live with `dsh web` on a computer (temporary HOME, see "How deep links land").

## Chat and input

| Official feature | Official package · official entry | Status | App entry |
|---|---|---|---|
| Chat view: process folding, turn navigation, per-turn usage | ui-chat · view tab "Chat" | ☑️ | The chat page; Settings › Appearance › Collapse steps when done |
| Composer, queued sending, interjection | ui-conversation · composer, queue dock | ☑️ | The chat page; long-press send and choose "Queue / Interject" |
| Todo bar | ui-conversation · `input.dock#todo` | ☑️ | A permanent todo bar above the chat composer ("3/7 · Now: …", tap to expand the checklist in place); Chat details › Progress |
| Context usage | ui-conversation · context ring | ☑️ | The small context ring in the composer (tap to see usage); Chat details › Context |
| Slash command panel | ui-commands · typing `/` | ☑️ | Type `/` |
| `/compact` `/permission` `/plan` `/goal` `/feedback` | dsh-command-* · slash commands | ☑️ | Type `/` (execution goes through `commands/execute`) |
| Download the session log (`/export`, "Download Session log" in the session top bar) | session-log-export | ☑️ | `/export` in the composer; All features › Export chat log |
| `/model`: model and reasoning level | ui-model-selection · the composer's model slot, `/model` | ☑️ | The chat top bar's model capsule; `/model` |
| `/file`: add attachments | ui-conversation · `+` | ☑️ | The composer's attachment button |
| Skill group (`/skill-name`) | ui-skill · the "Skills" group in the `/` menu | ☑️ | Type `/` (the skill group was added this time); All features › Skills. Skill sheet: use in chat / use in a new chat (insert `/name ` into the composer, consistent with the onPick of the official `dsh-client-ui-skill`) |
| Reference files / chats / subagents (`@`) | ui-reference, ui-subagent · typing `@` | ☑️ | Type `@` in the composer (files, chats, subagents; `fileReferences/list`, `sessionReferenceResolver/candidates`); All features › Reference files and chats (returns to the composer) |
| Attachment bar, image gallery and lightbox | ui-attachment | ☑️ | Composer attachments, message images |
| Credential masking (keys in sent text) | ui-secret-mask | ☑️ | Chat bubbles (tap the eye to show the original) |
| Permission approval card | ui-approval · takes over the composer | ☑️ | The approval card in chat |
| Question card, plan awaiting review (approve / request changes) | ui-user-questions | ☑️ | The question card in chat (the plan body shown as Markdown) |
| Message feedback (good / problem) and the feedback dialog | ui-message-feedback · message action bar, `/feedback` | — | Not done in the app: 👍 / 👎 on the action bar were removed (2026-10-27, replaced by "Share"); `/feedback` as before |
| Fork from a message | ui-chat · `session/fork` | ☑️ | Long-press a message or the reply action bar ⋯ › Fork from here |
| Tool cards, workflow run nodes, Cordis cards | ui-tool, ui-workflow-run, ui-cordis | ☑️ | The tool rows in chat |
| Machine translation of reasoning | experimental-ui-cot-translation · the toolbar after expanding reasoning | ☑️ | Expand reasoning › "Translate" (appears once the plugin is on); All features › Reasoning translation (plugin switch and settings) |
| Voice input | experimental-ui-voice-input · the composer's microphone | ☑️ | The composer's microphone (in the send key's position when the input is empty, awaiting real-device verification); All features › Voice input (returns to the composer; 🌐 the engine voice plugin in the web version is still usable) |
| The thinking capsule above the composer | — (the app's own) | ☑️ | Above the chat composer |

## Current chat

| Official feature | Official package · official entry | Status | App entry |
|---|---|---|---|
| Trace (event table, time overview) | ui-trajectory · view tab "Trace" | ☑️ | Tap the top bar title › Chat details › Trace; All features › Chat details |
| Changes / deliverable cards | ui-deliverables | ☑️ | The change card and artifact file card in chat (preview, open, share, save to "Downloads"; sharing opens the share panel: an image or the file itself); Chat details › Changes; All features › Output files |
| Background tasks (in progress / ended, live output, stop) | ui-jobs · "N background tasks" in the session top bar | ☑️ | All features › Background tasks (added this time, `job/list`, `job/follow`, `job/kill`) |
| Subagent catalog and lineage | ui-subagent · "N subagents" in the session top bar | ☑️ | The chat top bar's "N subagents" capsule; Chat details › Subagents (lineage tree, tap to continue chatting; one-shot subagents are read-only); tapping the "Subagent · …" tool row in chat opens that subagent; All features › Subagents |
| Plan mode (badge, plan card, right-pane plan preview) | ui-plan | ☑️ | `/plan`; Chat details › Progress |
| Long-term goal (goal bar: edit, pause, resume, clear) | ui-goal · the goal bar above the composer | ☑️ | The goal bar above the chat composer, tap to edit, pause / resume, clear (`goals/*`); Chat details › Progress |
| Permission preset for the current chat | ui-permission-presets · the `/permission` dialog | ☑️ | Settings › Permissions › Current chat; All features › Settings › Permissions; `/permission` |
| Workspace file tree and document preview | ui-sidebar-files, ui-sidebar-documentpreview · right sidebar | ☑️ | All features › Files; Chat details › Files (browse, search, text / image / PDF / spreadsheet preview, Office previewed as PDF converted by the host; long-press to open, share, save) |
| Terminal | ui-sidebar-terminal · right sidebar "New terminal" | ☑️ | The terminal key at the top right of chat details; All features › Terminal (multiple tabs, shortcut-key row; the terminal keeps running after leaving the page) |
| Right sidebar (push form, expand key at the corner of the top bar) | dsh-client-ui-sidebar-right · session top bar corner | ☑️ | `SessionDetailPage`'s panel mode + `DetailPanelKey`: on wide screens chat details is a permanent right pane; on narrow screens a bottom panel is used instead |
| Browser sidebar | ui-sidebar-browser | ➖ | Not enabled by default in the official Web version (only the desktop version has it), and the app's embedded web version doesn't have it either |
| Open in local app | ui-open-in-app · "Open locally" in the session top bar | ➖ | Needs the machine running the Host to have a desktop; the phone itself has none. A remote host can use it in its web version |
| Agent team (members, task board) | experimental-ui-agent-team | ☑️ | The chat top bar's team capsule; All features › Agent team (members, task board and messages; can be turned on within the page when the plugin isn't on) |
| Session rename, archive | ui-workspace | ☑️ | Long-press a chat in the drawer (pin, rename, move to folder, share, multi-select, archive); batch archive after multi-select (undoable) |
| Session search | ui-sidebar · search | ☑️ | The search box at the top of the drawer; All features › Search chats |
| Pending-interaction markers (awaiting approval / plan awaiting review / awaiting answer) | ui-workspace · pending interactions | ☑️ | "To confirm / Plan awaiting review / To answer" at the end of a drawer chat row; the filter "Pending" |
| Unread completion reminder | ui-workspace · the session row's status dot | ☑️ | A small dot at the end of a drawer chat row; the filter "Unread" |
| Sorting: recently updated / manual drag | ui-workspace · view options | 🔄 | Drawer ⋯ › Sort: recent activity / creation time; chats can't be manually drag-sorted (folders can) |

## Automation

| Official feature | Official package · official entry | Status | App entry |
|---|---|---|---|
| Automation tasks page: all / on / ended, rules, run records, associated sessions, delete | ui-schedule · side panel "Automation tasks" | ☑️ | All features › Automation tasks (list, search, filter, details, run records, rename, change instructions, delete, jump to the associated chat) |
| Edit run time (repeat rules, time zone, cron) | ui-schedule · the "Run time" card in details | ☑️ | Automation tasks › Details › Run time (repeat rules, time zone, cron) |
| Create a task | The official side has no form either; the model creates it with `schedule_create` | ☑️ | Automation tasks › New (after filling in the name, instructions and run time, hand it to the model in chat to create, the same path as the official one) |
| The reminder clock in the session top bar | ui-schedule · session top bar | ☑️ | The clock key at the end of the chat top bar's title capsule (appears when there are automation tasks in progress, icon only, yielding when there's not enough space); tap to see the name, rule and the next three runs, with "Run now" or go to "Manage". The official side has no pause / resume, and the app doesn't provide it either |

## Agent and models

| Official feature | Official package · official entry | Status | App entry |
|---|---|---|---|
| Default permission for new chats | ui-permission-presets · Settings › General settings | ☑️ | Settings › Permissions › Default for new chats (`settings/mutate permission`); choosing "Full access" on this phone is the app's own switch (the former "Auto-run commands"); All features › Settings › Permissions |
| Agent presets: choose the new-chat default, view configuration | ui-agent-preset · Settings › Agent presets, new session page | ☑️ | Settings › Personalization › Agent presets (list, set as default, view YAML) |
| Agent presets: create, edit | ui-agent-preset | ☑️ | Agent presets › New / Copy / Edit (a native form, written through a Cordis plugin) |
| Account and balance | ui-settings-account · Settings › Account and balance | ☑️ | Settings › the top card › Account |
| Model providers and keys | ui-settings-models · Settings › Models | ☑️ | Settings › Models (DeepSeek account / API key, ChatGPT and Claude subscription login, custom channels; channels created by a subscription are read-only); All features › Settings › Models |
| Subagent settings (recursion depth, parallelism, optional models) | ui-settings-subagent · Plugins › Subagents | ☑️ | Settings › Engine parameters › Subagents |
| Agent loop (parallel tool call limit) | ui-settings-agent-loop · Plugins › Agent loop | ☑️ | Settings › Engine parameters › Agent loop |
| Command execution (timeout, output limit) | ui-settings-shell · Plugins › Terminal | ☑️ | Settings › Engine parameters › Command execution |
| Web search (key, endpoint, budget) | ui-settings-web-search · Plugins › Web search | ☑️ | Settings › Web search |

## Plugins

| Official feature | Official package · official entry | Status | App entry |
|---|---|---|---|
| Plugin management: install, enable, disable, remove | ui-plugin-manager · side panel "Plugins" | ☑️ | Settings › Plugins; All features › Plugins; the top right of plugin details can share (link / QR code, or an image card) |
| Plugin market | ui-plugin-market · Plugins › Discover | ☑️ | Plugins › Plugin market |
| Experimental plugin switches (team, voice, translation, worktree…) | ui-plugin-manager · Plugins › Experimental plugins | ☑️ | Plugins › Installed (official optional plugins have only a switch) |
| A plugin's own configuration page | ui-plugin-manager · plugin details | ☑️ | Plugin details › Settings (natively rendered from the form the plugin declares); Settings › Engine parameters › Plugins |
| Plugin inventory (all loader rows, read-only) | ui-settings-plugin-inventory · Settings › Built-in plugins | ☑️ | Settings › Engine parameters › Plugin inventory |
| Cordis plugin panel (dynamic plugins created by plugins while running) | ui-cordis · bottom left of the sidebar | 🔄 | All features › Cordis (list, status, stop, remove); approving runs and plugin UIs are in the web version (Cordis page › Open in web version) |

## Workspace, settings and appearance

| Official feature | Official package · official entry | Status | App entry |
|---|---|---|---|
| Workspaces: add, switch, group, pin | ui-workspace, ui-directory-picker-browse · sidebar | ☑️ | The workspace switcher above the chat list in the drawer; All features › Workspaces (add, rename, group, pin, remove); the new-chat empty state shows which workspace it will be created in |
| Directory picker (in-app browsing / system dialog) | ui-directory-picker-* | ☑️ | Native directory browsing when adding a workspace (the host file system; on this phone there are also shortcuts such as "Phone storage" and "Downloads") |
| General settings: language, show code work view, link opening mode, performance and usage, Enter to send | ui-settings-general, ui-chat, ui-conversation | ☑️ | Settings › Interface › Web version display / Web version sending (these engine-side switches; the app's own display settings are in Settings › Appearance) |
| Session log upload (official API) | ui-settings-session-log · General settings | ☑️ | Settings › Privacy and sharing › Upload chat logs to DeepSeek (a native switch) |
| Appearance, font size | ui-theme · General settings | ☑️ | Settings › Appearance (the app's own theme and font size; the web version still uses its own settings) |
| Three-column layout (AppFrame) | dsh-client-ui-layout · three-column AppFrame | ☑️ | `AdaptiveScaffold`: three columns at ≥840dp, with the left collapsing to a rail when it doesn't fit |
| Shortcuts | ui-shortcuts | ➖ | A phone has no keyboard shortcuts; they can still be edited in the web version's General settings |
| Onboarding, preview-version notes | ui-settings-general, ui-settings-models | ☑️ | The app's own onboarding pages |
| The web version as a whole | dsh-web-frontend | ☑️ | The switch key on the drawer's brand row; All features › Web version; Settings › Interface › Open web version |

## App's own (not in the official web version)

| Feature | App entry |
|---|---|
| Sharing (link, image, file, text; reply, selected messages, whole conversation, artifact files, plugin cards) | "Share" below a reply, long-press a reply / ⋯ › Share; long-press a chat in the drawer › Share; artifact file menu › Share; plugin details › Share › Image |
| Share codes (plugins, whole configurations, link / QR code / `.dshgo` file) | Plugin details › Share › Share link; Settings › Privacy and sharing › Share configuration; All features › Share configuration; opening a `dshgo://` link or a shared-in file imports automatically |
| Community (forum, featured plugins, prompts, chat groups, updates) | Settings › Help and about › Community; All features › Community; All features › Forum |
| DS Bot (Bot teams, group chats, memory, notifications) | The "DS Bot" row at the top of the drawer list (the Bots' chats are all folded in this row, with unread counts); All features › DS Bot; tapping a Bot notification goes straight to the matching Bot or group chat |
| Subscription login expiry notice | The "Log in again" on the "ChatGPT / Claude login expired" row in chat |
| Regenerate (regenerate in a new chat, the original unchanged) | The last reply's action bar ↻; long-press a reply / ⋯ › Regenerate |
| Quote follow-up (the quote sits above the composer and is sent as a quote block) | Long-press a reply / ⋯ › Quote; select a passage in Select text › Quote |
| Save images to the gallery | Long-press an image in a message › Save to gallery; the top right of the image viewer |
| System integration (share in, desktop shortcuts, quick-settings tile) | Other apps › Share › DSH (text / images / files into a new chat; a single .dshgo or a share link goes to import); long-press the desktop icon › New chat / Voice input / the latest 3 chats; pull down Quick settings › New chat; other files opened with DSH go into a new chat |

## How deep links land

The official web client has no routes: no hash, query or pathname, and `ctx` isn't attached to `window`. So the app doesn't assemble URLs but lands on the page through the injected script `app/assets/web/dsh_web_open.js`. `WebViewPage` injects this script on every load, and after the first load calls `window.__dshAppOpen(target)` once. The structure of target is in `app/lib/ui/web/web_target.dart`, and what the script does per target is:

- **Session**: write the selected session the official side restores at startup, `localStorage['dsh.sessions.current'] = {"sessionId": …}`, then refresh once. After the refresh the script reads the remaining target back from `sessionStorage` and carries on.
- **Global panels** (plugins / automation tasks): click the sidebar `button[aria-label="Plugins" | "Automation tasks"]` (the labels are matched by their accessibility names, in both Chinese and English).
- **Settings section**: click the account menu › Settings, then the matching navigation item (General settings / Models / Built-in plugins / Agent presets). If the sidebar has a standalone "Settings" button, click it directly.
- **Plugin card**: open the plugin panel. When parked on some plugin's details (or on one of its component pages), first go back level by level to the list using the back at the top (at most three presses, waiting for the page to draw each time), then click the card: first find it by the package name / entry id the official side marks on the card (`data-plugin-package` / `data-plugin-item`), and if not found, by `View <name>`. When experimental plugins are folded behind "More", expand them first. An empty name doesn't take part in matching (it would match any icon button, such as the card's enable switch).
- **Don't linger**: only the latest open is moving (a new open stops the old one); after the page has loaded, one run searches at most 15 seconds in total; the moment the user touches the screen or types in the page, it stops. A stopped one clicks nothing more and reports no result; a timeout or not-found reports the matching step, and the page stays where it got to (if the card isn't found, it stays on the plugin page).
- **Right sidebar**: click "Open right sidebar" in the session top bar, then click "Workspace files" or "New terminal" on the start page. When the right pane is already open, click "New tab".
- **Sidebar**: in the phone layout use `__dshApp.toggleSidebar()`, otherwise click "Open sidebar".

Controls are matched only by accessibility name (both Chinese and English copies), without depending on hashed class names; the script only clicks and writes the official side's own storage, doesn't change styles, and doesn't add or remove official nodes. When it fails to land, the script reports the failed step through the `DshAppOpen` JS channel, the app shows a one-line notice in Chinese, and the page stays on the home page.

Remote hosts: SSH hosts open the remote's web version through the app's local forwarding `http://127.0.0.1:<forwarded port>/?token=…`. DSH's browser protection accepts any loopback Host, which was verified by reading the source of `isTrustedApiRequest` in `dsh-client-connection`, but wasn't run on a real SSH host. Hosts relayed via DSH Remote have no HTTP channel, and the web version entry prompts to open it on that computer.

Measured: on a computer start `dsh web` of DSH 0.2.1-rc.2 from the runtime, with HOME pointing at a temporary directory, and inject the same script in a browser. These targets all landed correctly: plugins, automation tasks, Settings › Models / Agent presets / Built-in plugins / General settings, plugin cards (subagents, agent loop, terminal, agent team, voice input, reasoning machine translation), opening the terminal / files after switching sessions, the sidebar. At phone width (375px) plus the injected phone layout, settings, panels, plugin cards, the sidebar and the terminal were tested again. "Account and balance" appears only after logging in to an official account; when not logged in the script reports failure, so the summary page's account entry uses a native page.

## Update log

- 2026-10-24: the terminal, workspace files and document preview, workspaces and the directory picker, subagent lineage and continued chat, agent team, reasoning translation, `@` references, voice input, engine settings (subagents / agent loop / command execution / web search / general settings / log upload), plugin configuration pages and the plugin inventory, automation task editing, and Agent preset editing were all made native, and the corresponding rows changed to ☑️; in All features only "Web version" itself remains a web entry. A section "App's own" was added.
- 2026-10-24 (second batch): the todo bar, goal bar and top-bar reminder clock were made native and changed to ☑️; Cordis got a native list page, changed to 🔄; the drawer gained folders, filters, pending / unread markers, multi-select and sorting; the wide-screen three columns and right pane; "App's own" gained regenerate, quote follow-up, gallery saving, system integration.

## Gaps and follow-ups

- **Download the session log (`/export`)**: ☑️ implemented natively (`lib/ui/features/session_export_page.dart`). Like the official side, it GETs `api/session.export?sessionId=…&includeDescendants=true` to get a ZIP (`dsh-session-<id>.zip`), then goes through the system share or saves to "Download/DSH". Entries: `/export` in the composer, All features › Export chat log. Hosts relayed via DSH Remote have no HTTP channel and can't export, and the page says so.
- **Credential masking**: ☑️ implemented natively (`lib/ui/chat/secret_mask.dart`), with the matching rules ported from the official `lib/client.js`.
- **Native candidates**: approving runs of Cordis and plugin UIs (currently in the web version).
- **Awaiting real-device verification**: whether deep links all land correctly in the phone WebView; the web version of SSH hosts; the native terminal's soft keyboard and shortcut-key row; voice input (both system recognition and the engine plugin); the whole path of "Log in again" after a subscription login expires; the jump when tapping a DS Bot notification.
