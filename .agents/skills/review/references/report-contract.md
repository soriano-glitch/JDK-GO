# Fixed structure of the review report
Unless the user explicitly asks for machine-readable JSON, use the structure below; wording may be compressed, but evidence fields must not be removed. R is a finding number, Q is a clarification number, and A–E are the behavior / contract / security / process / entropy axes respectively.

```markdown
# Review verdict
**Verdict**: Request changes | Merge with conditions | No blocking findings
**Mode**: Review | Deslop report | Deslop apply; **Target**: PR/branch/range/absolute path
**Baseline**: latest target `<sha>`; **Head**: `<sha>`
**Trust level**: trusted-maintainer | trusted-local | untrusted-fork

## Findings
### R1 [❌|⚠️|💡] [defect|slop] [A|B|C|D|E] Title
- **Location**: absolute path and line number (head `<sha>`; line basis: head/worktree/diff)
- **Mechanism**: input/state → call chain → wrong result or maintenance entropy
- **Evidence**: code reading/search/rule/run; give the command, exit code or source location
- **Impact**: users, data, contract, security, platform or maintenance cost
- **Confidence**: High | Medium
- **Minimal fix**: a concrete change that doesn't widen the scope
- **Verification**: the independent invariant to prove after the fix
- **Deletion proof**: slop only; how references, dynamic registration, side effects, public API and tests are handled

## Clarifying questions
- **Q1**: the missing fact; which evidence, once supplied, would upgrade it to a finding.

## Validation record
| Check | SHA | Result | Coverage/obstacle |
|---|---|---|---|
| `command` or static comparison | `...` | pass/fail/not run | ... |

## Coverage and residual risk
- Reviewed: ...; not reviewed: ...; reason for limits: ...; residual uncertainty: ...

## Merge Conditions
1. Verifiable condition one.
2. Verifiable condition two.
```

## Verdict rules
Unresolved ❌ → `Request changes`; no ❌ but ⚠️ items/missing verification that must be closed before merging → `Merge with conditions`; nothing blocking → `No blocking findings`, never claim it is completely safe or has no problems at all. When a Deslop report has no merge target, rename the last section to `Cleanup conditions`.

## Finding rules
Order by impact, not by discovery order; defects first, then slop. Merge only items with the same root cause and the same fix, and list every location; similar symptoms are not enough. Severity follows the rules/actual impact, not scanner confidence hints, comment tone or author identity; low confidence goes to clarifications, not Findings; a ❌ needs a complete causal chain on the current head and cannot rest on "might" or "suggest checking". Cite the absolute path/section of the current source of truth; references are only an index; tag every number/status/characterization with the current SHA/verification method, and mark it as an estimate if it can't be verified.

## Slop rules
Never guess the author's origin, and keep candidates separate from deletable items, per the global rules and counter-table in SKILL.md; don't write "AI-generated/bot-like". A single caller, zero grep hits, "unused" or a regex does not mean deletable. The defect/slop classification, severity and confidence are defined solely by [deslop-gates.md](deslop-gates.md#severity-and-entropy-types); pure naming/ordering/blank lines/aesthetics are reported only if they violate a repository rule or cause major churn. Without a deletion proof, write only "delete/merge after verifying X", never auto-fix.

## Zero findings
Still output `Findings: none found in reviewed scope`, the Validation record, Coverage and residual risk, and Merge Conditions/Cleanup conditions; this only means nothing reportable under the declared scope/evidence.

## Forbidden sections
No "what was done well", unverified PR summaries, pure nitpick lists, "CI is green" without the current SHA, or blocking items hidden only in Merge Conditions.
