# Line-ending write-back for files with a long first line

editText, patchText and moveFile normalize text to LF for processing, then write it back in the original style detected at read time. If the original sample of the first 4096 UTF-16 units contains an LF, the original rule continues: CRLF if it is the majority, LF on a tie; the existing normalization policy for mixed line endings is unchanged.

Only when the sample contains no LF at all does it look for the first LF starting from sample.length. If the unit before it is CR, CRLF is chosen, otherwise LF; if the whole text has no LF, LF is still chosen. This fills the gap in detecting pure-CRLF files whose first line exceeds the sampling window, including the case where the CR is exactly at the end of the sample and the LF just outside the window. This is not a whole-text majority count, doesn't promise item-by-item preservation of mixed line endings, and doesn't change the contracts for the public before/after LF text, version locks, atomic publication, BOM or move deletion results.

The old rc.4 had the same gap; it is not claimed to be newly introduced by the upgrade. This runtime vendor patch changes runtimeVersion; not compiled for Android. Refs W17-B, no corresponding public issue number. The real public LocalFileSystem tests use only their own plain text, with no permission/private-callback simulation.
