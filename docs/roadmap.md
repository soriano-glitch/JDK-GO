# dsh-app roadmap

> Drafted 2026-10-23, updated 10-24 after checking the code (the built-in engine was DSH 0.2.1-rc.2 at the time; the second wave of nativization and integration is under "P1: native versions of official features"). It has not been re-checked item by item since; what each version actually shipped is as in [changelog.md](changelog.md). Status: ☑️ done · 🔄 in progress · ⬜ not started. Priority is ordered by "can lower-tier users use it daily". Items not finished are plans, not promises.
> "☑️" means only that code and tests are done; ones marked "awaiting real device" have not been run on a phone, and only those marked "verified on a real device" have been run on a real device. For the item-by-item comparison with official features see [official-parity.md](official-parity.md).

## P0: usable daily (1–2 weeks)

| # | Item | Status | Key points |
|---|---|---|---|
| 1 | Access phone files | ☑️ verified on a real device | A switch in settings, off by default. After granting storage permission, internal storage is mounted at `/sdcard` of the Linux environment, and the global AGENTS.md tells the model; after toggling, the engine restarts automatically |
| 2 | Upgrade to DSH 0.2.1-rc.2 | ☑️ r3 installed on device (upgrade path verified on the emulator: runtime reinstalled automatically, sessions kept) | The client is compatible with both 0.2.0 / 0.2.1; the `link()` patch isn't needed for now; with no credentials filled in the model catalog is empty, and the app must prompt |
| 2b | DeepSeek account login (OAuth) | ☑️ awaiting verification on a real device with a real account | Reuses the Host's `deepseek-account` service (dsh-TUI already implemented it); after login the `deepseek-account` model can be used without an API key, and the account balance can be queried. The onboarding page becomes "Account login (recommended) / I have an API key" |
| 3 | Notifications for task completion / awaiting confirmation | ☑️ awaiting real device | In the background: turn finished (done / error / stopped), approvals and questions → system notifications, tapping goes straight to the session; foreground not in that session → a top glass banner; lock-screen redaction; per-channel, grouped by session, withdrawn automatically once handled elsewhere. Events come from the `$events` each host already has, with no extra subscription. Settings → Chat → Notifications for per-item switches. The home back key changes to going to the background (otherwise the engine and notifications drop together) |
| 4 | Transparent system bars, breathing room | ☑️ | Transparent gesture bar; the chat top bar is the same as second-level pages: no fade at rest, fading into the page color only once content scrolls under the top bar (fixing the hard line from the fade being cropped by its container); the web version is full-bleed + floating glass controls + injected margins |
| 5 | Stability | ☑️ background keep-alive verified on a real device | Existing: crash classification + automatically restarting in safe mode when a plugin crashes it, last-known-good configuration restore, one-tap copy of diagnostics, diagnostics package export (All features › Diagnostics; also exportable from the engine-start-failure card) |
| 6 | Safe mode | ☑️ | Like dsh-TUI: after a plugin crashes DSH, start DSH with a pre-prepared clean profile to repair itself; can restore the last known good plugin configuration |
| 7 | In-app updates | ☑️ awaiting real device | GitHub Releases (`ccch1mneyyy/dsh-go`) + fallback to domestic mirrors, SHA-256 verification, PackageInstaller install; checked once a day at launch, manually in Settings → About. Release conventions in [release.md](release.md). Prerequisites: the repository is public and every release carries `update.json`; official releases must use a fixed release key, see "Signing" in release.md |

## P1: chat experience (in progress)

| Item | Status |
|---|---|
| Grouped summaries on tool rows + per-turn change card (tap to see the diff) | ☑️ |
| Slash command panel (DSH command catalog + `/new` `/model`) | ☑️ |
| Usage and balance (session tokens, context, DeepSeek balance / account wallet, low-balance reminder) | ☑️ |
| Attachments: gallery / camera / files; a pending-send strip above the composer; thumbnails and file cards in messages, tap an image to enlarge. Uses the DSH native protocol (images inline, files referenced by receipt after `fileUploads/upload`), verified against a real dsh web | ☑️ |
| Sending while generating: interjection by default (DSH `steer`, which the AI sees at its next step without interrupting); long-press send to choose "Stop and handle this first" or "Queue"; a queued message can be changed to an interjection or withdrawn (returning to the composer after withdrawal); queued messages from other devices are also shown | ☑️ unit tests cover it; not verified on a turn actually running |
| Chat text size: Settings → Appearance → Chat text size (Small / Standard / Large / Extra large), enlarging only chat content, stacked on the system font size | ☑️ |
| Message actions: copy, share, fork from here, regenerate (action row), select text, quote, re-edit (menu); long-press and ⋯ share the same menu; message images can be saved to the gallery | ☑️ gallery saving awaiting real device |
| Run info: turn footnote (time, steps, tokens), trace, step details, change diff page | ☑️ |
| Whole-turn collapse: a normally finished turn folds reasoning, tool calls and intermediate messages into one row "Done · N tool calls", leaving the answer outside (the official Web's approach); stopped / errored turns aren't folded; can be turned off in Settings → Appearance | ☑️ |
| Thinking row: official atom icon; first-line preview shown when collapsed; expanded is Markdown | ☑️ |
| The thinking capsule above the composer: status + tool target + fun copy / easter eggs (per working-activity) + this turn's time; official blue; a four-tier whale-tail indicator switching by output speed (TPS), long-press to see the speed | ☑️ awaiting real device |
| Artifact file cards + official deliverables: at the end of a turn "Delivered / generated N files", in-app preview of images / PDF / Markdown / text, Office converted to PDF by the Host; open, share, save to "Downloads", copy path; Chat details › Files has all outputs | ☑️ awaiting real device |
| Session search: at the top of the drawer, instant title matching, multi-keyword, highlighting; the local engine has the content index on (Chinese only finds words separated by punctuation) | ☑️ |
| Export session log (`/export`): the whole conversation packaged as a ZIP, shared or saved to "Downloads" | ☑️ |
| Credential masking: keys / tokens / private keys in sent messages show only the first 8 characters, tap the eye to show (ported from the official `dsh-client-ui-secret-mask`) | ☑️ |
| Fix for the Markdown task list `- [ ]` error | ☑️ |
| Interactive replies (dsh-ui) phase 1: ```` ```dsh-ui ```` in a reply drawn as native cards (metrics, four chart kinds, comparison cards, steps, callouts, options, confirm), reply back after selection, answered / expired states, streaming skeleton and fallback; the instructions for the model are written into the local AGENTS.md and can be turned off in settings | ☑️ awaiting real device, no model evaluation done |
| Global revamp v2: five page skeletons, the drawer identity bar, the settings overview card, the model chooser page, the capsule slider, iOS-style transitions, unified copy and terminology. Specs in [design/polish-guide.md](design/polish-guide.md), [design/page-design.md](design/page-design.md) | ☑️ awaiting real device |

## P1: native versions of official features (10-24 second wave)

The features of the official web version are made into native pages one by one, and in "All features" only "Web version" itself remains as a web entry. For the item-by-item comparison see [official-parity.md](official-parity.md).

| Item | Status |
|---|---|
| Terminal: the terminal key at the top right of chat details, multiple tabs, a shortcut-key row, the terminal keeps running after leaving the page | ☑️ awaiting real device |
| Workspace files and document preview: browse, search, text / image / PDF / spreadsheet preview, Office converted to PDF by the host | ☑️ |
| Workspaces: switch in the drawer, add (native directory browsing), rename, group, pin; the new-chat empty state shows which workspace it will be created in | ☑️ |
| Subagents and agent teams: lineage tree, tap to continue chatting, the tool row "Subagent · …" jumps straight there, one-shot subagents are read-only; team members, task board and messages | ☑️ |
| Input: `@` to reference files / chats / subagents; voice input (system recognition first, engine plugin as fallback) | ☑️ voice awaiting real device |
| Reasoning translation: tap "Translate" after expanding the reasoning | ☑️ |
| Engine settings: subagents, agent loop, command execution, web search, general settings, log upload, native rendering of forms bundled with plugins, plugin inventory | ☑️ |
| Create / edit automation tasks (run time, time zone, cron), create / edit agent presets | ☑️ |
| The automation clock on the chat top bar: when there are tasks in progress, a clock key appears at the end of the title capsule, tap to see the next few runs, run now, enter task details | ☑️ |
| Model channels: DeepSeek, ChatGPT / Claude subscription login (the engine-side login bridge), custom channels; when a subscription expires the chat prompts "Login expired" with the option to log in again | ☑️ awaiting real account |
| Sharing: one panel, link / image / file / text (reply, selected messages, whole conversation, artifact files, with privacy set in one place); plugin cards; share codes (plugins, whole configurations, link / QR code / `.dshgo` file, import via `dshgo://` links) | ☑️ awaiting real device |
| System integration: share in, desktop shortcuts (new chat, voice input, the latest 3 chats), the quick-settings tile "New chat" | ☑️ awaiting real device |
| Skills "Use in chat / Use in a new chat"; the buttons in the new-chat empty state in two tiers | ☑️ |
| Drawer organization: self-made folders (color / emoji, collapse, drag-to-reorder, stored per host on this device), filters (All / Running / Pending / Unread), pending and unread markers, multi-select batches (move to folder · pin · archive, undoable), sorting by recent activity / creation time | ☑️ awaiting real device |

## P1: session sidebar + plugin seams (2–3 weeks)

Status (10-24): the phone form is done as the **chat details page** (six tabs: Trace / Changes / Files / Progress / Context / Subagents, entered from the top bar's title capsule) and the progress capsule above the composer ☑️; the foldable / tablet form (≥ 840dp permanent right pane) ☑️; plugin tabs ⬜. The whole plugin seams section ⬜ (waiting for `@dsh-std/ui`). There is also the "All features" page: every feature of the official web version has an entry (a native page or going straight to the matching web page), see [official-parity.md](official-parity.md).

### Session panel (a bottom panel on the phone, not a right sidebar)

A phone in portrait can't fit a second sidebar: on the left is already the session / host drawer, and sliding out another on the right would conflict with the first drawer's gesture, and the top right is out of reach for one hand. So by screen width there are three tiers:

| Screen width | Form | How to open |
|---|---|---|
| Phone (< 600dp) | Bottom panel, two heights: half screen (chat still visible) / full screen; switch with tabs at the top | Tap the top bar's title capsule; or tap the progress bar above the composer |
| Unfolded foldable / small tablet (600–840dp) | Bottom panel, with the half-screen tier widened | Same as above |
| Tablet landscape / large screen (≥ 840dp) | Permanent right pane (like desktop Claude / Codex), collapsible | Top bar button |

☑️ Done: permanent right pane at ≥840dp (collapsible, state remembered; a rail on the left when the sidebar doesn't fit); a wide bottom panel with two heights at 600–840dp; <600dp unchanged. The code is in app/lib/ui/shell/adaptive/.

**Progress bar (done)**: when there are to-dos, a row permanently above the composer reads "3/7 · Now: running tests", tapping expands the whole checklist in place; when there is a long-term goal, a goal bar below it can be edited, paused / resumed and cleared.

The tabs, with all data from DSH session projections (`projections`) and existing interfaces:

| Tab | Data source |
|---|---|
| Progress | The `todos`, `plan`, `goal` projections |
| Files | `fs/listDirectory` (workspace); with phone files on, an added `/sdcard` entry; files changed this turn pinned on top (from the change card) |
| Context | `contextPressure`, `tokenUsage`, `contextBreakdown` (the existing usage panel merged in here) |
| Subagents | `subagentCatalog`, `subagentTiming` |
| Plugin tabs | Host-rendered panels registered through the `chat.panel.tabs` seam |

The sidebar of the web version (DSH Web) is handled separately: the app injects a phone layout into the embedded web page (`app/assets/web/`), the left sidebar becomes a drawer and settings become a full-screen page, see "Web version adaptation" below.

### Plugin seams

Principle: **the app's own features also register through seams** (use them ourselves first, then open them), with the seam model following `@dsh-std/ui` (the two kinds of surface dsh-TUI already uses, host-rendered / local module), so that the same plugin declaration can appear in both dsh-TUI and the app.

| Seam | Type | Example |
|---|---|---|
| `chat.panel.tabs` | Host-rendered (declarative) | A plugin provides a list / Markdown / key-value / progress-bar panel |
| `chat.header.actions` | Host-rendered | A plugin adds a top bar button that runs a command when tapped |
| `composer.actions` | Host-rendered | Attachments, slash commands, shortcut instructions |
| `tool.renderers` | App built-in module | Customize cards by tool name (such as browser screenshots, image generation) |
| `settings.sections` | Host-rendered | Isomorphic with dsh-TUI's `SettingsSection`: text / number / boolean / select |
| `web.panel` | Escape hatch | When a plugin ships its own web UI, embed it with a WebView |

## Web version adaptation (the DSH Web embedded page)

☑️ Done (`app/assets/web/dsh_web_phone.css` + `.js`, injected only into the local web version and effective at screen width < 760px):
- Remove the permanent icon bar and turn the sidebar into a drawer: tap ≡ in the app's top bar to open, tap the scrim or select a session to close automatically;
- The settings dialog becomes a full-screen page: navigation becomes a top tab strip, and settings are "title above, control below";
- Pop-ups avoid the app's top bar and gesture bar; the action buttons on a session row (More / Archive / Pin) are always shown on the selected row (before they appeared only on mouse hover and couldn't be tapped on a phone);
- Selectors use only `data-slot`, roles and CSS module class-name suffixes, and don't rely on hash prefixes that change every build. **Changing the DSH version may break the page, and must be tested:** in 0.2.2, at width below 768 the official page has its own drawer, and the original drawer stacked on top made the whole page untappable. Now at this width the official drawer and settings page are used, the app handles only safe areas, native buttons and the keyboard, and old engines and wider layouts are unchanged.
- Principle (plugins are mostly adapted from the official web version and must not be affected by adaptation): only adjust layout containers, don't change the look of official components, don't add, remove or move official nodes, and all plugin mount points `data-slot` stay in place; effective only on narrow screens; the "Web version phone layout" switch in settings turns it off in one tap to see the official original.
- The top no longer takes an extra row: the back and sidebar buttons float to the left of the web page's own title row (using CSS to open up the `headerLeading` leading slot the official reserved, without putting anything into it); pages like the plugin page and the automation tasks page shift down as a whole to make way. This saves about 52dp compared to before.
- The page root is fixed between the app's top bar and the gesture bar, and the whole page no longer scrolls with the list (fixing "scrolling to the bottom carries the composer up"); the code font is switched to the app's bundled JetBrains Mono (on Android it used to fall back to a very wide typewriter font).

⬜ Later: fine-tune the button layout in the plugin page and workspace chooser dialogs; submit this adaptation as a PR to official DSH (responsiveness should be the official frontend's job), and after it's merged, delete the corresponding rules on the app side.

## P1: companion house (Live2D companion)

For the design see [design/companion.md](design/companion.md). The goal is a lifelike feel and lasting companionship.

| Item | Status |
|---|---|
| First version: full-page Live2D that moves, can be touched and can chat, wired to the current host's Agent presets | ☑️ awaiting real device |
| Voice: TTS, real lip sync, interruption | Planned |
| Online download of asset packs | Planned (awaiting confirmation of asset licensing) |
| Inner state: mood, energy, closeness, advanced by a rules layer, with no punishment for absence | ☑️ awaiting real device |
| Persistent memory: written after user confirmation, viewable and deletable | ☑️ storage and page; automatic recall awaiting verification of the engine scope |
| Little house phase 1: snack plate, bubble ball, cushion, the host remembering activity state | ☑️ awaiting real device |
| Little house phase 2: room decoration, more objects, daily routine | Planned |
| Two chat modes: lightweight (the phone connects directly to the model, chat only) and full (the DSH engine) | ☑️ lightweight chat awaiting real device; local state and memory, and the full mode's tools and phone control are in progress |
| Speaking up proactively: off by default, with a daily budget | Planned |
| User-uploaded characters | Planned (first confirm Live2D's Expandable Application terms) |
| Combined with phone control: approval via real taps | Planned |

## P2: remote

| Option | Dependency | Effort | Suited for |
|---|---|---|---|
| A. Native integration of ds-harness-remote (Dart Relay → P2P) | Licensing and protocol cooperation from upstream ds-harness-remote (for the license and the self-written Noise see THIRD_PARTY_NOTICES.md) | 1.5–2 person-weeks (Relay MVP) + 1–1.5 person-weeks (WebRTC) | All users, scan and use |
| B. SSH remote (built in, dartssh2 port forwarding + the existing client) | None | ~1 person-week | Developers with their own servers |
| Status quo: Remote Web WebView | dsh.r2049.cn | Exists | Transitional |

Status (10-23): both A and B are done. A: `packages/dsh_remote` (Noise IK passes the official vectors; relay end-to-end tests against a self-built upstream server + Host plugin), in-app account login, host list, fingerprint confirmation; real-account login on the live dsh.r2049.cn and WebRTC direct connection (not implemented) are unverified. B: SSH remote (host fingerprint TOFU, automatically starting the remote dsh web, tunnel, reconnect on disconnect; private keys can be pasted or imported from a file), tested end to end against a temporary local sshd and the dev machine's real sshd (DSH 0.2.0-rc.2). The drawer can switch between local / SSH / remote hosts.

Status (10-31): A's direct connection is implemented and wired up. `WebRtcTransport` in `packages/dsh_remote/lib/src/transport/webrtc_transport.dart` goes over LAN / P2P / TURN (selectively enabled via `peerConnector`, and when `null` it is all Relay as before); on the app side `app/lib/state/hosts_state.dart` passes `peerConnector: flutterPeerConnector`, and `app/lib/remote/relay/dsh_remote_backend.dart` provides a `direct(bool)` switch; for scope and verification see the status table in `packages/dsh_remote/README.md` and `VERIFICATION.md` (real P2P and Relay probes with direct turned off both passed on Android 35 x86_64). Still unverified: real devices, cross-public-NAT, real TURN. The "not implemented" in the 10-23 entry above is the record of that time and is left untouched.

It's suggested to do B first and A later: B doesn't depend on anything external and can immediately make "remote to dsh-TUI / a computer's DSH" usable; A depends on the upstream relay service and goes later. Both attach to the same `HostConnection`, with "host switching" (local / computer / server) added to the drawer.

## P3: ecosystem and community

| # | Item | Key points |
|---|---|---|
| 1 | Plugin plaza | ☑️ awaiting real device: the in-app "Plugins" page (Installed / Market, official market + the dshfind index), one-tap install into local / remote DSH. Runtime r4 bundles pnpm 11.28.5, and the registry asks npmmirror first and then npmjs; install and uninstall both pass in the same-version proot on a computer. dshfind needs written permission and attribution |
| 2 | Community | ☑️ community page v1 (Settings › About › Community): forum entry, featured plugins, prompts, chat groups, updates; the content is provided by the project-maintained community.json (QQ, official account, Telegram to be filled in). The native client for the self-hosted Discourse forum ☑️, server deployment to be followed up separately |
| 3 | DS Bot integration | ☑️ awaiting real device: Bot teams, private and group chats, memory and Bot notifications on the phone; the "DS Bot" row at the top of the drawer list folds all of the Bots' chats (with unread counts). Relay connection and push to be decided |
| 5 | Phone control | ☑️ awaiting real device: the core bridge (MCP connects to DSH via an abstract unix socket, falling back to loopback TCP), safety gates, system actions, notification confirmation, settings and onboarding pages, accessibility screen reading and operation, do-not-disturb mode (virtual display, Shizuku or self-connected ADB, optional); three confirmation modes (ask every time / skip confirmation for this task / always skip confirmation), with passwords, payment/banking and system settings blocked in all three tiers. The stop key cancels the running turn through the app. Real-device joint debugging not done |
| 4 | Claude Code / Codex backend | Only through API keys or logging in to the original CLI yourself (Anthropic's terms) |

## P4: platform

- targetSdk upgrade (preparing for domestic store listing; requires a W^X-compatible way of executing).
- Pure HarmonyOS: evaluate Flutter OHOS versions.
- iOS: remote client only (iOS doesn't allow running a Linux environment locally).

## Projects worth learning from

Agents-Anywhere's network and protocol are of no use to us (everything relayed through its own server, no end-to-end encryption, its own `/api/v2`); what can be learned is experience details. Ordered by value to ordinary users in China:

| # | What to learn | Source | Goes into |
|---|---|---|---|
| 1 | Artifact file cards: generated files can be opened / shared / saved to "Downloads" directly | Whaleness, DSHA | ☑️ done (and aligned with official deliverables) |
| 2 | Attachments: gallery / camera / files | AA, saya-ch | ☑️ done |
| 3 | Local notifications: done, waiting for your answer, failed; lock-screen redaction | The foreground service already has it | ☑️ P0 #3 |
| 4 | Grouped summaries on tool rows + end-of-turn change card (diff) | AA | ☑️ |
| 5 | Voice input: system recognition first, the bundled DSH voice plugin as fallback | Whaleness | ☑️ awaiting real device |
| 6 | Usage and balance: tokens, cache hits, DeepSeek balance, low-balance reminder | 201222-L | ☑️ |
| 7 | Progress cards: todo / plan / goal, queued messages editable | Official projections | ☑️ Chat details › Progress; queued messages can become interjections / be withdrawn |
| 8 | Two-way phone file connection: the `/root/手机存储` ("phone storage") symlink, skipping on mount failure, exporting in the reverse direction to "Downloads" | DSHA | P0 #1 completion |

Licenses: DSHA, Whaleness, mobile-gateway and 201222-L are MIT, saya-ch is Apache-2.0, and code can be borrowed; dsh-pocket is GPL-2.0, reference only; Agents-Anywhere and yukiykchen lack license files and need the authors' permission; for ds-harness-remote's license see THIRD_PARTY_NOTICES.md.

## std coordination

Plugin seams depend on `@dsh-std/ui` supporting remote host-rendered and panel-type surfaces, and modification suggestions need to be submitted upstream.
