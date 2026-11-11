# dsh-Go contract gates
Sources of truth: `runtime/bridge/dsh-go-bridge/` (HTTP routes), the public API of `packages/dsh_client`, capability state in `app/lib/state`, `runtime/patches/pins.json`, `app/lib/l10n/parts/*.arb`, `sdk/plugin-kit`, CONTRIBUTING.md. This file only defines the order of checks and stores no dated constants; a contract change lacking a compatibility strategy / migration / verification is blocked by default.

## Gate 1 | Bridge HTTP contract
`/dsh-go/v1/*` routes: path, method, authentication (request rejections such as `connection.requestRejection`), status codes, JSON shape and version fields, error codes (e.g. `unavailable`).
Block: one side changes a route/shape/error code without the other side being synced; no version migration; tests don't cover the rejection, not-connected and host-rejection paths.

## Gate 2 | Client public API
Signature/semantic changes to the public exports of `packages/dsh_client` (carrier, mux, SessionDeletionApi, etc.) need compatibility or migration; new capabilities must have matching tests; never bypass the carrier and open a new HTTP client just because the app side needs it.

## Gate 3 | Three-state capability status
Host capabilities such as session deletion must distinguish unknown / supported / unsupported: not connected or mux not ready is unknown and must not be collapsed into a bool; UI copy maps every state exhaustively; "not supported" is shown only when the host explicitly answers so; it must be possible to re-probe after mux becomes ready.

## Gate 4 | Runtime patches and pins
Patches in `runtime/patches/` stay in sync with `pins.json`; patches still apply after an engine version change; writes, locks, tombstones and derived-state cleanup introduced by a patch are covered by node tests.

## Gate 5 | l10n and docs sync
`app/lib/l10n/parts/*.arb` and `.en.arb` stay in sync and `l10n_merge.py --check` passes; `docs/guide/` stays in sync with the app's built-in skills (`guide_sync.py --check`); the Chinese and English versions of README/CONTRIBUTING/SECURITY stay in sync.

## Gate 6 | Plugin SDK consumer surface
The public API, skill inputs and generated output of `sdk/plugin-kit` stay in sync (`sync-skill.mjs --check`); when the type-check dependency is missing, a skip must not be reported as a pass.

## Burden of proof when a gate modifies itself
When an implementation and the gate protecting it change together, list what the old gate reports for the bad implementation and the exact set the new gate widens/narrows; prove with an independent oracle that no backdoor was opened, and prove the CI/aggregation chain actually executes it. A script existing or CI being green is not sufficient.
