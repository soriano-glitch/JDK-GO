# Text read-modify-write keeps the original UTF-8 BOM (674)

Base 63e255fab5cb9d817af30b631c3643ccce8e9231, DSH 0.2.2-rc.1. Reproduced with the real public LocalFileSystem.editText: for a UTF-8/CRLF file starting with a legal EF BB BF, replacing alpha with beta additionally deleted the original three-byte BOM; the no-BOM control stayed correct. The default edit tool delegates to this service, and the patch executor and the public FS interface also use the same readForEdit result.

The first UTF-8 BOM is an original file format marker that read-modify-write should keep. readForEdit continues to return the original logical text without the leading BOM and with LF normalization, and additionally records whether the raw bytes start with EF BB BF. When editText, patchText and moveFile write back, they restore that marker together with the original line-ending policy. Read display, the diff's before/after, version checks, mutual exclusion and atomic publication are unchanged; no file reads or dependencies are added.

move's existing early diff-basis budget is still judged by the text bytes excluding the original leading BOM; the three format bytes newly restored when actually writing should not turn an otherwise usable before into null. The target file's own bounded read still uses the original real size limit. This budget boundary has negative controls for exactly equal to and less than the limit.

An explicit writeText still overwrites with the complete content given by the caller and does not inherit the old file's BOM. U+FEFF in the body, characters other than the first among several consecutive markers, and U+FEFF newly inserted by the caller all count as text and are not deduplicated or swallowed. A pure move is still the existing text service's two-phase publish/delete using the original line-ending normalization policy, and can't be advertised as a byte-for-byte copy of arbitrary files.

The ordinary Node tests depend only on the existing DSH_PREFIX (or DSH_TEST_PREFIX), real Cordis/LocalFileSystem and their own temporary files, matching the existing CI environment; no module-level precondition on a missing executable is added. File byte assertions are separate from assertions on the logical result without the leading BOM, and negative controls are kept for no BOM, explicit full overwrite and no write on failure. Host tests don't represent Android or PRoot/ARM acceptance.

Refs W17-B, no corresponding public issue. Changes runtimeVersion; not compiled for Android; real devices and real remote models were not accepted.
