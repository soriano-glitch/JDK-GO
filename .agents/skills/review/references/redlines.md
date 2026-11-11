# dsh-Go repository red lines
The source of truth is the full text of AGENTS.md and CONTRIBUTING.md on the current target branch; this table is not exhaustive. Severity is this skill's policy; the repository text only defines obligations.

## 1. Separate source from generated output | ❌
Edit only the source of truth; never hand-edit generated output: `app/build/`, `.dart_tool/`, l10n generated results, guide sync results. After changing `app/lib/l10n/parts/*.arb`, run `python3 app/tool/l10n_merge.py`; after changing `docs/guide/`, run `python3 app/tool/guide_sync.py`; after changing plugin skill inputs, run `node sdk/plugin-kit/scripts/sync-skill.mjs`. Generated output inconsistent with its inputs is blocking.

## 2. Engine patches in sync with pins | ❌
Patch files in `runtime/patches/` must stay in sync with `pins.json`; don't hand-edit vendor artifacts covered by a patch; when upgrading the engine version, the patches must still apply. Check pins, patch content and the runtime startup path.

## 3. The bridge protocol has only one source of truth | ❌
Request/response shapes and error codes (e.g. `unavailable`) of `/dsh-go/v1/*` routes are defined by `runtime/bridge/dsh-go-bridge/`; the app side (`packages/dsh_client`, `app/lib/state`) only consumes them and does not set up parallel definitions. Changing one side requires syncing the other side and the tests.

## 4. Dangerous operations follow the host's answer | ❌
For operations such as deleting sessions, permissions and credentials: capability/failure follows the actual answer from the host/engine, not a local inference posing as one; failures return stable error codes and are not silently swallowed. An unknown capability must not be treated as "not supported".

## 5. A single state owner | ⚠️/❌
Riverpod provider autoDispose lifecycles, mux generation and connection-object ownership are clear; async callbacks don't revive disposed state; when switching hosts/connections, old objects must be retired.

## 6. Bilingual copy in sync | ⚠️
`app/lib/l10n/parts/*.arb` and `.en.arb` stay in sync; the Chinese and English versions of README, CONTRIBUTING, SECURITY and docs/guide stay in sync; semantically equivalent rather than word-for-word translations.

## 7. Credentials and privacy | ❌
Never log/echo/persist full API keys, tokens, cookies or login state; manually check diagnostic bundles and logs before sending them out; automatic redaction is not a guarantee.

## 8. Git safety | ❌
Stage explicit paths only; don't use `git add .`/`-A`; don't stash away other people's changes; don't force push main or rewrite shared history unless the user explicitly asks; after a rewrite, rebuild the affected branches and PRs; don't commit/push/tag/release unless asked.

## 9. Build and real-device contract | ⚠️/❌
APK builds go through `tooling/build-apk.sh`; Flutter widget tests need an engine for the matching architecture; changes to phone control/PRoot/direct startup/update installation must be verified on a real device; desktop results are no substitute. Claiming to have run a command that doesn't exist is blocking.

## 10. Scope discipline | ⚠️/❌
One PR, one topic; don't sneak in unrelated formatting, dependency upgrades, upstream sync trees or local config; going so far out of scope that it can't be reliably reviewed/rolled back is ❌; a small amount of independently removable churn is ⚠️.
