# Unicode truncation boundary for notice summaries (678)

Base 63e255fab5cb9d817af30b631c3643ccce8e9231, DSH 0.2.2-rc.1. Refs W17-B: verified this round through the public exported function and its consumers; no corresponding public issue number.

The public boundContextSummary keeps its budget of 120 UTF-16 code units; input shorter than or equal to the budget is returned verbatim, and only when it exceeds the budget is a prefix kept with an ellipsis appended. When the original truncation point falls exactly in the middle of a valid high/low surrogate pair, it backs off one unit rather than output half a character. ASCII, BMP, pairs fully inside the prefix and the existing ellipsis rules are kept; it isn't changed to a code-point or grapheme budget, the whole string isn't expanded/converted, and lone surrogates already present in the original input are not repaired.

The existing model-switch, jobs, goal and subagent notice producers keep calling the same public function; no new API, wire field or protocol. Only summaries generated from now on are protected; old summaries already belong to persisted Session events, old logs are not rewritten, and old values are not claimed to recover automatically. The complete content in the model request or the Session original is not modified by summary trimming.

The gate lists the public helper and the real consumer scope separately per the final README, and doesn't call every caller found only in source dynamically verified. Changes runtimeVersion; pins/version are recorded by the owner. Not compiled for Android; PRoot/ARM/real devices were not run.
