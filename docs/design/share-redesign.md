# Sharing: one entry, one panel

> 2026-10-27. Merges the three entries "Share image", "Share chat" and "Share" into one "Share": below messages, the long-press menu, delivered files and the chat drawer all open the same panel; in the panel you first decide "what to share", then pick "how to send". Like / dislike are removed from below messages, and the freed spot goes to "Share".
>
> The link service, the `.dshgo` format, import and replay are untouched: see [share-links.md](share-links.md), [share-codes.md](share-codes.md) §8.

## 1. Map of the status quo (before the change)

| Entry | Where it goes | What can be sent |
|---|---|---|
| Action row below a reply | Copy · 👍 · 👎 · Fork · Regenerate · ⋯ | No sharing; ⋯ opens the long-press menu |
| Long-press a reply / ⋯ | Menu: Copy, Select text, Quote, **Share**, **Share image**, Regenerate, Fork | "Share" = system share of the raw text (unmasked); "Share image" → the image panel |
| Image panel (`share_sheet.dart`) | Three small round keys in the top bar: **Share chat**, Select messages, Copy link (plugins only) | Card image; for a link you first tap "Share chat" in the top bar to switch to another panel |
| Share chat panel (`conversation_share_sheet.dart`) | Range (whole / turns N–M), Include (reasoning, tool output), Share as (chat file / web page / link) | `.dshgo`, `.html`, hosted link |
| Chat drawer menu | **Share image** (select messages first), **Share chat** | The two panels above |
| Delivered file ⋯ | **Share** (system share of the file), **Share image** | The file itself; a file card |
| Plugin details · share key | A choose-one sheet: share link / share image | The share-code panel; the plugin-card panel |
| Settings · Share configuration | List → preview → share code | Link, QR code, file |
| Settings · My shared links | List page | Copy, delete (undoable for 4 seconds) |

Problems:

1. **The link is hidden inside the image**: to send a link you go "Share image → small icon in the top bar → Link → Generate", with no text hint at the second step.
2. **Same name, different meaning**: the menu, drawer and file menu each have two "Share…", and plugins add a choose-one layer.
3. **Two ways to say range**: images use "selected messages", chats use "turns N–M", and switching panels means re-picking.
4. **Inconsistent privacy rules**: links / files mask secrets and personal paths and can drop reasoning and tool output; images mask only secrets; "Share" in the menu sends the raw text.
5. Like / dislike take two slots and are hardly used day to day.

## 2. Intent → path (after the change)

| What you want to do | Path | Steps |
|---|---|---|
| Send this answer as an image | "Share" below the reply → Image → Share | 3 |
| Send a link that can be replayed | "Share" → Link → Generate link → Copy link | 4 |
| Send the answer text to WeChat | "Share" → Text | 2 |
| Save a Markdown / web page | "Share" → File → Markdown / Web page → Save | 4 |
| Share the whole chat | Drawer ⋯ → "Share" (whole by default) → any destination | Same as above |
| Pick a few messages to share | "Share" → Selected messages → tick → Done → any destination | 4+ |
| Don't want to include tool process / images | Turn off "Tool calls" and "Images" at the top of the panel; it applies to all destinations at once | +1 |
| Withdraw a link already sent | "Stop sharing" on the link page, or delete in "My shared links" | 2 |
| Share a delivered file | File ⋯ → "Share" → File → Share / Image → Share | 3 |
| Share a plugin | Plugin details share key → Copy link / QR code / Image / Share | 2 |

## 3. Information architecture

```
Entries (all called "Share")
 ├─ Action row below a reply     → panel, scope = this reply
 ├─ Long-press reply / ⋯ menu    → panel, scope = this reply
 ├─ Chat drawer menu             → panel, scope = the whole chat
 ├─ A reply on the replay page   → panel (data taken from the replay), scope = this reply
 └─ Delivered file menu / preview page → panel (file), no scope

Share panel (one bottom sheet, with an internal page stack, only a drag handle)
 ├─ Home: scope · include · preview · summary · destinations
 │   ├─ Link → validity → generate → copy / QR code / share / stop sharing; My shared links
 │   ├─ Image → template · question · model and process → save image / share
 │   ├─ File → chat file / web page / Markdown → save / share
 │   └─ Text → directly launches the system share
 └─ Select messages (subpage) → returns to home when done

Plugin / configuration share codes: their own pages, with the same sheet, round-key row and QR page
```

"What to share" (scope, include) is set only once on the home page, and the four destinations read the same copy; "how to send" has a page of its own for each, and the home page's choices are all still there on return.

## 4. Wireframes

### 4.1 The action row below a reply

```
⧉  ⇪  ⑂  ↻  ⋯                      53 s · 8 steps ›
Copy Share Fork Redo More
```

- 36 × 36 round buttons, 20-size icons, buttons right next to each other (consistent with the original row), with the first icon flush with the body's left edge.
- "Share" follows "Copy" directly: both take content away; fork and redo change the chat, so they come later.
- Delete 👍 / 👎 along with their state, requests, feedback sheets, copy, icon roles and tests.

### 4.2 Panel home (portrait)

```
                 ───                          Drag handle, no ×
Share
(( This reply )  Selected messages   Whole chat )   Scope: three equal-width capsule segments
(✓ Reasoning) (✓ Tool calls) (✓ Images)         Include: toggle capsules, equal padding all around
┌──────────────────────────────────┐
│ Card preview: updates live with scope and include │   Scrolls together with the two rows above
└──────────────────────────────────┘
⛨ 2 messages · 3 tool calls · secrets hidden     Adjust   Summary; "Adjust" appears only when messages are selected
  (🔗)       (🖼)       (📄)       (≡)
  Link       Image      File       Text            Destinations: four equal cells, 52 round keys, fixed at the bottom
```

- Entering from the drawer there is no "This reply", and the scope is only "Selected messages / Whole chat".
- Tapping "Selected messages" pushes the selection page (reusing `MessagePicker`: tap to select, long-press to drag-select a range), returning to home when done; afterwards use the summary row's "Adjust" to change the selection.
- The preview is the card the image destination will export (same template, same switches), the most intuitive look of "what is shared"; for a long whole chat the card is truncated by the original rules, and the summary row gives the full count.
- Delivered files: no scope and include; the preview is a file card, and the destinations are only "Image" and "File".
- Landscape (height < 480): preview on the left, and a column on the right with scope, include, summary and destinations.

### 4.3 Link

```
‹ Link
(  7 days  (( 30 days ))  Permanent  )
🔒 End-to-end encrypted; the server can't see the content
┌ 📄 Fix duplicate login submission · 1.3 KB              Preview ┐   Content to upload; preview = the replay the other side sees
                                                  (blank space in the middle, actions fixed at the bottom)
[              Generate link              ]          48-high primary button
              My shared links
— After generating —
┌ 🔗 go.dshtui.com/c/a1B2c3D4e5 · expires Nov 24 ┐
(Copy link)  (QR code)  (Share)  (Stop sharing)
              My shared links
```

- If any of scope, include or validity changes, the old link no longer corresponds to the current content: the page returns to "Generate link" (the old link is still in "My shared links").
- "Stop sharing" asks for confirmation first; after confirming the link is hidden from the list immediately, can be "Undone" within 4 seconds, and only afterwards is it deleted from the server (reusing `HostedLinksController.remove/undo`).
- "My shared links" is always at the bottom of the page, and opens the existing management page.
- After stopping sharing, the link row changes to "Sharing stopped · Undo", and after the undo window passes it returns to "Generate link".
- Over 4 MB: red text in the status row, and the generate key is disabled. A failed upload shows the client's sentence (network, too large, too frequent).

### 4.4 Image

```
‹ Image
( Light │ Dark │ Paper │ Glass │ Card )
(✓ Question) (✓ Model and process)
[ Card preview ]
[ Save image ] [ Share ]
```

Reuses the original image panel's templates, switches and export; the template remembers the last choice.

### 4.5 File

```
‹ File
( Chat file │ Web page │ Markdown )
┌ 📄 Fix duplicate login submission.dshgo · 1.7 KB           Preview ┐   Preview is given only for the two replayable ones
   Replay in dsh-go and continue the chat
[ Save ] [ Share ]
```

- Chat file = `.dshgo`, web page = a self-contained `.html`, and Markdown = the same digest used by "Continue the chat" (`conversationMarkdown`); all three are existing exports.
- A chat file / web page (and link) over 4 MB: red status text "Over 4 MB, please narrow the scope", and the buttons are disabled. Markdown carries no images and is not limited.
- Delivered files: no format choice; the file row shows the file name and size; save = save to downloads, and share = system share of the file itself (the "Share" in the original menu).

### 4.6 Text

Doesn't enter a page, and directly launches the system share:

- This reply: the reply body (a visual reply is replaced by a one-line summary), masked by the unified rules;
- Selected messages / whole chat: the same as the Markdown in File.

### 4.7 Plugin and configuration share codes

```
                 ───
Share plugin
[avatar] Novel Writing Assistant / dshfind
Source npm · Version 1.4.2
(Copy link) (QR code) (Image) (Share)
```

- The middle "share link / share image" choose-one layer is removed: the plugin card becomes the "Image" key in the same row, and tapping it pushes the same image page as the panel (just go back in the plugin sheet).
- A plugin link can always be inlined, so plugins no longer list "Save as file" separately (the same share code is already covered by link, QR code and system share). When the plugin isn't in the market there's no card, and the row is "Copy link · QR code · Share".
- Configuration sharing keeps four keys (Copy link · QR code · Share · Save as file): when a large configuration won't fit in a link, the file is the only exit.
- All three sheets keep only the drag handle; the QR code uses `ShareQrPage` throughout (a white-background card, scannable in light and dark); the round keys use `ShareActionRow` throughout.

## 5. Scope and privacy rules

| | Link / chat file / web page | Markdown / text | Image |
|---|---|---|---|
| This reply | The reply and the question above it; this turn's tool calls | Text: only the reply body | Question + reply |
| Selected messages | The selected questions and replies; tool calls of the turns the selected replies belong to | Same as left | The selected messages |
| Whole chat | Everything | Same as left | Everything (the card is truncated by length) |
| Reasoning off | Replies carry no reasoning | Never carried anyway | Never shown anyway |
| Tool calls off | No tool calls, to-dos or goals | No tool rows listed | No "what was done" shown |
| Images off | No images in questions | No image count written | No question images or in-reply illustrations shown |
| Masking (always) | `conversation_redact.redactText`: secrets, secret assignments, home directory, the app's private directory | Same as left | Same as left (originally only secrets were masked) |

- Masking isn't a switch: what's shared never carries secrets, and there's no room to turn that off; the summary row states "secrets hidden".
- The switches are an upper bound, not a promise that every format carries them: what's turned off appears in no destination; what's on appears according to each format's own capabilities. Two format differences are truthfully kept and the formats aren't changed: illustrations referenced in a reply (`![…](…)`) can only be drawn by the image card, and in chat files, web pages and links they're alt text (the viewer doesn't fetch images from the network); Markdown / text is the digest used by "Continue the chat", which never carries reasoning and tool output.
- The "File" of a delivered file sends the original file itself, without masking, so the file panel has no include switches and doesn't say "secrets hidden". `/export` in chat and "Export session log" are raw log backups, not sharing, and aren't affected by these switches.
- Links are booked by "the content at generation time": if the scope or switches change during generation, the returning link attaches only to the content it corresponds to and doesn't appear under the new content; a result returning after the panel is closed no longer refreshes the UI.
- When exporting selected messages, `ConversationExport.build(only: …)` is used: only the selected questions and replies are taken, and tools, notices, to-dos and goals are taken only for the turns the selected replies belong to; `range` records the turns covered, and the format is unchanged.
- Sharing again from the replay page: the data is taken from the screen state at the end of the replay (messages, turns, images), without the to-dos and goals in the raw log.

## 6. Trade-offs

- **Two layers rather than one**: a link needs the validity chosen before uploading, an image needs a template, a file needs a format, and each one's settings go into a subpage, with the home page keeping only "what to share" and the four destinations, so "Link" is visible at first glance. The cost is one more step to send an image (before, the entry was directly the image panel); in return any destination takes only one more step, and scope and privacy are set only once.
- **The preview uses the card**: the card is the only form where you can see at a glance "what content is shared"; the full content of links and files has a separate replay preview, but putting that on the home page would make the four destinations unequal.
- **"Text" rather than "System share"**: the four destinations are all named by "what the other side receives" (link, image, file, text), while "System share" names the channel and not the content; "Share" in the image and file pages already goes through the system share.
- **"Stop sharing" rather than "Revoke"**: in Chinese "revoke (撤销)" usually refers to undoing the last operation, and the 4-second restore key after deletion needs exactly that word.
- **Scope by messages rather than turns**: "turns N–M" is a concept of the export format; message selection supports long-press drag-selecting a range, covers the original turn range, and also allows skipping around.
- **Plugins drop "Save as file"**: a plugin link can always be inlined, and a file and a link are the same share code; the slot among four keys goes to the more commonly used "Image". If it needs to be kept, a quiet text button can be added at the bottom of the plugin sheet.

## 7. Not done / can't be done

- Delivered files have no hosted link: the share service accepts only chat files (the protocol is unchanged), and the file panel doesn't show "Link".
- "My shared links" records only links generated on this device; after changing phones or reinstalling, an old link can only be deleted by asking the service operator with the complete link (as it is now).
- The Host interfaces for like / dislike (`messageFeedback/*` in `dsh_client`) stay in the client library but the app no longer calls them.
- The four glyphs for like and dislike in the icon font will drop out naturally the next time the font is rebuilt (this time only the icon roles and the generation table were removed, and the font binary was left alone, to avoid conflicting with font changes on other branches).

## 8. Tests

| Scope | File |
|---|---|
| Entries: the share key in the action row (same size as copy, right next to it), a reply in replay, each reaching every destination | `test/share/share_entries_test.dart` |
| Entries: the long-press menu, drawer, delivered files (the file page sends the original file), no like or dislike | `test/chat/message_actions_test.dart`, `message_flow_test.dart`, `artifact_card_test.dart`, `test/integration/wiring_test.dart` |
| Panel: preview after switching scope, privacy taking effect on the card / file / link / text, link copy / QR code / share / stop sharing / undo, the three files, over-limit, 1.3× / 2× and 320 width, symmetry, no ×, goldens | `test/share/share_panel_test.dart` |
| Card masking and privacy parameters; selected-message export | `test/share/share_content_test.dart`, `test/share_code/conversation_share_test.dart` |
| Plugin / configuration share codes (image key, no file key, no ×, four-key geometry) | `test/share_code/share_code_sheets_test.dart`, `share_code_golden_test.dart` |
| Landscape | `test/landscape/landscape_golden_test.dart` (`phone_share_panel`, `phone_share_image`) |
