# UTF-16 boundary for turn navigation previews and replaying old caches (677)

Base 63e255fab5cb9d817af30b631c3643ccce8e9231, official 0.2.2-rc.1. Refs W17-B: found this round through real measurement of the public service; no corresponding public issue number.

turnOutline generates navigation summaries only from committed Session events. The prompt keeps a budget of 50 UTF-16 code units and the response 120, continuing the existing whitespace folding, space joining of text blocks, ellipsis and bounded pre-read rules. If the internal pre-read or the final truncation falls exactly in the middle of a complete surrogate pair, the cut point backs off one code unit; half an emoji is not output, the budget isn't widened, the whole input isn't scanned or converted, and user text that was already incomplete isn't rewritten. ASCII, BMP and characters fully within the budget keep the existing behavior.

The response is still committed from the draft only at turn/end; draft updates still keep the identity of the turns array, with no increase in event push frequency. Wire fields/service interfaces/original Session events are unchanged, and the official or app UI isn't modified.

The schema of existing stateVersion 2 checkpoints allows old bad previews in strings, so fixing only the algorithm would keep hitting old values of the same version. This patch raises this projection unit's stateVersion to 3: the existing registry's viewCheckpoint skips the wrong version, restoreFloor requires reading from seq 0, and restore refolds from existing events; no new cache format is added and no session logs are deleted. Other projection units' versions are unchanged. Full actual cache persistence/restart or device verification is only claimed per the final test record, and pure registry replay isn't called full Host disk recovery.

Changes runtimeVersion; pins/version are recorded by the owner through the current process. Not compiled for Android; PRoot/ARM and real phones not verified.
