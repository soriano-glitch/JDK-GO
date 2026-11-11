# read single-line truncation contract (668)

Refs W17-B: result integrity of normal UTF-8 text reads; no corresponding public issue number.

readMaxLineLength keeps its UTF-16 code unit limit and is not changed to a code-point or grapheme count. Only when truncation is actually needed and the budget boundary falls between a valid high/low surrogate pair does the kept end back off one unit; otherwise the bytes are identical. The original truncation marker still reports the configured limit.

offset, limit, the total line count, CRLF/EOF, the byte budget computed on the final body plus marker, and file read/permission/cancellation behavior are unchanged. lineBufferCap=max+1 already keeps the following unit needed to judge a valid pair, so the buffer doesn't need to grow. The public tool text and the structured lines should be consistent; whole/stream both go through the same presentation function.

Grapheme clusters are not handled, originally illegal input is not reinterpreted, write tools are not modified and no parameters are added. The actual original public tool already has evidence from three cases; the formal gate uses real temporary files, public tool execution and a legal stream-threshold configuration, without private chunk injection. Not compiled for Android; no real-device, ARM or PRoot verification, so #570 can't be closed on this basis. The new runtime patch will change runtimeVersion.
