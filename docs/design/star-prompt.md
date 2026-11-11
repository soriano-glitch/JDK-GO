# The star request prompt

> 2026-10-29 · Based on main `e120b7ca`. Scope: after the public beta, inviting users to star dsh-go on GitHub. There are two entry points: a one-time dialog (asked at most twice), and a row in "Settings › About". It replaces the 10-28 bottom-sheet plan (3 days + 10 replies).

**Conclusion**: once the app has accumulated **30 minutes** in the foreground, and you go idle on the home page or in a chat, a dialog appears: a sticker of the whale girl holding a star, the line "This little whale has kept you company in JDK-Go for half an hour now~", a request, and three buttons "Star it on GitHub", "Already starred" and "Maybe later". Tapping either of the first two means it's never asked again; for "Maybe later" (or back, or tapping outside), it asks a second time after another **5 hours** of accumulated use, with the first line stating the actual duration ("kept you company for 5 hours now~"), and never asks after that. The whole prompt is controlled by the build parameter `DSH_STAR_PROMPT`, off by default; add `--dart-define=DSH_STAR_PROMPT=true` when releasing the public beta. "Settings › About › Star dsh-go" is unaffected by the switch.

## 1. When it appears

**Timing**: counts only the time the app is in the foreground (`resumed`), accumulated across all launches and stored on this device. It records once a minute and once more when leaving the foreground; if the process is killed at most one minute is lost. It uses a monotonic clock, so changing the phone's time has no effect. When the switch is on, counting starts from launch, including web mode and the first-run onboarding; after both asks are done or it has ended, counting stops.

| Which ask | When due | First line |
|---|---|---|
| First | 30 minutes accumulated | Kept you company for half an hour~ (if it was dragged out to a full hour before showing, it says "an hour") |
| Second | Accumulated duration at the previous showing + 5 hours | Kept you company for N hours~ (N rounded down) |

**Once due**, all of the following must be satisfied and hold for 3 seconds before it appears; if any one isn't satisfied it waits, re-checking when conditions change or after a minute:

| Case where it isn't shown | How it's judged |
|---|---|
| First-run onboarding not finished | The prompt hangs on the home shell, which isn't present during onboarding at all |
| Not on the home page or a chat | The app isn't in the foreground; a page, sheet or dialog is on top of the chat page (`chatOnScreenProvider`); the drawer is open; the launch screen is still playing |
| The chat on screen is running | Thinking, writing, calling tools, waiting for approval (`petFocusProvider`) |
| Something is waiting for you | There's a pending approval or question to answer (`petPendingProvider`) |
| Phone control | In progress, or ended less than 2 minutes ago |
| Voice input, typing | Dictating; the keyboard is up, or there's unsent text or an attachment in the composer |
| Another prompt has already been shown this launch | The usage-statistics upgrade prompt, the update sheet, or the background-networking row (`launchNoticeShownProvider`); wait for the next launch |

Background chats running doesn't block it: only the chat you're looking at counts.

## 2. Frequency

| What you did | Afterwards |
|---|---|
| Star it on GitHub | Opens the repository in an external browser, and never asks again. It doesn't know, and doesn't check, whether you actually starred |
| Already starred | Never asks again |
| Maybe later, or back, or tapping outside | Asks a second time after another 5 hours accumulated; no more asks after the second |
| Settings › About › Star dsh-go | Opens GitHub, treated as "Star it on GitHub" |

The dialog is recorded as soon as it appears (the count and the accumulated duration at that time); if the process is killed midway it counts as "Maybe later".

## 3. Form

```
╭──────────────────────────────────╮
│          ( whale girl )          │  Sticker ≤192, a very faint theme-color glow behind it
│   This little whale has been     │  titleLarge · centered · two lines of equal width (so "~" isn't alone on a line)
│   with you in JDK-Go for half    │
│   an hour now~                   │
│  This is a free, open-source ... │  bodyMedium · onSurfaceVariant · centered
│  Pretty please~ It really        │  bodyMedium w600 · primary color
│  matters!!                       │
│ ┌──────────────────────────────┐ │
│ │     ☆ Star it on GitHub      │ │  Filled primary button, full width
│ └──────────────────────────────┘ │
│          Already starred         │  Text button · primary color
│            Maybe later           │  Text button · tertiary text color
╰──────────────────────────────────╯
```

- **Card**: the theme's dialog (`popupFill`, hairline stroke, 28 corner radius), width 280–360, 24 left on each side on phones; the same width on tablets. The content is in a scroll view, scrolling on short screens or large fonts without overflowing.
- **Sticker**: `assets/star/star_whale.webp`, 576×576 (3× of 192dp), WebP with transparency, about 128 KB, shared by Chinese and English. The original's bottom hem was cut flat by the canvas; the last 40px fades to transparent so it doesn't look cropped on the card. The edge length is 30% of the dialog's available height, limited to 112–192dp.
- **Entrance**: the dialog itself fades in; the whale girl pops up gently from 0.86× and 14dp lower, overshoots 1× and settles (560 ms, `easeOutBack`). With the system's "remove animations" it shows immediately.
- **Back, tapping outside**: equal to "Maybe later". There's no ×.

## 4. Copy

The copy is in `app/lib/l10n/parts/star_{zh,en}.arb`, and the first line uses plurals by hour count (0 = half an hour). Failure messages reuse `shellBrowserUrlCopied`.

| Position | Chinese | English |
|---|---|---|
| First line | 本鱼已经在 JDK-Go 里陪你半个小时啦~ / 一个小时 / N 个小时 | I’ve kept you company in JDK-Go for half an hour now~ / an hour / N hours |
| Body | 这是一个免费开源的项目，如果它让你的移动端体验更好了一点，拜托点个 Star 支持一下，这对本鱼是很大的鼓励！ | JDK-Go is free and open source. If it’s made your phone a little nicer to use, please give it a Star — it means so much to this little whale! |
| Request | 拜托你啦~ 这真的很重要！！ | Pretty please~ It really matters!! |
| Primary button | 去 GitHub 点 Star | Star it on GitHub |
| Secondary button | 已经点过啦 | Already starred |
| Third button | 下次再说 | Maybe later |
| Settings row | 给 dsh-go 点个 star | Star dsh-go on GitHub |

## 5. Public beta switch

```
tooling/build-apk.sh -f all -- --dart-define=DSH_STAR_PROMPT=true
```

- The constant `starPromptEnabled = bool.fromEnvironment('DSH_STAR_PROMPT')`, default `false`. When off, it doesn't count, doesn't read or write preferences, and doesn't show. No state is left during the internal beta, and the public beta starts counting from zero.
- The row in settings is unaffected by the switch.
- No remote configuration, for the same reason as before: the public beta package's update check reads the GitHub API, which can't hold custom fields; this switch is flipped only once, when releasing the public beta.

## 6. Compliance

- **Just an invitation**: no feature requires starring; none of the three choices affects anything.
- **No tracking**: no network, no GitHub lookup. Only the accumulated foreground time, how many times it was asked, the accumulated time at the last ask and whether it ended are stored locally. None leave the phone or enter usage statistics (the statistics' counter keys are fixed, and adding a key needs a server change, which isn't done here).
- **Runs normally if reading or writing fails**: when preferences can't be read, this run counts from zero and doesn't write back, so as not to overwrite a previously saved "Already starred"; when writing fails, it takes effect only within this run.

## 7. Implementation

| File | Content |
|---|---|
| `app/lib/state/star_prompt.dart` | Switch, rules, the local record (`star_prompt`, JSON v2; an old v1 keeps only "ended"), foreground timing, idle judgment, the phone control observer, the seam for opening links |
| `app/lib/ui/star/star_prompt_dialog.dart` | The dialog, sticker and entrance, the two-equal-line title, opening GitHub |
| `app/lib/ui/star/star_prompt_host.dart` | Mounted on the home shell; judges whenever the record or scene changes, and shows after 3 quiet seconds |
| `app/lib/app.dart` | When the switch is on, holds the record from launch (starts counting) |
| `app/lib/state/notify_state.dart` | `launchNoticeShownProvider`: set when the usage-statistics prompt, the update sheet or the background-networking row appears |
| `app/lib/ui/settings/about_page.dart` | "Star dsh-go" in "About" |

## 8. Tests

`app/test/star/star_prompt_test.dart`: doesn't show at 29 minutes, shows at 30; counts only while `resumed`, accumulating across launches; after "Maybe later" doesn't show at 4 hours 59 minutes, shows at 5 hours, with the first line stating the actual number of hours; back and tapping outside equal "Maybe later", and no more asks after the second; "Star it on GitHub" opens `https://github.com/ccch1mneyyy/dsh-go`, and "Already starred" both never ask again; when the browser can't be opened it copies the URL; it doesn't show during first-run onboarding, a running chat, pending approvals, a page covering, not in the foreground, phone control, dictation, the keyboard, a draft, the drawer, or when a prompt was already shown this launch, and shows once the condition clears; no reading or writing when the switch is off; preference read/write failures; the settings row; the geometry at 360×780 / 360×640 × 1, 1.3× font size and tablet (no overflow, sticker square and centered, primary button full width, title two equal lines); English; the entrance animation switch; light and dark goldens.
