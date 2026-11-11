# Community: the v1 status quo and the v2 / v3 plans

> 2026-10-24. This document describes what v1 actually did, how the next two versions will be done, and what is still undecided.

## Conclusion

- **v1 hosts no user content**: there is only "Show off results" (generated images, which users post to WeChat / QQ / Moments themselves) and a "Community" page whose content is maintained by the project maintainers. No accounts, no servers, no comments, so it doesn't trigger the whole set of obligations of real-name verification, review and ICP filing.
- The loop "discover → install in one tap into local / remote DSH → share results" already works in v1: the featured plugins on the community page go through the existing plugin install flow, and replies and artifacts can generate a share image with a QR code in one tap.
- v2 (ratings + short reviews) starts hosting user content, and the compliance cost jumps from zero to "someone on duty continuously". It's suggested to first borrow an existing platform (cooperating with dshfind, or GitHub Discussions) to verify whether anyone uses it, and only then decide whether to build it ourselves.

## v1: what has been done

### 1. Showing off results (share as image)

| Entry | Content | Code |
|---|---|---|
| "Share image" in the reply's long-press menu, and the share key in the action row below a reply | The chat title, the question above, this reply, this turn's model and "53 seconds · 8 steps" | `shareReplyAsImage` |
| "Select messages" at the top right of the share sheet | Any chosen questions and replies stitched into one image | `share_picker.dart` |
| Chat menu "Share chat" (to be wired) | Pick messages first and then produce the image | `shareConversationAsImage` |
| Artifact card menu "Share image" (to be wired) | Image artifacts go straight onto the image; Markdown / text artifacts put in the first 40 lines; other files put a file card | `shareArtifactAsImage` |
| Plugin details "Share" (to be wired) | A plugin card (icon, author, stars / version / update date, description, package name) + a piece of text: introduction, the `dsh plugin add` install command, homepage | `sharePlugin` |

The code is in `app/lib/ui/share/`:

- **Card** (`share_card.dart`): fixed 390 logical pixels wide, rendering the body with the app's own theme and `MarkdownBody` (code highlighting, formulas and tables all consistent with the chat); code blocks are drawn by the card itself as non-scrolling, auto-wrapping code wells without buttons. At the bottom is the brand lockup (fish tail and bubble graphic + the "dsh-go" wordmark, `BrandLockup`) + a QR code, which by default points to `https://github.com/ccch1mneyyy/dsh-go` (`ShareContent.link`, changeable).
- **Three templates**: light (the app's mist blue page), dark, card (a white card floating on a DeepSeek-blue background). The first open follows the app's light/dark, and after that it remembers the last choice.
- **Switches**: "Question" and "Model and time" can be turned off individually.
- **Long answers**: block heights are estimated (Chinese about 1 em, English about 0.55 em, code by the number of lines after wrapping); beyond about 1500 logical pixels it's truncated at paragraph / list item / code line boundaries, with "…" on the last line; a single overlong paragraph is truncated at a full stop. If the estimate is off there's also a hard cap (faded out and cropped at a further 30% in height).
- **Export**: rendered from the `RepaintBoundary` in the preview at the card's original size, 3× (1170 px wide) when height ≤ 2000 and 2× when longer, with the PNG written into the cache directory `share/` (only the latest 5 kept). "Share" goes through the system share sheet (a plugin card comes with a piece of text); "Save image" goes through the existing `saveToDownloads`, landing in `Download/DSH/`, which MediaStore indexes as images and so shows up in the gallery.
- **Sensitive information**: titles, questions, answers, artifact descriptions and excerpts first go through `secret_mask.dart` (the same rules as masking in chat, using `•` rather than `*`, so Markdown doesn't treat it as emphasis); images in replies are replaced by alt text, and visual replies by a one-sentence summary. **Masking recognizes only secrets in known formats**; paths, usernames and emails are not masked — the preview is the last confirmation.
- **QR code**: a hand-written encoder (`qr_code.dart`, byte mode, versions 1–40, four error-correction levels, automatic mask selection) without adding a new package; checked against libqrencode 4.1.1 on 15 samples (including Chinese and v40), with module matrices identical bit by bit.
- **QR center icon**: the center of the card's and the community group codes carries the app icon (`QrCodeView.logo`). A code with the icon uses H-level error correction, versions 4–6, with a whole-module blank backing plate per version (`QrCode.logoPlates`: the icon takes about 22% of the code width, with a ring of modules around), avoiding the finder, timing and alignment patterns, covering no more than a third of the modules H level can correct, and leaving at least a third of the margin in every error-correction block (`test/share/qr_logo_test.dart` independently checks this against the standard). The icon is not placed when modules are smaller than 1.45 logical pixels: the card QR is 72, and versions 4–6 all fit (≤ 58 bytes, the project link being 37 bytes). A link where the icon can't fit carries no icon; a code on the card beyond version 6 (at 72 modules are smaller than 1.5, `ShareCard.qrMinModule`, and after halving at 2× export zxing-cpp can't read version 7) isn't drawn at all, and the footer keeps only the brand line "DSH on your phone", with equal margins above and below. A plugin card's landing-page link carries the whole plugin (around 400 bytes, with at least 150 bytes even when cut down to the install information), and the share service has no short address to look up a plugin by name, so the plugin card carries no QR code; the text shared with the image contains the install command and the plugin homepage, and the plugin share page's "Copy link" and "QR code" (a big 248 code) still give the full link. The share-code QR page has none: the landing-page link needs at least version 8 at H level, and the middle of versions 7–13 is right at an alignment pattern.

### 2. The community page (hub page skeleton)

Code: `app/lib/ui/community/`, `app/lib/state/community_state.dart`. From top to bottom:

1. The **forum** overview card (`CommunityPage(onOpenForum: …)`, passed in by the integration step once the forum client is connected; when not passed this is a project card: brand graphic, "dsh-go", a tagline, tapping opens GitHub).
2. **Featured plugins**: maintainers write the package name and a one-line recommendation in JSON; only those found in the dshfind directory are shown, "Get" opens the plugin market's existing details sheet (with a trust notice, installing to the current host), and the status (Get / Update / Installed / Installing) is consistent with the plugin market. When the directory can't be opened a line "Plugin directory didn't open · tap to retry" is shown.
3. **How to play**: two-column tiles; one tap returns to chat, opens a new chat, and puts the prompt into the composer **without sending** (reusing `repairDraftProvider` from "Let DSH fix it for me").
4. **Chat groups**: rows for QQ / WeChat / Telegram / forum and so on, opening a sheet: a large QR code, the group number ("Copy group number"), "Open".
5. **Updates**: newest first, at most 8, with a tappable link where there is one.

**Where the content comes from** (the same idea as in-app updates):

```text
Launch or open the community page
  → First use: the cache (the last successful download) or the built-in assets/community/community.json, taking the larger revision
  → At least 6 hours since the last network access: ask in turn
       The self-hosted source (--dart-define=DSH_COMMUNITY_FEED=https://…, present only when configured)
       raw.githubusercontent.com/ccch1mneyyy/dsh-go/main/community.json
       cdn.jsdelivr.net/gh/ccch1mneyyy/dsh-go@main/community.json
       fastly.jsdelivr.net/gh/… (same as above)
     The last successful source goes first; the first to give valid JSON wins
  → Replace and write the cache only if the revision is larger (an old copy on a CDN won't overwrite newer content)
```

**Why not use public GitHub acceleration mirrors** (ghfast and the like): update packages have SHA-256 and signatures as a safety net, community JSON doesn't; a third-party mirror can alter content, which amounts to being able to stuff links and QR codes into the app. jsDelivr is just a CDN for GitHub content and far more trustworthy.

**Defense**: only `schema: 1` is accepted, a single file ≤ 256 KB, at most 50 items per category; only `https` links are accepted; QR content that looks like a link must also be `https`; package names are validated by npm rules; over-long fields are truncated. Prompts go only into the composer and aren't sent automatically.

### community.json format

```json
{
  "schema": 1,
  "revision": 1,
  "updatedAt": "2026-10-24T00:00:00Z",
  "tagline": "Open source, stars welcome",
  "plugins": [{ "name": "@liustack/modsearch", "note": "Free web search" }],
  "prompts": [{ "title": "Understand an error", "summary": "Cause, fix and verification", "icon": "bug", "prompt": "…the error is as follows:\n\n" }],
  "groups": [{ "kind": "qq", "title": "QQ chat group", "subtitle": "Group 123456789", "url": "https://qm.qq.com/q/…", "qr": "", "copy": "123456789" }],
  "updates": [{ "date": "2026-10-24", "title": "…", "summary": "…", "url": "https://…" }]
}
```

| Field | Description |
|---|---|
| `revision` | **+1 on every change**. The app accepts only one larger than what it has |
| `plugins[].name` | npm package name, which must be found in the dshfind directory or it isn't shown |
| `prompts[].icon` | `code` `doc` `bug` `chart` `school` `travel` `search` `image` `write` `translate` `terminal` `mail` `calendar`; other values show a generic icon |
| `groups[].kind` | `qq` `wechat` `telegram` `discord` `forum` `github`, which decides the icon |
| `groups[].qr` | QR content, defaulting to `url`; items with `url` `qr` `copy` all empty aren't shown |

**Publishing**: change `community.json` in the repository root and push to `main`. jsDelivr caches branch files; to take effect immediately visit `https://purge.jsdelivr.net/gh/ccch1mneyyy/dsh-go@main/community.json` once. At release time copy the same file into `app/assets/community/community.json`, so newly installed users have the latest content offline too.

### Values to fill in before release

These items in the built-in file are empty (empty items aren't shown by the app); fill them in before release:

| Location | What to fill in |
|---|---|
| The QQ chat group in `groups` | `url` (the QQ group share link `https://qm.qq.com/q/…`), `copy` and `subtitle` (the group number) |
| The WeChat official account in `groups` | `qr` (the link in the official account's QR code, usually `https://weixin.qq.com/r/…`), `subtitle` ("Search 'xxx'"). **WeChat group QR codes expire after 7 days, so don't put a group code**, put the official account or a personal account |
| Telegram in `groups` | `url` (`https://t.me/…`) |
| `community.json` in the repository root | Currently doesn't exist, so all network fetches return 404 and the app always uses the built-in one. To enable remote updates, copy the built-in file there |
| `plugins` | Currently 5 picked by dshfind stars and purpose (web search, image recognition, context, IM integration, office), with recommendations written per the plugins' own descriptions, replaceable as needed |
| `prompts` | 6 general how-to items, to be changed for the target users |
| `updates` | Only one "Community page launched", dated 2026-10-24; change to the real date and content at release |
| `tagline` | The one-line text on the project card |

## v2: ratings + short reviews

### What to do

Below the plugin details page: a five-star rating + a one-line short review (≤ 140 characters, plain text, no images or links); list rows show the average score and the number of reviews; those you've written yourself can be edited and deleted. Structured, short, and without images, it is the kind of user content with the lowest review cost.

### Backend: pick one of three

| Option | How | Pros | Cons |
|---|---|---|---|
| **A. Cooperate with dshfind** | dshfind already has accounts and a forum entry; the app uses its login and review interfaces and only does display and submission | No self-building, no filing; reviews interoperate with the dshfind web; content responsibility lies with the filed party | Depends on the other side's schedule and interfaces; need to agree on brand exposure, data ownership, and degradation if they shut down |
| **B. GitHub Discussions** | One Discussion per plugin, ratings via reactions or a fixed format; the app uses GitHub OAuth Device Flow | Zero operations; review and anti-spam are borne by GitHub; no mainland servers involved | Users in lower-tier regions have unstable access to GitHub; needs a GitHub account, a high bar; ratings need an agreed format and are easy to game |
| **C. Self-built** | A small server + database + phone-number login + review interface | Fully controllable, best experience | Mainland servers need ICP filing (UGC by an individual entity generally falls outside individual non-commercial filing, to be confirmed with the access provider / communications administration); needs real-name verification, review, reporting, log retention; continuous staffing |

Suggested order: **if A can be negotiated, use A**; if not, first use **B** for small-scale verification (opened only on plugins with many GitHub users), and consider C only after seeing real interaction.

### Compliance impact (to be confirmed with someone who knows)

As long as the app hosts comments itself, it must follow the Provisions on the Administration of Internet Post Comment Services and the Provisions on the Administration of Internet Forum Community Services: back-end real-name, front-end voluntary (phone number verification); review before publishing or at least keywords + human re-check; a reporting entry and handling time limits; handling and reporting of illegal information; log retention required by the Cybersecurity Law (not less than six months); and listing in app stores also involves app filing. With A or B these mostly fall on the platform side, but content displayed in the app still needs to be removable (a blocklist can live in `community.json`).

### What changes on the app side

- Add `reviews_state.dart` next to `community_state.dart` (an interface abstraction, with the three implementations A / B / C swappable; when the backend is unavailable only reviews are hidden, without affecting installs).
- Add a "Reviews" area to the plugin details sheet.
- Login: A uses dshfind's OAuth; B uses GitHub Device Flow; neither stores passwords in the app.

## v3: feeds, posts, following

Precondition: after v2 goes live there is stable real interaction (for example dozens of new reviews and some replies every week). Without that precondition the forum would only be empty (the cold-start problem).

| Option | Description |
|---|---|
| Self-hosted Discourse + a native app client | The native client is in `app/lib/forum/`, and the top of the community page already reserves an entry for the "Forum". Complete features (topics, replies, following, notifications, moderation tools), but compliance falls entirely on ourselves: mainland deployment needs ICP filing + real-name + real-name filing of moderators + review; overseas deployment needs no filing but access from China is unstable and content responsibility remains |
| Borrow the dshfind forum | The app does native display and jumps, with accounts and review belonging to dshfind |
| Keep using groups | QQ / WeChat groups are the de facto community, and the app only provides an entry (v1 already has it) |

Showing off results inside the site (posting a share image as a post) is put in v3: v1's images can already be sent anywhere, and posting inside the site only makes sense when people are reading the forum.

## Open items

1. **Chat groups and official account**: which groups to fill in, and who maintains the group codes.
2. **Where community.json lives**: the repository root (the current default) or a separate content repository / self-hosted source (`DSH_COMMUNITY_FEED`).
3. **Criteria for featured plugins**: who picks, how often to rotate, whether to give partners a slot.
4. **v2 backend**: first approach dshfind about A, or go straight to B for verification; what to agree on when negotiating cooperation: interfaces, brand exposure, ownership of content review, degradation on shutdown.
5. **The forum's entity and deployment location**: individual or company entity, mainland or overseas — this decides how filing and real-name verification are done, and it's best to ask clearly before going live.
6. **Where the share image's QR code points**: currently the GitHub project page. Users in China may not be able to open a GitHub scan; once there's a domestic landing page (or a self-hosted download page), change `dshGoProjectUrl`.

## Known limitations (v1)

- The QR code in a share image always points to the project page; so does the plugin card (the plugin link is put in the share text).
- "Save image" lands in `Download/DSH/` rather than `Pictures/`, which most galleries can show; to get into "camera roll"-type albums, a method writing `MediaStore.Images` needs to be added to `FilesPlugin.kt`.
- Truncation of long answers relies on estimation; extreme layouts (many tables, long formulas) may be taller than estimated, and the hard cap's fade-out covers them.
- Not verified on real devices: the system share sheet receiving PNGs, whether each gallery shows `Download/DSH`, and the memory use of large images (2× long images).
