<!-- For internal PRs by the maintainer and their agents only. This repository does not accept external PRs for now; please use issues for suggestions and problems. -->

## Why the change

<!-- One sentence on the problem being solved and the behavior after the change; fill in the issue number if there is a related issue. Creating a new issue is not required for pure documentation or standalone fixes. -->

## Special things to note

<!-- 1–3 reminders for the reviewer: compatibility, migration, residual risk, scope deliberately not covered; write "None" if there are none. -->

## Change outline

<!--
Explain the key changes with the fewest file trees, call chains or data flows, one sentence per diagram; for simple changes a short paragraph is enough — don't force a diagram just to fill in the template.
When the client, bridge or plugin protocol is involved, explain the compatibility strategy for the other side; for UI changes, attach screenshots or recordings using synthetic data, and check for privacy.
-->

## Verification

<!--
Verification commands follow "Common checks" in CONTRIBUTING.md; choose the smallest sufficient set for the change surface: focused regressions first, then widen based on evidence — don't mechanically run the full suite.
Fill in only commands actually executed and their results. Skipped, aborted or failed runs cannot be recorded as passed; state what was not verified and why.
Record real-device and desktop results separately: for Android/PRoot/direct startup/phone control/update installation, note the actual device ABI, startup mode and verification scope.
-->

| Check | Actual result | Environment and uncovered scope |
|---|---|---|
| <!-- command or manual verification --> | <!-- pass / fail / skipped / aborted / not run --> | <!-- fill in as needed --> |

<!--
Before submitting, self-check by change surface; items that don't apply need not be done:
- Stage explicit paths only; don't include credentials, real sessions, personal config or test build caches.
- Don't hand-edit generated output; l10n, the user guide and plugin skills are generated from their inputs.
- Keep UI copy in sync in Chinese and English; keep bilingual changes to README, CONTRIBUTING, SECURITY and docs/guide in sync.
- Keep runtime patches in sync with pins.json; verify strict application and the matching regressions.
- When porting third-party content, state the source version/commit, license and modifications, and keep the required notices.
-->
