# Companion house: letting the user's own AI adapt a model

Drafted 2026-11-08. Cause: a user hit a mask problem importing "Big Fat Fish 4096". The user wants compatibility problems handed to their own model to solve, so that the user doesn't notice in the experience.

## 0. Conclusion

- **Adaptation is two layers.**
  - Deterministic compatibility is handled by the app itself, without AI: rendering, file structure, masks, texture size, unregistered motions and expressions. A batch of this is already done, see §2.2.
  - Adaptation that needs judgment goes to the user's own model, such as: is this parameter head turning, which expression counts as shy, where to tap counts as petting the head, which parameters are for changing clothes.
- **AI produces only data, not code.** It outputs an adaptation table (adapter, merged into character.json, see §3). The app executes and accepts it: apply the table and check automatically; if wrong, send the check results back to the AI to fix, at most 3 rounds. The stage script is always the one we publish.
- **The user doesn't notice.**
  - On import the app runs an automatic check-up, in a few seconds.
  - When AI is needed, the UI shows "She's adapting to her new body…".
  - When done, one sentence explains the result.
  - The first time AI adaptation is used, it explains what will be sent to the model: the parameter list and a few small screenshots, not the model files. After that it proceeds automatically by default.
- **"Letting the AI check before import whether it can be adapted" doesn't need AI.** "Can it be used" is answered deterministically by the check-up; the AI is only responsible for "how to use it well".
- **The adaptation table is saved by model fingerprint.** The fingerprint is the moc3's sha256. Later it can be uploaded to the pet/companion market: the next person importing the same model reuses it directly, spending no tokens.

## 1. Where things currently depend on a "standard model"

stage.js's procedural motions hardcode these Cubism standard parameter names:

- `ParamAngleX/Y/Z`, `ParamBodyAngleX/Y/Z`, `ParamBreath`
- `ParamEyeLOpen/ROpen`, `ParamEyeBallX/Y`, `ParamEyeSmile`
- `ParamMouthOpenY`, `ParamMouthForm`
- `ParamBrowLY/RY`, `ParamBrowLAngle/RAngle`

character.json also has these, whose defaults are all tuned for the whale girl:

- Touch zones `zones`: head, face, body, tail cut by proportions of the screen height.
- Framing `framing`.
- The emotion table `emotions` and the action table `actions`.
- Tail parameters `tail`, initial pose `pose`.
- The name.

The current state of two kinds of models:

- **Models like Big Fat Fish that are named to the standard** (509 parameters, the head using standard names, plus clothing toggles `Clothes1–5`, expression toggles `key1–13`, motion toggles `Movement1–3`): head turning and blinking mostly work. But emotions, touch zones, the tail and changing clothes aren't recognized.
- **Models with non-standard naming** (Cubism 2-era `PARAM_ANGLE_X`, or IDs the author made up): not even head turning or blinking.

What the AI is to fill in is exactly these.

## 2. Flow

```
Import ─► ① Check-up (app, 1–3 s) ─► ② Rule repair (app) ─► ③ AI adaptation (only when needed) ─► ④ Acceptance (app) ─► ⑤ Save / share
                      │                                        ▲                     │
                      └─ Unusable: one sentence says why        └──── If wrong, come back with the check results, at most 3 rounds
```

### 2.1 Check-up (probe)

stage.js adds a `?probe=1` mode: it only loads the model, doesn't enter companion logic, runs to completion in a background WebView, and outputs `probe.json`. Contents:

- **Whether it can run**: whether it loads, whether the moc3 version is supported by Core 6, load time.
- **Cost**: primitive count, number of mask combinations (49 for Big Fat Fish), texture size and estimated VRAM, frame rate of a test render.
- **Parameter table**: for each parameter its id, display name in cdi3, group, min/max/default; plus a parts table.
- **Assets**: expressions, motions (including unregistered files), physics, HitAreas, the EyeBlink/LipSync groups.
- **Standard parameter coverage**: of the 18 parameters listed in §1, how many the model has.
- **Thumbnails**, no more than 20 in total:
  - One in the default pose.
  - Candidate parameters pushed to both ends, one each, picking only candidates that "look like head turning, blinking, mouth opening".
  - One per expression.

The conclusion has three tiers, given on the import page in one sentence:

- Can be used directly.
- Can be used but needs adaptation.
- Can't be used, e.g. Core doesn't support it or the file is corrupt.

### 2.2 Rule repair

Done (8da76ad2):

- When masks exceed 36 kinds, give more textures, and beyond that use high-precision masks.
- Mask resolution raised to 1024.
- Textures are scaled down to the device limit.
- Automatically discover `.exp3/.motion3` not registered in model3.json.
- A model folder zipped directly can also be imported.
- MSAA is turned off on high-resolution screens; when the frame rate can't keep up, resolution drops automatically.

To add:

- Cubism 2-style IDs have a fixed mapping (`PARAM_ANGLE_X` → `ParamAngleX`, `PARAM_EYE_L_OPEN` → `ParamEyeLOpen`…), mapped directly by the table, without AI.
- When the model has HitAreas, generate touch zones directly.
- Parameters in the EyeBlink/LipSync groups are used directly as blinking and mouth shapes.

### 2.3 AI adaptation

**Trigger**: there's no character.json, or after rule repair there are still gaps: insufficient standard parameter coverage, no emotion table, touch zones still default.

**What is sent to the model**:

- The task description, the adapter's JSON Schema, our parameter vocabulary (the meaning, range and positive/negative direction of each semantic parameter).
- A condensed probe: parameter ids, display names, ranges (hundreds of parameters compressed by group), plus expression names, motion names, part names.
- Thumbnails: sent only when the model can see images.
- **Not sent**: the original moc3 and texture files.

**What is taken back**: one adapter JSON (§3). It can reference only ids that appeared in the probe, and values are clamped to parameter ranges.

**Two modes, one contract**:

- **Lightweight mode**: the app directly calls the user's configured model (the companion's light client), requiring JSON-only output.
- **Full mode**: hand it to the agent on the host, made as the built-in skill `companion-adapt`. The input/output contract is the same, and the agent can think a few more steps and check for itself. Rendering and acceptance are still done by the app, because the agent side has no stage.

**Which model**: the one the user is currently using. When no key is configured, this step is skipped and only the rule repair result is used, with a prompt to the user: "After configuring a model, you can have her adapt once more".

### 2.4 Acceptance

After the app applies the adapter, it runs three layers of checks in the background:

1. **Structural check**: all ids exist, values are in range, and no toggle-type parameters (clothes, watermarks) are treated as expressions.
2. **Motion check**: drive "look left", "blink", "open mouth" and "happy" once each by the adapter and take screenshots, comparing pixel differences with the default pose. No change means the mapping is wrong; change falling outside the picture means the direction or amplitude is wrong.
3. **Visual check** (when the model can see images): send the screenshots back along with "what this should be", have the model point out which is wrong, and then change the adapter.

At most 3 rounds, finally using the best-scoring version. The UI shows her "trying on clothes".

### 2.5 Saving, correcting, sharing

- The adapter is written into character.json, with the moc3 fingerprint.
- Two items are added beside "Her profile" in the menu:
  - "Re-adapt".
  - "This is wrong": e.g. the user says "petting the head does nothing" or "her face is black when happy". That sentence is extra input for the next round of AI adaptation, the AI changes the table, and the app accepts it. This is what the so-called "instant compatibility skill" is: the user says a sentence and it takes effect a few seconds later.
- Once there's a market, adapters are stored separately from models. The model itself has copyright issues, while the adapter is only parameter ids and values. On import, first look up in the market by fingerprint for an existing adaptation table.

## 3. The original design's adaptation table (the market contract; for the current app format see §6.1)

The single-target `params`, `zones` without an x coordinate, `toggles` and other fields here are the format of the C720 market contract, and can't be taken directly as the current app's execution contract. For the current app's actual format, the request shared by both modes, the allowlist and the evidence boundaries see [Adaptation contract and wiring](companion-adapt-contract.md).

```json
{
  "adapter": 1,
  "moc": "<sha256 of the moc3>",
  "params": {
    "ParamAngleX": { "id": "PARAM_ANGLE_X" },
    "ParamEyeLOpen": { "id": "EyeL", "scale": -1, "offset": 1 },
    "ParamMouthOpenY": { "id": "MouthOpen", "scale": 0.8 }
  },
  "emotions": { "shy": { "expression": "blush", "face": { "ParamEyeSmile": 0.4 } } },
  "actions": { "wave": { "motion": "wave" } },
  "zones": [{ "id": "head", "from": 0.02, "to": 0.19 }],
  "framing": { "zoom": 0.86, "y": 0.06 },
  "tail": ["Param_Angle_Rotation84"],
  "toggles": { "outfits": [["Clothes1"], ["Clothes2", "Clothes3"]], "hide": ["Paramshuiyin7"] },
  "notes": "One sentence for the user, e.g. 'She has no tail parameter, so wagging the tail is replaced by swaying the body'"
}
```

- The stage's actual affine semantics: `set(v)` uses `v*scale+offset`; `add(delta)` only adds `delta*scale` to the current native value, without adding the offset again. Finally the model clamps by the native range.
- `toggles` is a market data field, which the app's AI adaptation this round doesn't execute, and doesn't automatically set clothing, watermarks, credits or show/hide.

## 4. Security, privacy, cost

- **The AI's output is treated only as data**: it first passes the schema, ids go through the allowlist (only those in the probe), values are clamped, and unknown fields discarded. No code is executed and the stage script isn't modified.
- **What's sent out is only the parameter list and thumbnails.** It is explained once on the first adaptation, and "Let AI help adapt" can be turned off in settings.
- **Cost**: 500 parameters compressed is about 6–10k tokens, one round of output 1–2k; image viewing is billed by the model. A prompt on import says "your model will be used once".

## 5. Division of labor

- **Frontend (me)**:
  - The probe mode.
  - The rules to be added in §2.2.
  - Execution of the adapter on the stage.
  - Screenshots and pixel checks for acceptance.
  - The import page's check-up conclusion, and the UI for "Re-adapt" and "This is wrong".
- **Backend (GPT Pro)**:
  - Finalizing the adapter's JSON Schema and parameter vocabulary.
  - The lightweight mode's prompt, and the full mode's `companion-adapt` skill.
  - The evaluation set: collect 20–30 publicly available models, a few each of standard naming, Cubism 2 style, custom naming and high-precision multi-mask; measure adaptation accuracy, rounds and tokens.
  - The list of moc versions Core 6 doesn't support.
  - Adapter storage in the market and lookup by fingerprint, merged into C700.
- **Licensing**: whether an adapter can be shared publicly is verified together under C730.

## 6. Phasing

1. **Phase 1 (done 2026-11-08)**: probe, the rule completion of §2.2, the stage's `params` aliases, one round of plain-text adaptation in lightweight mode, structural checks. Differences between what actually landed and the above:
   - **Check-up**: there's no separate `?probe=1` mode; when the stage finishes loading it attaches the check-up report to the `ready` message (`probeReport` in `stage.js`). Big Fat Fish's 509-parameter report is about 43 KB.
   - **Rules**: parameter name comparison ignores case and underscores, so `PARAM_ANGLE_X` automatically matches `ParamAngleX`; there's also a synonym table. Automatic scaling happens only when the ranges differ tenfold or more; ±30 versus ±10 isn't scaled, so the built-in whale girl doesn't change too.
   - **Adaptation table**: saved separately as `character/adapter.json`, without changing character.json. The stage's `adapter` command applies it live, and deleting the file restores the original. The `actions` in the table can replace her gestures with the model's own motions.
   - **Trigger**: the judgment logic is in `companionAdaptWanted` in `companion_adapt.dart`; the rule is: core parameters missing, touch zones only usable with defaults, no emotion table, tail parameters present but not registered, and any one of them triggers it. Each model (by moc3 fingerprint) is automatically tried only once; the menu "Adapt this model" can start over with a sentence "what's wrong", or undo (after an undo it won't auto-adapt back), and there's also a switch controlling "auto-adapt when importing a new model".
   - **Ask first the first time**: when the user hasn't agreed yet, automatic adaptation doesn't send a request directly, but shows a small card above the input bar explaining what will be sent and that the key will be used once; only pressing "Adapt" sends; "Not needed" means this model is never asked about again. After agreeing once (or after manually adapting once from the menu) it really becomes automatic. The explanation in the menu lists everything sent: the model name, the parameter list, the names of expressions, motions and parts, the user's words and the current adaptation table.
   - **Validation additions (#753 review)**: an expression's `face` is an additive amount, clamped by the parameter's own range (head turning can reach ±30), no longer uniformly clamped to ±1; touch zones that become empty after clamping are dropped; the adaptation table may carry `framing` (zoom 0.3–3, y ±1); `pose` writes model parameters directly, bypassing aliases; if the `moc` fingerprint in the table doesn't match the current model the whole table is unused.
   - **Errors**: old Cubism 2 models (.moc) and models with a too-new moc version each get a clear reason, no longer just showing "Load failed".
   - **Not yet done**: screenshot acceptance and multi-round visual review (phase 2), the full-mode skill (phase 2, handed to Pro). Also not yet run against a real model API: this machine has no key, and the model answers in the tests are all simulated.
2. **Phase 2**: screenshot acceptance, multi-round visual review, "This is wrong" feedback, the full-mode skill.
3. **Phase 3**: adapters enter the market, reused by fingerprint.

### 6.1 C906 (continuing C810): the local execution contract shared by both modes

The pure functions are in `companion_adapt_contract.dart`, and the original `companion_adapt.dart` keeps exporting the same API. The request becomes a versioned JSON data packet; all 800 usable parameter positions, known mappings versus unknown coverage, existing touch geometry and truncation status are expressed separately. Full mode uses the bundled `companion-adapt` skill, reading the system prompt that is verbatim the same as lightweight mode.

A full replacement rebuilds the mapping from `ruleAlias`, then overlays this round's legal candidate params. C906's probe reports the full rules and raw affine coefficients, keeping very small parameter ranges; the checker judges face by the effective table after replacement. The current `linked` may come from an old adapter about to be deleted, so it can't serve as a basis after replacement, nor can scale=1 be guessed from it. When an old report's rules are unknown, only a face supported by explicit legal mappings is accepted; a judgment of empty keeps the old table, and current is only a reference and isn't merged automatically.

This round's probe has only the names of successfully loaded expressions/motions, and no checked effects or side effects. New AI candidates must separately get `CompanionAdaptEvidence` from the app; without evidence, resource references aren't opened; the allowlist isn't filled from replies or asset display names. Automatic adaptation doesn't write `pose`, native unknown `face`, `toggles`, or `framing` lacking geometric evidence, and touch zones can only copy existing coordinates in the report whose source is not default. Adaptation tables and character.json already on disk are not migrated by background processes; an explicit re-adaptation re-validates.

Full-mode page wiring, effect measurement, screenshot acceptance and the scheduling of at most three rounds are still to be implemented by the mainline. For details see [C906 wiring and boundaries](companion-adapt-contract.md).
