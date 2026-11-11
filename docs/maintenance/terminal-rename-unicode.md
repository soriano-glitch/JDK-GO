# UTF-16 boundary contract for terminal renaming

Refs W17-B (ordinary terminal state parameters, no corresponding public issue number). Does not change runtimeVersion. Not compiled for Android.

The existing TerminalWorkspace.rename trims first and rejects empty/same-name values, optimistically shows the complete next, and sends at most 120 UTF-16 units to the Host; on failure it still rolls back conditioned on epoch/owner. The existing page's maxLength counts graphemes, so 119 ASCII plus 🙂 is a legal 120-character input, but the original substring cut the last emoji into a lone high surrogate.

This fix backs off 1 unit only when the left and right of the 120-unit cut point are a valid high/low surrogate respectively. ASCII, untruncated input and a complete pair landing exactly on the boundary are unchanged; it isn't changed to a code-point or grapheme budget, the Host/SDK protocol, page and optimistic display policy are unchanged, and no attempt is made to repair originally illegal input.

Verification uses the existing ProviderContainer and FakeTerminalBackend, checking the sent title through the public TerminalWorkspace.rename; it isn't actual Host/PTY or Android acceptance. On the original, the same 3 cases were actually 1 red, 2 green; the early missing package_graph and two ENOSPC errors were preparation failures and aren't counted as product reds. When resources were short, the standard TMPDIR and this run's own generated cache location were temporarily placed in RAM, without changing tests/product/toolchain.
