---
name: pr
description: Open or update an internal pull request in soriano/jdk-Go, including writing or rewriting its description. Use for every PR the maintainer creates or edits here, and for /pr. External pull requests are not accepted (see AGENTS.md).
---

Ship the current change as an internal pull request a reviewer can understand from the description alone: why it exists, the shape of the implementation, and what was actually verified. External PRs are never accepted; this skill is only for the maintainer's own branches.

1. One PR, one topic. Confirm the change has a clear goal; don't automatically wrap an implementation into a PR just because an issue exists. Link the related issue (if any).
2. Commit and push the branch; the branch's upstream is itself, never push to `main`. Commit messages use `type(scope): summary` (conventional commits, Chinese or English consistent with the surrounding history). Stage explicit paths only.
3. Read the full diff and related code, and confirm you can explain ownership and behavior; collect the verification that was actually run.
4. Write the body using the repository's [PR template](../../../.github/PULL_REQUEST_TEMPLATE.md):
   - **Why the change**: one sentence.
   - **Special things to note**: 1–3 reminders for the reviewer; checks that were not run also go here.
   - **Change outline**: the fewest diagrams (file tree / call chain / key shapes), one sentence per diagram; no file-by-file running log.
   - **Verification**: the commands actually executed and their results; clearly distinguish real device from desktop.
   Write the body in plain language, one person talking to another.
5. Publish with `gh pr create --body-file` / `gh pr edit --body-file`, then confirm the rendering with `gh pr view`; report the PR URL, linked issue and CI status.
