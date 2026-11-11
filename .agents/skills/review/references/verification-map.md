# dsh-Go verification map
First read "Common checks" in the current CONTRIBUTING.md, the tooling scripts and .github/workflows; this table only selects methods. On drift, follow the repository's source of truth and note it in the report.

## No fabrication
Record only commands actually run, exit codes, SHAs and key output; never write "should pass" as "passed". When a device/dependency/engine is missing, write "not run" and the reason.

## Minimal general gate
Choose by change surface; pure documentation / pure workflow changes are routed per the contributing guide, not run mechanically in full.

## Change surface → verification category
| Change surface | Check at least |
|---|---|
| app/lib UI/state/Riverpod | `(cd app && flutter analyze)` + focused `flutter test test/<relevant>` |
| App UI copy ARB | `python3 app/tool/l10n_merge.py --check` |
| packages/dsh_client protocol/API | `(cd packages/dsh_client && dart analyze && dart test)` |
| packages/dsh_remote transport | `(cd packages/dsh_remote && dart analyze && dart test)` |
| runtime/bridge routes and deletion logic | `node --test runtime/tests/*.test.mjs` |
| runtime/patches | pins sync check, patches still apply, matching node tests |
| sdk/plugin-kit | `(cd sdk/plugin-kit && npm test)` + `node sdk/plugin-kit/scripts/sync-skill.mjs --check` |
| docs/guide user guide | `python3 app/tool/guide_sync.py --check` |
| tooling/ build scripts | `tooling/build-apk.sh` (when the environment allows) or static review |
| .github/workflows, pr-intake | permissions, fork trust, fail-open, path filters, action versions |
| Maintenance skills .agents/skills/ | frontmatter, relative references, script self-test |

Look up specific script names in the current package manifests/contributing guide; don't guess from the table.

## Selection algorithm
In order: list behavior/owner/public contract/user-visible surface from the diff → find the nearest existing regression for each → check the CI/aggregate invocation or state the local supplementary evidence → start with the smallest focused set, then widen to aggregates based on failures/risk → for real-device/platform-sensitive changes add real rehearsal (desktop green is not enough) → report split into static proof / automated regression / manual rehearsal / not executed.

## Untrusted fork execution gate
If external PRs are accepted again in the future: any command on the head may execute scripts or build configuration modified by the contributor. Static by default; requires explicit user permission, an isolated worktree/container, no repository secrets/production credentials, only minimal read-only credentials, and limits on network/CPU/memory/disk/time.

## Anti-false-green checks
### Bad baseline
A regression must fail on the unfixed implementation; prefer reverse-patching in an isolated tree or minimal fault injection that breaks the protected invariant; don't break the shared tree or roll back with a destructive reset.

### Independent oracle
The oracle must not compute the expected value with the same helper as the implementation, copy the implementation or compare a source against itself; it must not be always-true or only check that a symbol/string exists, and must not replace structural assertions with localized copy, random content or loose substrings; event/exports/features allowlists are compared directly against the official/target full set; field allowlists are compared directly against real responses.

### Real path
As the script is designed, import real source or a clean build artifact and go through the real registration/invocation/disposal path; mocks only replace uncontrollable external boundaries; read and write in isolated temporary directories and restore env/listeners.

### CI wiring
A script existing does not prove protection: it must be actually referenced by a workflow/package script, path filters must not skip it by mistake, it must fail closed when upstream is failed/cancelled/has empty output, and the latest head checks must be non-empty and match the current SHA.

## Report record template
| Command/verification | Type | SHA | Result | Notes |
|---|---|---|---|---|
| `...` | static / regression / manual | `...` | exit / pass / fail / blocked | failure attribution, environment, invariants covered |

Report statically determined blocking mechanisms directly; don't hide them behind "suggest re-running tests". Tests are used to prove impact/fixes.
