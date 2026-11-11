# str_replace_editor edits keep the UTF-8 BOM

Refs W17-B, no corresponding public issue number. Base 63e255f. This change modifies runtimeVersion; not compiled for Android.

Only metadata restoration for str_replace/insert; view/create, verbatim matching, CRLF/LF, insert line numbers, replaceIfVersion and sandbox error mapping are unchanged. This isn't a defect newly introduced in rc.1; the tool is the optional str_replace_editor, not a default Plugins page bundle.

LocalFS readText consumes one original UTF-8 BOM. When writing back after a modification, that format marker must be restored, while keeping FEFF in the body (including a second leading FEFF and FEFF actively provided by new_str), without deduplication. Only when info.size is known to equal Buffer.byteLength(before,"utf8")+3, after the original match/line-number validation succeeds, are the first 3 bytes read via the public readByteRange; only if they are indeed EFBBBF is one marker added. The common no-BOM path has no extra file read; an unknown size follows the old behavior. For backends that keep the BOM, size equals the encoded before, and the guard doesn't add one; this is a source proof, and dynamic coverage of custom backends isn't claimed. Other third-party text normalization is outside the guarantee.

The extra read follows the original signal and try/catch, and finally still uses the original replaceIfVersion; no atomic snapshot across reads or change to version rules is promised. readByteRange is used rather than readBytes(max 3), since the latter is a whole-file limit, not a prefix read.

All 9 formal cases use real Context/Tools.execute/LocalFS; no FakeAgent or FakeFS. Two original-BOM paths, no BOM, double leading BOM, explicit body FEFF, and CRLF verbatim failure without writing. The related editor-view-format's full 7 cases still pass; no real Agent, remote model or Android/PRoot/ARM verification.
