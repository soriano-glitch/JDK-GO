# DS Bot integration design

> 2026-10-24. The finalized version of roadmap P3 #3 "DS Bot integration". DS Bot ([Fei2411/DeepSeek-Bot](https://github.com/Fei2411/DeepSeek-Bot), Apache-2.0) is a plugin that turns DSH into a set of long-lived Bots: the main Bot "Chief", user-created Bots (each with memory and a model), group chats with admins, @ mentions, and Bots assigning work to each other. The interface notes on the DS Bot side are in its repository's `docs/plans/2026-10-24-mobile-api.md` (branch `dsh-app-mobile`).

## 0. Conclusion

- **The phone is a first-class DS Bot client, drawn natively, with no embedded web.** The Bot home, private chats, group chats, Bot details, group details, and new Bot / new group chat are all native pages.
- **The protocol goes through DS Bot's own channel**: local and SSH use `POST /api/bot` + `GET /api/bot/feed` (SSE), like its desktop app; the same set of calls is also registered as the DSH Remote methods `dsBot/call` + `dsBot/feed` (stream), for relays that forward only Remote methods. The above is the "mobile API v1" (handshake, group chat entries, reminder catch-up, avatar references, direct memory edits, usage summary), and both sides were changed.
- **It follows the current host**: if the host switcher picks local, the Bot page is the team of the DSH on the phone; pick the NAS, and it is the team on the NAS. If local isn't installed, one tap on "Install DS Bot".
- **SSH works; the relay goes through Remote methods**: the relay (ds-harness-remote) forwards only the Remote methods on its allowlist. DS Bot already provides `dsBot/call` and `dsBot/feed`, and the phone automatically switches to this route on the relay; what remains is adding these two names to the relay's allowlist (its Host plugin and the local copy in `dsh_remote`), see §6.
- **Notifications are sent by the Bot itself**: DS Bot's reminders (a Bot speaking, a post in a group, handing in work, waiting for your answer / approval) become system notifications like "Chief: …"; the generic "turn complete" notification skips DS Bot sessions, or one sentence would ring several times.

## 1. Two forms

| | Local | Remote (NAS / computer) |
|---|---|---|
| Where DS Bot is | The `ds-bot` plugin of the DSH on the phone | DS Bot's Docker image, or `dsh web` + the plugin on a computer |
| How to connect | Local HTTP (the existing `DshHttpCarrier`) | SSH tunnel: the same `DshHttpCarrier`, usable as is; relay: the Remote methods `dsBot/call` / `dsBot/feed`, usable once the allowlist permits |
| When not installed | "Install DS Bot": goes through the same install flow as the plugins page (`runPluginInstall`, package name `ds-bot`), and after installing prompts to restart the engine | Shows the command to run on that computer, without remote install (installing a plugin remotely requires restarting the other side's DSH) |
| Version too old | "Update DS Bot": the same flow, `replaceInstalled` | Prompts to update on that computer |
| Background | The local engine has a foreground service, and the feed stays connected | Best effort: received only while the app process is alive and the link is up (consistent with existing remote notifications) |

The cost of running a team locally on the phone must be stated clearly: every Bot turn runs inside the phone's proot, and a group chat turn calls several models and runs several sessions, with battery and memory use clearly higher than an ordinary chat. It suits "carrying a Chief around", leaving heavy work to the NAS.

## 2. Protocol contract (the part the app relies on)

Transport: on the HTTP carrier use `DsBotHttpTransport` (the `DshConnection` address, `Host` header and session cookie, with `connection.dart` unchanged); on other carriers, as long as `dsBot/call` and `dsBot/feed` are allowed, use `DsBotRpcTransport` (`rpc.call` + `mux.open`), with replies and errors the same as HTTP. When neither works, `DsBotApi.of(client)` returns null; a relay rejection (`METHOD_NOT_ALLOWED`) also counts as "relay". In both cases the page shows "Relay connections don't support Bots yet".

| Purpose | Interface / event | Source |
|---|---|---|
| Handshake | `hello {client, api:[1]}` → `api / apiMin / apiMax / capabilities / boot / seq / plugin.version / readOnly` | New |
| Team | `state {since, avatars:'ref'}` (with `unchanged` only live is carried) | Existing + new parameter |
| Avatar | `avatar {botId}` → `{ref, image}`, cached by `ref` | New |
| Private chat | `chat {botId, cursor}`, `send {sessionId, text}`; feed `message` / `stream` | Existing |
| Group chat | `room-chat {roomId, cursor}` → entries with the speaker, `running`, `speaking`; feed `room` | New |
| Reminders | feed `notice`; `notices {boot, since}` catch-up, re-read the team on `reset` | New |
| Cards | `answer-question`, `dismiss-question`; group member approval `approval-answer` | Existing |
| Management | `create-bot` / `update-bot` / `delete-bot` / `set-main` / `create-room` / `update-room` / `delete-room` / `stop-member-work` | Existing |
| Memory | `memory-view` / `memory-forget`; `memory-add` / `memory-edit` (not via the model) | Existing + new |
| Usage | `usage-summary {botId}` → last 24 hours / 7 days / 30 days, by model | New |
| Relay | Remote method `dsBot/call {endpoint, payload}`, stream `dsBot/feed {}` (each item `{event, data}`); `hello.rpc`, capability `rpc` | New |

**Version rules** (both sides evolve by these):

- Only additions (new interfaces, new fields, new entry / reminder kinds, new feed events) don't raise `api`, and are written into `capabilities`; clients always skip fields and kinds they don't recognize.
- Only changes that would make old clients misread raise `api`, and the server answers across `apiMin..apiMax`; the app sends the list of versions it knows and takes the highest in the intersection.
- No `hello` (`bot/not-found`) = DS Bot is too old; `api: null` = no intersection. Both show "Update DS Bot", with a one-tap update locally.
- Before using an optional capability the app checks `capabilities` (for example if `memory-edit` isn't there only deletion is offered).

**Disconnect and catch-up**: when the feed drops, it reconnects with backoff of 0.5 / 1 / 2 / 5 / 10 seconds; each `hello` carries `boot` and `seq`, the app remembers the last ones, first catches up on missed items with `notices {boot, since}`, then re-reads `state` as needed. Returning to the foreground, network switches and host reconnects all go through this path.

## 3. App pages

| Page | Skeleton | Content |
|---|---|---|
| Bot home | C list | Large title "Bot" + a status line ("This phone · 4 Bots") → "Bot" group: main Bot pinned (small "Main" badge), the rest by recent activity; a row = 40 avatar (photo / first letter + Bot color), name, last sentence or "Running a command", time, unread count → "Group chats" group: stacked member avatars, group name, "Writer: last sentence" → at the bottom two rows "New Bot" and "New group chat" |
| Bot private chat | Chat | Reuses the chat page's `Composer`, `MarkdownBody`, `UserBubble`; top bar = back + avatar and name + status ("Thinking", "Running a command") + details; entries come from `chat` paging (segments joined into one conversation), the feed's `stream` types in real time; question cards, waiting-for-model cards, pending approvals |
| Group chat | Chat | Each message carries an avatar + name (consecutive messages from the same person merged), an "Admin" small badge, event rows within a turn ("Writer started work", "Writer finished the work"); a member who is speaking shows "Coder is typing"; an @-member picker bar above the composer |
| Bot details | B details | `PageHero` (avatar, name, role, three data cells: today's tokens / memory count / number of group chats) → profile (model (reusing `showModelSheet`), name, role, description, color) → memory (summary, list, edit, delete, add) → usage (day / week / month, by model) → full record, set as main Bot → delete |
| Group details | B details | Pending approvals + "Allow once / Reject" → members (admin badge; those working carry "Stop"; tap in: private chat / make admin / remove from group; add member) → who answers first (admin first / everyone in turn), group name, group announcement → group memory → delete group chat |
| New Bot | D form | Name, role, description, color, model; "Create" fixed at the bottom |
| New group chat | E sheet | Group name (may be empty), tick members (2–12); the admin uses DS Bot's default (the main Bot among the members), and after creation the admin greets first; "Create" |

Decisions:

- **Private chat uses DS Bot's entries, not the generic chat page directly.** A Bot's private chat spans multiple session segments (switching segments when context is full), with a handoff packet at the head of a segment and hidden turns between Bots in the middle; the generic chat page would draw these as user messages, and after a segment switch it looks cleared. The entries are split by DS Bot and the phone only draws them. The cost: tool call details aren't shown; the details page keeps a "Full record" entry that opens the current segment read-only with the generic `ChatList`, so every step can be seen when needed.
- **The group chat speaker rules exist in only one place on the server** (`room-chat`), and the phone doesn't split `group_relay`.
- **Unread is counted per device**: for a Bot / group not being viewed, each reminder adds one to unread, and opening it clears it to zero. DS Bot doesn't store read state; the phone remembers, per host, the reminder sequence read (`boot` + `seq`), and after the app reopens or reconnects it first catches up on missed reminders.
- **No banner in the foreground**: while in the app only the unread dot updates; a system notification is sent only after switching to the background. The Bot / group being viewed doesn't remind.

## 4. Notifications

| DS Bot reminder | System notification | Channel |
|---|---|---|
| `message` (a Bot speaks in private chat) | Title "Chief", body is that sentence | "Turn finished" |
| `group` (a post in a group) | Title "group name", body "Writer: …" | "Turn finished" |
| `done` (handing in work) | Title "group name", body "Writer finished the work" | "Turn finished" |
| `question` / `view` | "Chief asks you: …" | "Needs your confirmation" |
| `approval` | "Writer is waiting for your approval: bash" | "Needs your confirmation" |

- One group per Bot / group (`notifyGroup(host, 'dsbot:<id>')`), with new ones replacing old, cleared when the corresponding page is opened. The lock screen shows only "A Bot has a new message".
- It reuses `NotifyChannel` and the switches in Settings → Notifications: `message` / `group` / `done` follow "Turn complete", `question` / `view` follow "Questions", and `approval` follows "Approvals".
- **Dedupe**: the generic `HostAlertTracker` would pop a "Turn complete" once each for a Bot's private chat segments, group sessions and a member's hidden sessions within a group, with the title still the internal session name ("Writer · group name"). When DS Bot is present, these sessions are handed to Bot notifications and the generic notification skips them (one line of wiring, see §6).
- **Tapping a notification**: `kind` is `dsbot-bot` / `dsbot-room`, `sessionId` holds the Bot / group id, and tapping opens the corresponding page (one line of wiring).

## 5. What changed on both sides

**DS Bot (branch `dsh-app-mobile`, based on `dev`, 4 commits, not pushed)**

- `src/host/mobile.js` (new): `hello`, `notices` (in-memory ring buffer of 200, `boot` distinguishes restarts), `room-chat` (splits speaker entries out of group sessions, with the turn in progress placing the current messages in place and ids consistent before and after), `avatar` and `state {avatars:'ref'}`, `usage-summary`, and the `memory-add` / `memory-edit` routes.
- `feed.js`: new events `notice`, `room`; `hello` carries `api / boot / seq`.
- `groups.js` / `tools.js` / `approvals.js`: one hook each, where a group chat line is recorded, a question card / view card is produced, and approval is awaited, to produce reminders.
- `memory.js`: `memoryEdit` / `memoryAdd`, with the same checks as the tools.
- Tests `test/mobile.test.js` (9), `test/remote.test.js` (2), the `install.test.js` order table; after rebasing to `dev`, 974 in total (972 passed, 2 skipped as before), lint with no new warnings, `client.js` untouched.
- `src/host/remote.js` (new): the two Remote methods `dsBot/call` and `dsBot/feed`, `TypertRemoteService` + a manually applied `@Remote` marker (pure-JS plugins have no Typert generator, and are served by the Gateway's source mode), mounted only when there's a Typert Gateway; `feed.js` adds a subscription interface, with the same events as SSE. Measured with a disposable DSH: unary calls, streams, and disconnect and reopen all work.
- Docs `docs/plans/2026-10-24-mobile-api.md` (in Chinese, per its repository's convention).

Why change DS Bot rather than have the phone assemble it itself: how group chats are split, how reminders are judged and how big avatars are are all best known to the server, and only on the server can the desktop app and later clients share them. Not one interface or event used by the web version was changed.

**dsh-go**

- `packages/dsh_client/lib/src/dsbot_api.dart` (new): two transports (HTTP routes, Remote methods), models, all interfaces, a feed with automatic reconnect, and the Bot color algorithm (same result as DS Bot's `defaultColor`, with a cross-check test).
- `app/lib/state/bots_state.dart` (new): the current host's DS Bot state (not installed / too old / relay unsupported / ready / error), team and live state, feed and catch-up reads, private and group chat controllers, unread and Bot notifications, avatar cache, memory and usage.
- `app/lib/ui/bots/` (new): `bots_page` (home), `bot_chat_page` / `room_chat_page` (chat), `bot_chat_kit` (top bar, page frame, message rows, question card / view card / model-choice card), `bot_details_page` / `room_details_page`, `memory_card`, `new_bot_page`, `new_room_sheet`, `bot_mention` (@ picker bar), `bot_avatar`, `install_card`, `bot_sheets`, `bot_alerts` (for shell wiring), `drawer_row` (the "DS Bot" row in the drawer), `bot_format`.
- Tests `app/test/bots/`: state and pure functions, page flows, geometry, 8 light + dark goldens. A pass over the state layer was also run with a real disposable DSH (the `ds-bot` branch + its mock model): send a message → reply → background notification → unread, a group chat turn → entries with speakers.

## 6. Wiring needed elsewhere

| Location | Change | Reason |
|---|---|---|
| Drawer / All features | Add an entry "Bot" → `Navigator.push(BotsPage.route())` (`ui/bots/bots_page.dart`), icon `Icons.smart_toy_outlined`; the badge can use `ref.watch(dsBotInboxProvider).total` | Home entry |
| First line of `notify_state.dart` `ChatAlertsController._onAlert` | `if (ref.read(dsBotSessionFilterProvider)(alert.host, alert.sessionId)) return;` | Generic "turn complete" and similar notifications skip DS Bot sessions |
| After `if (!mounted) return;` in `ui/notify/chat_alert_host.dart` `_onTap` | `if (openDsBotTap(context, tap)) return;` | Tapping a Bot notification opens the Bot / group chat page |
| Where `ui/shell/sessions_drawer.dart` gets the session list | `final hidden = ref.watch(dsBotOwnedSessionsProvider);` then `.where((s) => !hidden.contains(s.sessionId))`, and put `DsBotDrawerRow(onOpen: …)` (`ui/bots/drawer_row.dart`, taking no space when there's no DS Bot) at the very front of the list | A Bot's sessions fold into one row "DS Bot · 3 Bots", with an unread count / running dot |
| `harnessRemoteAllowlist` in `packages/dsh_remote/lib/src/carrier/tunnel_carrier.dart` | Add `'dsBot/call',` and `'dsBot/feed',` | Local relay allow; the ds-harness-remote Host plugin allowlist needs the same two items too |
| In the shell Stack in `ui/shell/home_shell.dart` (next to `ChatAlertHost`) | `const BotAlertsHost(),` | Bot notifications live with the shell, reconnecting the feed on returning to the foreground |
| `ui/chat/composer.dart` | Add `final String? hintText;` (with `this.hintText,` in the constructor), change the last branch of `hint` to `: widget.hintText ?? 'Message DSH…',`; then in `bot_chat_page.dart`'s `Composer(` add `hintText: 'Message ${bot.name}…',`, and in `room_chat_page.dart` add `hintText: 'Say something to the group…',` | Placeholder text on the Bot pages |

The @ picker bar is built in: `BotMentionController(input: text controller, members: members, admin: admin id)` + `BotMentionPicker(controller: …)`, which the group chat page puts above the composer, with `Composer(onKeyEvent: mentions.handleKey)` wiring up the hardware keyboard. The composer's left key mirrors the send key: group chat has a 40-round "@" key (`MentionKey`, which inserts `@` and opens the member list when tapped), and private chat has no attachments (DS Bot's `send` accepts only text), leaving a same-size blank seat on the left (`ComposerSeat`), so the body start matches the main chat; the geometry test measured it per the end-cap rules of `composer_geometry_test.dart`.

## 7. Risks

- **The place most likely to go wrong**: the feed is a long connection, and Android background, SSH tunnel reconnects and DSH restarts all break it. Catch-up only guarantees reminders "from before the restart" aren't lost; reminders during a DSH restart are lost (the server doesn't persist them), and the phone can only re-read the team and fall back on the last sentence in the list.
- **The strongest argument against this plan**: it ties DS Bot into dsh-go's maintenance surface, and once DS Bot changes the internal format of group chats, the phone might draw wrongly. Mitigation: the format splitting stays in DS Bot's `room-chat`, and the phone depends only on entries; the version rules let DS Bot add fields first and the phone follow later.
- Running group chats locally on the phone is heavy (§1).
- The first time the Bot page is opened it makes DS Bot create the Chief automatically (existing behavior of `state`), and the Chief waits for the user to choose a model before greeting.

## 8. Decided (2026-10-24, decided by delegation from the owner)

1. **Relay**: DS Bot's interface is also made into DSH Remote methods (`dsBot/call`, `dsBot/feed`), while local / SSH still go through HTTP; on the relay `DsBotApi.of` automatically uses Remote methods. What remains is the allowlist: the ds-harness-remote Host plugin and the local copy in `dsh_remote` each add two items (§6).
2. **Push**: not for now; remote Bot messages arrive while the app is alive.
3. **Drawer**: a Bot's sessions aren't scattered in the list but fold into one row "DS Bot" (`DsBotDrawerRow`), tapping into the Bot home.
4. **Preinstall**: not preinstalled, keeping one-tap install.
5. **DS Bot branch**: has been rebased onto `dev` locally, with tests and lint passing; whether to push and open a PR is executed after the owner confirms in the session.

## 9. Still open

- The relay allowlist needs cooperation from the ds-harness-remote side (`HARNESS_REMOTE_ALLOWLIST` in the Host plugin).
- Remote methods go through the Gateway's source mode: parameters and replies are validated only as JSON, not by generated types. If DSH opens the generator to plugins or a hand-written descriptor registration, switch to strict mode.
