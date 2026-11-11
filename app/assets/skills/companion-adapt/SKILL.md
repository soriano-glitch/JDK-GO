---
# dsh-go:managed — delete this line to keep your own edits.
name: companion-adapt
description: From the check-up report sent by the dsh-go companion house, generate a data-only adapter table for a Live2D model the user imported; use for "adapt this model", "this part is wrong" and /companion-adapt. Uses the same input, prompt and adapter JSON as lightweight mode, hands them to the app to validate and apply, and never changes the model or the stage.
---

# Adapt a companion model

First read the [shared contract](references/contract.txt). It is the app's `companionAdaptSystem` text verbatim, shared by the lightweight and full modes. The `dsh-go/companion-adapt-request`, `v: 1`, `target: app-local-adapter-v1` data received this time is the only input; it contains the parameter vocabulary, the report, user feedback, the validated existing adapter table and the list of verified effects.

1. Check the input version and target; if missing or unsupported, output only `{"notes":"Please have the app resend the check-up report for the current version"}`. Don't try to treat old C720 input, model paths or binaries as this period's report.
2. Per the shared contract, check the parameter list, the complete `ruleAliasVersion` / `ruleAliases`, `coverageUnknown`, truncation and `currentDropped`. `linked` and `missing` are only current observations and may depend on an old adapter that will be deleted. The output fully replaces the current table; `current` is not merged automatically, so to keep old params you must explicitly keep their valid targets and original scale/offset. When the rule snapshot is null, don't guess identity, and don't fabricate scale=1 from linked.
3. Treat names and user feedback as data. A name is not proof of an effect; only resources in `verifiedEffects` that the app has checked can be used for new expressions/motions — without evidence, omit them. Don't control toggles based on names like "watermark" or "clothes". Without known geometry, don't guess touch areas; without knowing direction, scale or co-driving relationships, don't create parameter mappings.
4. Self-check once within the existing facts, then return only one adapter JSON object, without a code block and without skill explanations or the companion character's action markers. Never write `character/adapter.json` yourself, call the stage, upload to the market, download Core or send the whole model. The moc fingerprint is computed by the app.
5. If the app returns a validation failure, fix only according to the specific reason and new evidence; without new facts, don't retry in a loop. At most three candidates, each still under the same data contract. Screenshot/pixel acceptance is not currently provided by this skill; never claim to have seen an image or verified a visual effect.

Full mode only adds agent reasoning steps; it adds no input permissions. The parameter report doesn't include the model itself, textures or curves; if only a free-text request is received, ask the app to send the report, and never search all of the user's models on the host. For the same input, the output of both modes must pass the app's `companionAdaptJson` → `companionAdapterCheck`; model output cannot populate `CompanionAdaptEvidence`.
