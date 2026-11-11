# Risk notices and "Ask AI"

> 2026-10-27 · Scope: unified notices before dangerous / sensitive operations; one-tap "Ask AI" for anything unclear (via the built-in dsh-go-guide skill).

**Conclusion**: risk notices appear only at the moment they change the AI's behavior boundary or grant a system permission, in three tiers: high risk is confirmed every time, medium risk on first use ("Don't show again" ticked by default), and low risk is explained in place. The high and medium tiers use the same bottom sheet `confirmRisk` (S9's `SheetDismissal.button`: title + ×, one sentence of consequences, one primary key labeled with the specific action, and an optional "Not sure? Ask AI"). Deletion kinds keep the already unified centered confirmation dialog, with only the colors fixed.

"Ask AI" doesn't send directly, but opens a new chat with the question prefilled in the composer. On the local engine, the question is prefixed with `/dsh-go-guide`, ensuring the guide is loaded. A remote host doesn't have this skill, so the app attaches the corresponding guide page; when the host doesn't accept files, a hint is shown above the composer. Entries are placed in only five kinds of places: risk notices, the disclosure before enabling phone control, the top bars of the phone control / plugins / remote hosts pages, and "Help" in Settings.

## 1. Status quo inventory

Under `lib/` (excluding directories other agents are changing, such as sharing, onboarding and plugin views) there are 42 confirmations in total, 39 AlertDialogs and 3 sheets. The table below lists only the risk-related ones; deletion kinds are listed separately in §1.2.

### 1.1 Risk and permissions

| Operation | Location | Is there a confirmation | How it's written |
|---|---|---|---|
| First time enabling phone control | `phone/phone_control_screen.dart` `_onToggle` → `phone_disclosure_sheet.dart` | Yes, only the first time (`disclosureAccepted`) | A drag sheet, five disclosures, "Not now / Agree and enable" |
| Confirmation mode → skip confirmation for this task | Same, `_pickConfirmMode` | No (deliberate: each task still asks once when it starts, as written in the test `phone_confirm_mode_test`) | — |
| Confirmation mode → always skip confirmation | Same | Yes | AlertDialog, warning icon, red-background button but **no onDanger foreground set**, with a vague "Enable" button |
| App list loosening (hands-off → as usual, step-by-step confirmation → as usual) | `phone/app_rules_page.dart` `confirmLoosening` | Yes | AlertDialog, warning icon, button **in the primary color**, "I understand the risk, change anyway"; two paragraphs of body |
| Accessibility "Go enable" | `phone_control_screen.dart` `_openA11y` | No explanation before jumping | The disclosure already covers viewing the screen and tapping, so no need to block again |
| Pet "Show outside the app" → overlay permission | `pets/overlay_settings_tile.dart` → `PetOverlayController.turnOn` | **No**, jumps straight to system settings | — |
| Settings › Auto-run commands | `settings/settings_screen.dart` `_onAutoApprove` | Yes, only when turning on | AlertDialog, red-background button with a vague "Enable" |
| Permission preset → Full access / Auto review | `features/permission_page.dart` `_confirm` | Yes | AlertDialog, red-background button, "Enable"; Full access's copy and the row above use two sets of keys, with the same Chinese |
| Approval card "Allow for this chat" | `chat/widgets/approval_card.dart` `_allowAll` | **No** | One tap turns on auto-allow for the whole chat |
| Settings › Access phone files | `settings_screen.dart` `_onPhoneStorage` | Yes | AlertDialog, **primary-color button**, storage icon, two paragraphs of body |
| Plugin market installing third-party plugins | `plugins/plugin_detail_sheet.dart` | An amber note permanently in the sheet (low tier, already in place) | `PluginTrustNote` |
| Allow build scripts | `plugins/plugin_actions.dart` `approveBuildsAndRetry` | Yes | AlertDialog, primary-color button, with a package list |
| First time trusting an SSH / Relay fingerprint | `remote/host_key_dialog.dart` | Yes | An AlertDialog locking the scrim, "Trust and connect"; red "Re-trust" when the fingerprint changed |
| Reset SSH fingerprint | `remote/ssh_host_form.dart` | Yes | AlertDialog, **primary-color button** (inconsistent with Relay's "Re-trust") |
| Public share links | `ui/share/` etc. | Another agent is redesigning, so only suggestions here (§6) | — |

### 1.2 Deletion and the irrecoverable

Workspace removal, plugin uninstall, Cordis removal, presets, scheduled tasks, channels, SSH hosts, Bots / group chats, hosted links, clearing API keys, and resetting / uninstalling the runtime environment all already have confirmations, almost all being AlertDialogs with "red background + onDanger + specific verb". Chats can only be archived, and archiving has an undo notice, so it needs no confirmation.

Inconsistent writing:

- Only the red background set, with no onDanger foreground: always skip confirmation, remove workspace, close a running terminal tab.
- The primary color used for equal risk: app list loosening, access phone files, reset SSH fingerprint.
- Buttons saying "Enable" rather than the specific action: always skip confirmation, auto-run commands, Full access, Auto review.

Deletions with no confirmation: Bot memory, removing a group member, and "Remove" for keys and list items in engine settings. These are outside this scope, see §6.

## 2. Tiers

| Tier | When to use | Interaction | "Don't show again" |
|---|---|---|---|
| **High · confirm every time** | Releasing a whole class of protection (the AI no longer asks you), or letting the AI touch private data on the phone | Bottom sheet, red primary key stating the specific action | None: these switches are flipped only a few times a year, asking every time doesn't disturb; if turned on by mistake the cost is the AI deleting files and sending messages with no one watching |
| **Medium · confirm on first use** | The risk has a boundary (only this chat), or it merely jumps to system settings for authorization | Bottom sheet, primary-color primary key; "Don't show again" ticked by default | Ticked by default, so by default it reminds only once; unticking asks again next time; × or back records nothing |
| **Low · explain in place** | The result is enough to write next to the entry | No sheet, one sentence in the entry's subtitle or footer | Not needed |

Tiering results:

| Operation | Tier | Reason |
|---|---|---|
| Always skip confirmation | High | Opening apps, tapping, sending and deleting are no longer asked |
| App list loosening | High | Banking and payment apps may freeze accounts, with consequences outside the app |
| Auto-run commands / Full access | High | Commands and file changes are no longer asked |
| Access phone files | High | Photos and documents can be read and written |
| Allow build scripts | High | Executes third-party scripts with DSH's permissions; the original dialog is kept, with a package list |
| Auto review | Medium | There is still a model gatekeeping, though it may misjudge |
| Allow for this chat | Medium | Limited to this chat and restored on app restart; but commonly used, so remind only once |
| Pet shown above other apps | Medium | It merely jumps to system settings to authorize, and explaining once is enough |
| Choosing the root channel (do-not-disturb mode › Root, auto-restore accessibility › Request root authorization, `phone.root`) | Medium | What follows is the root manager's own authorization dialog; it relaxes none of DSH's rules, and explaining once is enough |
| First time enabling phone control | Medium (keep the existing disclosure) | A prominent disclosure required for compliance, more complete than one sentence, content unchanged, only "Ask AI" added |
| Skip confirmation for this task | Not blocked | Each task still asks once when it starts; existing behavior kept |
| Accessibility "Go enable" | Not blocked | The disclosure already covered it; blocking again would be a second interruption |
| Third-party plugin install | Low (existing) | The permanent note in the details sits just above the install key |
| Deletion kinds | High (existing dialogs) | Already unified, only colors fixed |
| Trusting a host fingerprint the first time | High (existing dialog) | Already unified and locking the scrim; resetting the SSH fingerprint is changed to red, consistent with "Re-trust" |

## 3. Components

### 3.1 `confirmRisk` (`lib/ui/common/risk_notice.dart`)

```
╭──────────────────────────────────────────╮
│ Always skip confirmation?             (×) │  SheetHeader, inset 20
│ Opening apps, tapping, sending and        │  bodyLarge · onSurfaceVariant
│ deleting will happen without asking you.  │
│ ☑ Don't show again                        │  Medium tier only
│ ┌──────────────────────────────────────┐ │
│ │       Always skip confirmation        │ │  48 high, 20 left and right, red background for high
│ └──────────────────────────────────────┘ │
│              ✦ Not sure? Ask AI           │  Centered, equal side padding
╰──────────────────────────────────────────╯
```

- Uses `showAppSheet(dismissal: SheetDismissal.button)`: it can't be dragged away or dismissed by tapping the scrim; × and system back both count as "don't do it".
- Only one primary key and no "Cancel" key: cancel is borne by ×, consistent with the S9 locked-sheet rule, and it avoids two cancels.
- The medium tier's "Don't show again" is ticked by default. When confirming with it ticked, the notice id is recorded and later passes straight through; unticking and then confirming asks again next time.
- Tapping "Ask AI": the sheet closes, the operation is not performed, and then it goes to a new chat per §4.
- Storage: `risk_notice.silenced` (a string list) in `SharedPreferences`, provided by `riskNoticeStoreProvider` and replaceable in tests.
- Geometry measured in tests: the primary key 20 left and right, with width equal to the sheet width minus 40; the left edge of the checkbox's visible square aligned with the left edge of the primary key; the center of "Ask AI" on the sheet's centerline with equal side padding; no overflow or truncation at 320dp width, 1.3× and 2× font sizes.

### 3.2 Unifying existing confirmations

- The five high-tier AlertDialogs (always skip confirmation, app list loosening, auto-run commands, Full access, access phone files) and the medium-tier Auto review all switch to `confirmRisk`. Behavior is unchanged: confirm to do it, anything else does nothing.
- Deletion kinds stay AlertDialogs: the confirmation object has a name and a single action, a centered dialog is more direct, and "Ask AI" isn't needed. Only the missing onDanger foreground is added (remove workspace, close terminal tab), and reset SSH fingerprint is changed to red.

## 4. Ask AI

### 4.1 Mechanism

Tapping any "Ask AI" entry does the following in order:

1. When there are unsaved edits, first ask "Discard changes?" (`DiscardGuard.confirmLeave`).
2. Close all pages and sheets above and return to chat (the sidebar is collapsed if a page was open).
3. Push a `ComposeRequest` into `composeInboxProvider`. The chat page puts it into the **new chat**'s composer: appended below any existing draft, not overwriting; focused, not sent. Sharing and launcher shortcuts use the same path.

**Why prefill rather than send directly**

- Sending costs money and takes a chat, and should be up to the user. "Help me fix it" in the app, community how-tos and text shared in are all fill-only-don't-send, and "Ask AI" stays consistent.
- Users often want to make the question more specific, such as "Accessibility won't turn on on my vivo". Sending directly would give no such chance.
- The current host may be a remote host, or the engine may not be up yet. Fill-only lets the user first see clearly where this message will be sent.

### 4.2 How the question is assembled

| Current host | Content in the composer | Notes |
|---|---|---|
| Local engine (dsh-go-guide auto-installed) | `/dsh-go-guide How does phone control work? What are the risks?` | `/name` is the "Skills › Use in chat" notation in the app; the host loads the skill on seeing it and answers per the guide. |
| Remote host, can receive files (SSH) | "About the dsh-go app: {question}\nPlease answer per the attached guide." + the attachment `dsh-go-guide-<topic>.md` (the page of guide the app bundles, in Chinese or English by UI language) | A remote host doesn't have this skill, so the app attaches the matching guide page and the model still has a basis. |
| Remote host, can't receive files (DSH Remote) | "About the dsh-go app: {question}" | A hint is shown once above the composer: "This host doesn't have the dsh-go guide, so answers may be off". |
| Web mode | The entry isn't shown | In web mode the home page is the web version, and the native composer isn't there. |

### 4.3 Entries and questions

Entries are placed only where the guide covers the topic. Auto review, the individual items of engine settings, and performance mode aren't written up in the guide yet, so asking would only get "the guide doesn't mention it", and they're left out for now.

| Entry | Form | Question (Chinese) | Question (English) | Guide page attached remotely |
|---|---|---|---|---|
| Settings › About › **Help** | A settings row, ✦ icon, subtitle "Ask AI about anything here" | dsh-go 能做什么？我该从哪里开始？ | What can dsh-go do, and where should I start? | 10-settings |
| Phone control page top bar | A ✦ glass round key (44, mirroring the back key) | 手机操控是怎么工作的？有什么风险？ | How does phone control work, and what are the risks? | 04-phone-control |
| The disclosure before enabling phone control | "Not sure? Ask AI" | Same as above | Same as above | 04-phone-control |
| Plugins page top bar | ✦, to the left of the refresh key | 插件能做什么？装第三方插件要注意什么？ | What can plugins do, and what should I watch for with third-party ones? | 08-plugins |
| Remote hosts page top bar | ✦ | 怎么连接自己的电脑或服务器？和用本机有什么不同？ | How do I connect my own computer or server, and how is that different from this phone? | 03-engine-hosts |
| Risk notice: always skip confirmation | "Not sure? Ask AI" | 手机操控选「始终免确认」会怎样？和「每次都询问」比风险在哪？ | What changes with “Always skip confirmation” in phone control, and how is it riskier than asking each time? | 04-phone-control |
| Risk notice: app list loosening | Same as above | 手机操控的应用名单有什么用？放开银行、支付类 App 有什么风险？ | What is the app list in phone control for, and what are the risks of allowing banking and payment apps? | 04-phone-control |
| Risk notice: auto-run commands / Full access | Same as above | 「自动执行命令」打开后会怎样？有什么风险？ | What happens when “Auto-run commands” is on, and what are the risks? | 10-settings |
| Risk notice: access phone files | Same as above | 「访问手机文件」打开后，AI 能读写哪些文件？怎么关掉？ | With “Access phone files” on, which files can AI read and change, and how do I turn it off? | 10-settings |
| Risk notice: allow for this chat | Same as above | 「本对话都允许」会放行哪些操作？怎么关掉？ | What does “Allow for chat” let through, and how do I turn it off? | 01-chat |

(The Chinese question column shows the literal strings the app sends when its language is Chinese; the English column shows what is sent in English.)

**Trade-offs**

- The top-bar ✦ is placed only on the three pages whose features are most complex and most prone to trouble. It's not added on other pages, so that the top right of every page doesn't have a star.
- The settings home gets no top-bar key; instead a text row "Help" is added in "About". People looking for help go to "About", and a row with text is easier to understand than a star.
- The "Ask AI" in risk notices sits under the primary key in small text. It's the way out when hesitating, and doesn't compete with the primary key for visual weight.
- The pet overlay and Auto review notices get no "Ask AI": the former just goes to system settings for authorization, and the latter isn't written up in the guide.

## 5. Copy (final)

All copy is in `lib/l10n/parts/risk_{zh,en}.arb`. Reused old keys only have their body rewritten and the title untouched, since the guide quotes these titles (for example **Turn on Full access?**).

| Notice | Title | Body | Primary key |
|---|---|---|---|
| Always skip confirmation (high) | 始终免确认？ / Always skip confirmation? | 打开 App、点按、发送、删除都直接做，不再问你。 / Opening apps, tapping, sending and deleting will happen without asking you. | 始终免确认 / Skip confirmation |
| App list: hands-off → as usual (high) | 让 DSH 操作「{app}」？ | 银行、支付类 App 会检测自动操作，可能限制登录甚至冻结账号；DSH 仍不会输密码、不会付款。 / Banking and payment apps detect automation and may restrict sign-in or freeze your account. DSH still won’t enter passwords or pay. | 我知道风险，仍然修改 / Change anyway (quoted by the guide, unchanged) |
| App list: step-by-step confirmation → as usual (high) | 「{app}」不再逐步确认？ | 微信这类 App 有风控，曾有手机助手操作后账号被强制下线；发消息等仍会先问你。 / Apps like WeChat watch for automation and have signed accounts out; sending messages still asks you first. | Same as above |
| Auto-run commands / Full access (high) | 开启完全权限？ / Turn on Full access? | AI 执行命令、改动文件前不再问你。 / AI won’t ask before running commands or changing files. | 开启完全权限 / Turn on Full access |
| Access phone files (high) | 让 AI 访问手机文件？ / Let AI access phone files? | AI 能读取和修改相册、下载、文档等手机文件，引擎会重启一次。 / AI can read and change your photos, downloads and documents. The engine restarts once. | 允许读写 / Allow access |
| Auto review (medium) | 开启自动审查？ / Turn on Auto review? | 每次操作由模型判断放不放行，可能误判。 / The model decides whether to allow each action. It may get it wrong. | 开启自动审查 / Turn on Auto review |
| Allow for this chat (medium) | 本对话都允许？ / Allow everything in this chat? | 这个对话之后的命令和改动都直接放行，可在输入框上方随时关闭。 / Commands and changes in this chat run without asking. Turn it off above the message box anytime. | 全部允许 / Allow all |
| Pet shown outside the app (medium) | 显示在其他应用上层？ / Show over other apps? | 要在系统设置里为 dsh-go 打开「显示在其他应用上层」，宠物才能出现在别的 App 上。 / Turn on “Display over other apps” for dsh-go in system settings so your pet can appear outside the app. | 去设置 / Open settings |

(Each cell with a Chinese / English pair shows the app's string in both languages.)

Common: "Don't show again", "Not sure? Ask AI", "Ask AI", "Help", "Ask AI about anything here". Remote hint: "This host doesn’t have the dsh-go guide, so answers may be off".

## 6. Outside this scope, with suggestions

- **Public share links (another agent)**: suggested for the medium tier. The first time a public link is generated, use `confirmRisk` to say "Everyone who gets the link can see this chat, including the contents of files in it", with the primary key reading "Generate link", reminding only once by default. Deleting a link already has confirmation and undo, and stays unchanged.
- **Onboarding (another agent)**: the last step of onboarding can add a line "Ask AI anytime about anything unclear", which when tapped opens the general question in §4.3. This is the only place that can actively tell new users they can "Ask AI".
- **Chat empty state**: one of the four suggestions (for example "rebase or merge") can be replaced with "How do I use dsh-go", with the prompt carrying `/dsh-go-guide`. This is the highest-exposure entry, but it changes the first screen and a batch of goldens, and needs the owner's decision.
- **Deletions with no confirmation**: Bot memory deletion, removing group members, and "Remove" for keys in engine settings; an undo notice rather than a confirmation dialog is suggested, to stay light.
- **"Reset notices"**: once a medium-tier notice has been chosen as "Don't show again", there is currently no way to restore it. Few people use it, so it isn't done for now; if needed, "Reset all notices" can be added in "About".
- **Guide**: to open up "Ask AI" for engine settings and the performance page, first add the matching chapters in `docs/guide/`, then run `python3 app/tool/guide_sync.py` to generate `app/assets/skills/dsh-go-guide/`.

## 7. Tests

- `test/common/risk_notice_test.dart`: display rules of the two tiers; "Don't show again" ticked by default, unticking, × recording nothing, and still in effect after restart; "Ask AI" not performing the operation and emitting the question; symmetry measurements; no overflow or truncation at 320dp × 1.3 / 2 font sizes; light and dark goldens.
- `test/state/ask_ai_test.dart`: the content assembled for local, SSH and Relay hosts; the attachment content being the matching guide page; the entry hidden in web mode.
- Each entry: always skip confirmation, app list loosening, auto-run commands, access phone files, permission presets, allow for this chat, and the pet overlay all reach the matching notice; the three top bars, the settings row and the "Ask AI" in the disclosure all close pages and put the correct question into a new chat.
