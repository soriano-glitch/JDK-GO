# 636 agreement: incremental UTF-8 tails for local processes

Status: the pre-implementation agreement has completed source review and independent re-review; this document corresponds to the minimal implementation. Base d935432d18cd83c951a87823b791b66c18426a64, official rc.1.

## Reproduced entry points

The actual LocalSubprocessRuntime starts Node, writes the first byte of "中" to stdout, which the consumer reads after a normal IPC handshake, then writes the remaining two bytes and exits 0. Two readFrom calls get `�` / `��`, lossy=false; the complete read after exit is `中`. The actual LocalBashExecutor's public resolve→execute→readOutput is red the same way: the two deltas join into `���`, while the final result.stdout.text is `中`.

Evidence: `probe.mjs/run.log`, `bash-probe.mjs/bash-red.log`. The latter runs an ordinary `bash -c`, with Node gating the two writes through its own temporary loopback IPC, onExpiry=none, no sleep, no real timeout wait. It contains only its own scripts and doesn't read host configuration/credentials.

## Current contract and minimal change

The offset of the official SubprocessOutputReader is a raw byte coordinate over the whole stream, maintained independently by each caller, not a character count; nextOffset is the position for the next continued read. This definition and the wire fields are kept. The current "Read everything captured" wording needs clarifying: while process output isn't sealed yet, only the tail that can be fully UTF-8 decoded is delivered; if the end is an incomplete prefix of a valid UTF-8 character, at most 3 bytes are held back, and nextOffset stops at the start of that prefix. Once the new bytes complete it, continuing to read recovers the character, without introducing per-consumer state or a global decoder.

1. ASCII, complete UTF-8 and bytes already determined to be illegal are decoded with the current Buffer; only an end prefix that could still be completed into a valid character by later bytes is held back.
2. nextOffset is always an absolute byte offset in the raw stream; the cumulative raw byte count, tail capacity, spill content and snapshot bytes are unchanged.
3. When there are no more bytes and the process is sealed by a normal exit/cancel, the next read must deliver the incomplete tail per the original Buffer replacement rules and advance to the raw total; it must never be held back forever.
4. Head ring truncation still follows the original lossy judgment; the existing replacement of incomplete characters at the front is kept, and recovering lost bytes isn't claimed. If a pending tail is later truncated, it is handled on the lossy path.
5. If lossy and this read produced no text because of an incomplete prefix, nextOffset keeps the caller's original cursor until text can be delivered; this way, after the actual jobs pump ignores empty text, later EOF/continuation-byte reads still carry lossy, and gapBefore isn't lost.
6. Multiple independent cursors reading from the same/different legal boundaries don't affect each other; the existing replacement behavior when any caller actively gives an offset in the middle of a character isn't extended into an alignment protocol.
7. After exit, readFrom(0) must match the complete final result (including tail truncation). stderr is handled the same as stdout.

## Existing consumers and wait risks

- dsh-bash-local readOutput saves each stream's nextOffset as its own cursor; there is no wait loop based on raw available.
- dsh-tool-bash/pwsh processSources forward observed[channel].readFrom directly.
- dsh-jobs-local startPump reads each source once per round, then waits a fixed pollMs or for the producer to finish; it doesn't immediately read again because nextOffset didn't advance. After finishing, the final drain sees the EOF replacement after the subprocess seal.
- No waitForOutput-style consumer that wakes instantly on raw offsets has been found yet; the independent review should re-check all readFrom call sites. Tests must verify that repeated reads during a pending prefix produce no new output/don't advance, and that the real job pump doesn't busy-loop; use a controlled timer to advance, and real waits are forbidden.

## Implementation and acceptance boundaries

The implementation only changes the official subprocess-local/output.js, adding a runtime patch composable in file order, without first modifying the immutable prefix. seal needs to remember the stream is sealed even when there's no spill file; the EOF state can't be completed only when spillFd exists. Any helper is limited to checking at most 4 bytes at the end, without introducing a generalized cache/decoder framework.

Minimum regressions: red/green for the real subprocess and the Bash consumer; 2/3/4-byte splits; stdout/stderr; independent cursors; complete/illegal/EOF residue; tail front truncation and a pending prefix being evicted; ordinary cancel sealing; the real job pump with a controlled clock and no busy loop. The existing terminal UTF-8 tail truncation, job ring and output byte cost gates are kept. Android/PTY/SSH not tested, and no improvement in those environments is claimed.

This patch adds a runtime/patches file, which is an inputs_sha input of build-runtime.sh; per the current build process it will change runtimeVersion. Pins are recorded by the owner in the formal environment; this patch doesn't modify pins or specify a new version.
