# Legal JSON own-field contract for repeated-tool reminders

Refs W17-B: data consistency of normal tool arguments; no corresponding public issue number.

Base 63e255fab5cb9d817af30b631c3643ccce8e9231, DSH 0.2.2-rc.1. The repeated-tool reminder identifies consecutive identical calls by tool name and the complete canonical arguments. Every own field of a legal JSON object is data, including an ordinary document field named `__proto__`; calls with different values for a field must not be grouped as the same call just because of it. Recursive key sorting of objects ignores insertion order, array element order and string values are kept; thresholds and per-Agent count ownership are unchanged.

The private sortJsonValue's temporary dictionary is changed to Object.create(null), so per-key assignment keeps all JSON own keys. No new public API, dependency or wire field; preview trimming isn't modified, actual tool arguments or execution results aren't modified, and permissions or object prototypes aren't touched. Only the internal canonical dictionary uses a null prototype, and it is still JSON.stringify'd at the end for use in the original chain key.

The formal live test runs its own read-only echo tool through the real CLI/Agent/native ToolRuntime, with a public object schema allowing additional fields. Six cases: different values for the own special-name field, different values for an ordinary field, identical arguments, same-meaning objects with different key order, different values for own keys inside a nested array, and different array order. 3 tool calls and 4 local model requests each; thresholds [2,3]. It doesn't depend on the private canonical function and doesn't use a fake Agent or security experiments.

This is a standalone, revertible runtime patch that changes runtimeVersion. Not compiled for Android; it doesn't mean real remote models, PTC, all failure execution paths or mobile device performance have been verified. The npm published package doesn't include upstream test sources, so it isn't claimed that the full upstream suite passes.
