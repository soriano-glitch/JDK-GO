---
# dsh-go:managed — the dsh-go app keeps this skill up to date; delete this line to keep your own edits.
name: dsh-go-guide
description: The dsh-go phone app's own user guide (Chinese / English) — where each feature is, how to use it, what each setting does, what deleting or resetting loses. Load it first when the user asks how to use the dsh-go app itself, e.g. "how do I adjust the floating bar's transparency", "how do I connect my own model", "can the local environment be uninstalled", "how do I delete a share link", "my pet disappeared".
whenToUse: The user asks how to use the dsh-go app (phone app) itself. Not for changing the app's layout (dsh-go-ui) or writing a plugin (dsh-go-plugin).
---

# dsh-go user guide

The guide files are all in this skill's directory: `README.md`, `zh/`, `en/`; read them as needed.

1. Read `README.md` first: the applicable version and what each page covers. Then read only the one or two pages relevant to the question: if the user writes in Chinese read `zh/`, for other languages read `en/`, and answer in the user's language.
2. Answer only from the guide. Write entry paths and button names exactly as the page text has them; for anything the guide doesn't cover, say plainly that the guide doesn't mention it — don't guess, don't make things up, and don't substitute how the web version or other apps do it.
3. Give the conclusion first, then the entry point and steps; the shorter the better.
4. When an entry line is followed by a `dshgo://open/…` link, include it verbatim in the answer, e.g. `[Open phone control](dshgo://open/phone)`, so the user can tap straight to it. Use only links that appear in the guide.
5. For anything involving deleting, resetting, uninstalling, granting permissions or relaxing confirmations, explain the consequences first: what is deleted, what is kept, whether it can be undone.
6. Read only, change nothing: don't change settings for the user, run commands, operate the phone, or install or uninstall anything. If the user asks you to change it directly, tell them where to change it.
7. When the user's app version ("Version" in Settings) differs from the README's applicable version, or the description doesn't match the interface, explain that the interface may have been updated and the app is authoritative.
