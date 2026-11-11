# dsh-Go cleanup criteria and classification

This file defines the type, severity and confidence of review findings and the proof required for deletion; the [report format](report-contract.md) handles presentation and the final verdict. Repository constraints are still governed by [AGENTS.md](../../../../AGENTS.md) and [CONTRIBUTING.md](../../../../CONTRIBUTING.md); do not copy or invent separate rules for the runtime, protocols and generated output.

## First decide whether it is worth reporting

1. **Candidate**: duplicate code, a single caller, an empty catch, a fallback, a stale comment or a scanner warning only signals something to check; it cannot be ruled wrong or deleted directly.
2. **Finding**: points to a currently reachable wrong result, a contract violation or a concrete maintenance cost, and can be located in the current change; it cannot be characterized by author style, line count or "might be a problem later".
3. **Actionable item**: beyond the finding, proves that deleting or merging loses no behavior, ownership boundary, compatibility or regression coverage. Without that proof, only report or ask; don't clean up automatically.

## Severity and entropy types

| Class | Criterion | Review axis |
|---|---|---|
| defect | There is concrete wrong behavior, or a violation of a public contract, security or a hard repository rule; even if it looks like mere redundancy, a comment or a test problem, classify it by its actual impact | A–D |
| slop | No proven behavioral defect, but there is double maintenance, a state/exception boundary with no benefit, misleading documentation, or review cost unrelated to the topic | E |
| Pure preference | Only naming, blank lines, ordering or what someone personally considers more elegant, without violating an explicit repository rule | Not reported |

- **❌ Blocking**: the current change introduces a provable substantive error, security issue or hard-rule violation; it cannot be accepted by hiding the risk or changing test expectations.
- **⚠️ Needs closure**: has a clear impact or necessary verification is still missing; before merging it should be fixed, backed with evidence, or have its specific residual risk explicitly accepted by the maintainer. Don't use it to dress up a defect that is only a guess.
- **💡 Optional improvement**: the evidence is sufficient but the impact is limited to a small maintenance cost; it must not pose as a merge blocker.

Confidence is independent of severity: **High** means the causal chain, location and impact all have direct evidence; **Medium** means the mechanism is certain but the scope of impact is still qualified. Items that are only guesses, involve unknown callers or lack a key premise go into clarifying questions and are not published as low-confidence findings. High confidence does not mean high severity.

## Proof before deleting or merging

Always check static references, string/dynamic registration, public API, module side effects, generation sources, test fixtures and platform branches. A search with no matches is not proof that there are no callers.

| Candidate | Evidence required |
|---|---|
| Unused symbol or dead path | Check real entry points such as Dart exports, JS package exports, Cordis services/events, Riverpod providers, platform channels, plugin protocols and generators; unknown public consumers must not be deleted outright |
| Duplicate helper | Compare input boundaries, error semantics, return values, lifecycle, platform differences and side effects; first decide on the authoritative implementation, then migrate callers; textual similarity does not mean semantic equivalence |
| Single-caller wrapper | Prove it does not carry resource ownership, third-party adaptation, version compatibility, platform isolation or a test-substitution boundary; having only one call is not evidence of redundancy |
| catch / fallback / defensive branch | Prove it swallows real errors, fakes success, masks contract drift, or fully overlaps an existing check with no independently reachable path; resource cleanup, old-host compatibility, disconnects and async state isolation must not be deleted just because there are many branches |
| Comment or documentation | Prove it contradicts the current implementation, entry point or command; keep short notes explaining invariants, compatibility reasons and platform limits |
| Test or snapshot | Prove that deleting loses no independent invariant or platform coverage; check the bad baseline and independent oracle per the [verification map](verification-map.md#anti-false-green-checks); don't mask failures by updating goldens or loosening assertions |
| Unrelated change | Point out that it is unrelated to the current goal and the review/rollback cost it adds; prefer splitting it out, and don't use the occasion to widen the cleanup |

## JDK-Go boundaries

- First protect user input and session facts, request idempotency and resource ownership, then consider reducing code; never turn engine facts into client guesses in the name of simplification.
- The native Flutter UI, the pure-Dart client, the bridge and the patched runtime have different responsibilities; cross-side verification follows the [contract gates](contract-gates.md); don't mistake architectural layering for duplicate implementation.
- Testing starts with focused regressions; whether to widen is decided by the change's risk and evidence. CPU, temperature and available toolchain on a phone are real limits; record stops or checks not run truthfully.
- This file does not depend on another project checkout, a global skills directory or external scanning scripts. When deploying the repository, keep the whole `.agents/skills/review/`, to be loaded by a coding agent that supports project skill directories.

The order of implementation and authorization boundaries follow "Phase 6" of [SKILL.md](../SKILL.md); don't build a separate cleanup process. Without authorization for the current run, don't modify files, post comments or commit code automatically.
