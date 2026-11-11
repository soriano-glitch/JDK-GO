# Unicode boundary for optional Ralph result text (680)

Base 63e255fab5cb9d817af30b631c3643ccce8e9231, DSH 0.2.2-rc.1. Refs W17-B: found this round through the real CLI consumer of the explicitly mounted official Ralph; no corresponding public issue number; it isn't claimed that the default configuration enables this tool automatically.

The parent-model text of a successful Ralph result contains fixed instructions, the formatted report and the necessary truncation marker. maxResultChars keeps its original legal range and UTF-16 code unit budget; when not over the limit the original is returned, and when the budget only fits the marker, the marker prefix is still taken per the existing rule. When a body prefix can be kept and the cut point falls exactly in the middle of a valid surrogate pair, it backs off one code unit, not outputting half a character, while keeping the original truncation marker and the total budget.

This item doesn't change when Ralph can be called, the explicit human-request convention, fresh-child isolation, the number of rounds, the report schema/status interpretation, or error or cancellation settlement. A report claiming completion is still not independent certification. Ordinary tasks are not automatically turned into Ralph, no default mount is added, workflow/subagent is not modified, and no historical events are written back.

The real live gate uses its own profile to explicitly mount the existing official module; the test user explicitly requests Ralph, at most one round, with a real child Agent and the public structured_output; it doesn't extract a private formatter or use a fake workflow. It depends on the actual CLI/fresh-child environment, is named -live.mjs and run manually, and doesn't widen the ordinary CI prerequisites. The final README states the measured budget and number of requests, and doesn't widen a limited success path into acceptance of the default 16384 budget, multiple rounds, cancellation or all of Ralph.

Changes runtimeVersion; pins/version are recorded by the owner. Not compiled for Android; PRoot/ARM and real devices not verified.
