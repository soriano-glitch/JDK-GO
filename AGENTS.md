# AGENTS.md

dsh-Go is the Android phone app for DeepSeek Harness: a native Flutter UI + a pure-Dart client + a patched DSH engine runtime (running `dsh web` inside PRoot). Before making changes, read [CONTRIBUTING.md](CONTRIBUTING.md) (the contribution and verification contract) and [docs/architecture.md](docs/architecture.md).

## Repository layout

```
app/                         Flutter app: native UI, Riverpod state, l10n, phone control
app/lib/l10n/parts/          Chinese and English ARB inputs for UI copy
packages/dsh_client/         Pure-Dart client: HTTP/SSE, mux, session and deletion APIs
packages/dsh_remote/         Remote transport: WebRTC / LAN / TURN / relay
runtime/                     Patched DSH engine runtime
runtime/bridge/dsh-go-bridge/  App ↔ engine HTTP bridge (/dsh-go/v1/*, including the session deletion route)
runtime/patches/             Engine patches and their pins.json (patches pinned to versions)
sdk/plugin-kit/              Plugin SDK
tooling/                     APK build and build-number scripts
docs/                        Architecture, releases, roadmap, user guide
```

## Commands

Choose verification by change surface, and write the commands actually executed and their results in the PR/report. See [CONTRIBUTING.md](CONTRIBUTING.md) for full details.

```bash
(cd app && flutter pub get && flutter analyze && flutter test)   # Flutter app
(cd packages/dsh_client && dart pub get && dart analyze && dart test)
(cd packages/dsh_remote && dart pub get && dart analyze && dart test)
(cd sdk/plugin-kit && npm install && npm test)
node --test runtime/tests/*.test.mjs                               # Engine bridge/patch tests
python3 app/tool/l10n_merge.py --check                             # Copy generation check
python3 app/tool/guide_sync.py --check                             # User guide sync check
tooling/build-apk.sh --build-name <x.y.z>                          # Build the APK
```

CI (`.github/workflows/ci.yml`) runs the general checks plus the parts touched by a change on PRs, and everything on `main`; look at `CI OK` for the result. It doesn't touch real devices or real accounts, so green doesn't mean it works on a phone.

## Hard rules

### No external PRs (highest priority)

- This repository **does not accept any external pull requests for now** (code, docs, config and templates alike).
- **Never merge any external PR**: don't bring external commits into `main` with `gh pr merge`, the GitHub API, web merges, rebase or cherry-pick.
- **Never create a PR on the user's behalf** unless the user explicitly asks in the current conversation.
- When an external PR arrives: close it and reply "External PRs are not accepted for now; please open an issue with your suggestion instead." The intake check (`.github/workflows/pr-gate.yml`) closes external PRs automatically; handle them manually under the same policy — never "merge first and see".
- Don't automatically wrap an implementation into a PR and merge it just because an issue has one.

### Source, generated output and runtime patches

- Don't hand-edit generated output: `app/build/`, `.dart_tool/`, generated l10n artifacts and so on; after changing inputs, run the matching generator.
- For UI copy, edit `app/lib/l10n/parts/*.arb`, keeping Chinese and English in sync, then run `python3 app/tool/l10n_merge.py`; don't hand-edit the generated results.
- For the user guide, edit `docs/guide/`, then run `python3 app/tool/guide_sync.py`.
- Engine patches live in `runtime/patches/`: keep patch files in sync with `pins.json`, and don't hand-edit artifacts covered by a patch.
- For the plugin teaching skill, edit `sdk/plugin-kit/skill/` or the matching SDK inputs, then run `node sdk/plugin-kit/scripts/sync-skill.mjs`.

### Behavior and contracts

- For changes to the client, bridge or plugin protocol, check callers on the other side and backward compatibility at the same time.
- Dangerous operations (deleting sessions, permissions, credentials) follow the actual answer from the host/engine, not a local inference; failures must have stable error codes and must not be silently swallowed.
- Keep the Chinese and English versions of UI copy in sync (`app/lib/l10n/parts/*.arb` and the matching `.en.arb`).
- Keep bilingual docs in sync: the Chinese and English versions of README, CONTRIBUTING, SECURITY and docs/guide.

### Credentials and privacy

- Never log, echo or persist full API keys, tokens, cookies or login state.
- Manually check diagnostic bundles and logs before sending them out; automatic redaction cannot be treated as a guarantee.

### Git safety

- Before starting, check the worktree, branch and upstream state, and run `git fetch origin main`; by default create an isolated working branch from the latest `origin/main` rather than stacking a new task directly on a stale branch. When there are uncommitted changes, never automatically reset, stash or overwrite them in order to sync.
- After the work is committed and merged, clean up the temporary worktrees and branches created for it; before cleaning up, confirm the commits have landed in the target and that nothing is unsaved or unpushed. Don't force-delete worktrees containing changes, and don't delete other tasks' branches.
- After merging and cleanup, fetch the latest `main`, sync it in the clean main worktree with fast-forward only, and report the final commit and anything left uncleaned; if the main worktree has unrelated changes, keep them and say so — never lose work to make things "clean".
- Stage explicit paths only; don't use `git add .` / `git add -A`.
- Don't commit, push, tag or release unless asked.
- Don't force push `main` or rewrite shared history unless the user explicitly asks in the current conversation; after a rewrite, rebuild the affected branches and PRs.

### Real-device verification

- Flutter widget tests need a Flutter engine for the matching architecture; when only a desktop (x86_64) is available and the device is arm64, explicitly write "not run" and the reason.
- Changes related to phone control, PRoot, direct startup and update installation must be verified on a real device; desktop results are no substitute.

## Code review principles

When reviewing PRs or changes, the core is **introduce no new bugs, make the minimum necessary change, keep the code simple**:

1. **Prevent regressions**: check first for new bugs, races, resource leaks, performance regressions and compatibility problems, paying special attention to how shared layers (`packages/dsh_client`, the bridge, runtime patches) affect existing host connection methods.
2. **Avoid over-engineering**: identify duplicate implementations, unnecessary abstractions, redundant wrappers and excessive defensive programming; report them only when a simpler equivalent exists, and don't misjudge necessary security checks and error handling.
3. **Strictly control scope**: changes should revolve around the goal and the linked issue, without sneaking in unrelated refactors, formatting, dependency upgrades or other feature changes; necessary test and doc syncs are the exception.
4. **Ensure real value**: watch for dead code, duplicated logic, pointless splits and tests lacking meaningful assertions; don't judge contributions by line count or commit count, and don't speculate about contributors' motives.
5. **Reviews must be evidenced**: report only substantive problems introduced by the current change, stating the specific location, trigger conditions and actual impact, and preferably giving a minimal fix suggestion.

## Skills and workflow

- Internal PRs: use `.agents/skills/pr` (process, template, verification record).
- Code review: use `.agents/skills/review` (evidence first; report only substantive problems introduced by the current change).
- Bug reports: `.agents/skills/bug`; security audits: `.agents/skills/vuln-check`; broad audits: `.agents/skills/audit`.

## Editing this file

`CLAUDE.md` is a symlink pointing to `AGENTS.md`; edit the real file. Keep each rule self-contained and link details to the authoritative docs.
