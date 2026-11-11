# Unicode boundary for argument previews in repeated-tool reminders (683)

Base 63e255fab5cb9d817af30b631c3643ccce8e9231, DSH 0.2.2-rc.1. Refs W17-B, found this round through a real CLI consumer; no corresponding public issue number.

previewArguments only controls the canonical argument prefix shown to the model; it doesn't control the actual arguments or the complete repeat-detection chain key. The positive-integer validation of argumentsPreviewChars, the UTF-16 code unit budget, thresholds, the original marker format and returning the original when not over the limit are kept. When over the limit, it backs off one unit only when the cap falls exactly across a valid surrogate pair; the omitted count must be computed as canonical.length minus the actual end. This cap is a prefix budget; the original marker takes extra length, and it isn't turned into a total budget for the whole text.

sortJsonValue, the repeat-detection key, tool call arguments/results, existing notice sources and execution semantics are unchanged; the 682 own-key fix is independent. Lone surrogates already present in the input are not repaired, and no codepoint/grapheme budget, whole-string expansion, cache or new dependency is introduced.

The real consumer uses a normal own document tool with a headless Agent/local Messages; after three calls with exactly identical arguments, the fourth request observes the detailed reminder; thresholds [2,3], a general cap of 500 and a minimal positive cap of 1 as controls. No fake Agent/fiber, and no extraction of the private preview. The real CLI environment is named -live.mjs per ADD6 and doesn't widen the ordinary CI prerequisites. Remote models, devices and all default business paths were not run.

Changes runtimeVersion, with pins/version recorded by the owner; not compiled for Android, PRoot/ARM not run. Old Session events are not modified.
