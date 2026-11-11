# Bounded snippet window: pre-implementation contract and stopping-point proof

Base prefix63 `dsh-session-query-sqlite/lib/index.js:325–374`. Read search-snippet63/README first: the old candidate that skipped join/Array.from got slower in the 8 MiB reverse-order measurement and was stopped. This direction is different, only discussing stopping the scan once the output window after the first hit is already determined. It is currently an isolated candidate; the public boundaries and performance evidence are stored separately, and source proof doesn't substitute for measurement.

## Actual consumption

After the public searchSessions/searchEvents queries return rows, :914 calls makeSnippet on row.marked_text; :961/984 use SQLite FTS5 highlight. snippetChars is a legal positive integer, default 240, allowing 1/2/3. README61 promises a Unicode code-point length limit and a stable plain-text summary. Documents and queries are first passed through sanitizeFtsText (:295), replacing NUL/U+FDD0/U+FDD1, so collisions in the body aren't new markers; the original sanitization must still be kept, and a directly private marked string can't be used as a normal production fixture.

## Old behavior to keep

1. Use for...of per Unicode code point and `/\s/u` to recognize whitespace; leading whitespace isn't output, a run of interior whitespace outputs one ASCII space, and a final trailing single space is deleted. Lone surrogates are still the original for...of units; don't replace them or switch to graphemes along the way.
2. The first open marker records the temporary normalized length at that time, which may include a space that will finally be deleted; close markers and subsequent open markers aren't output. At the end it must clamp by min(matchStart, N−1). With no marker, the default is 0.
3. When the complete length N<=M, returning the full clean text takes priority, including M=1. Don't add an ellipsis just because a marker is seen.
4. For long text, M=1 returns the ellipsis. M=2/3 must reuse the old window branch as is: the prefix is fixed after the initial start computation; when contentLength<1 resets start, the prefix is not recomputed; the near-end window widening doesn't recompute the prefix either. These seemingly unnatural results must not be "corrected".

## Bounded buffer design

Maintain a global normalized code-point count n, whether the last item is a pending space, firstMarker, the first M code points, and a ring window of the last 2M+4 code points. firstM is used for short full texts / the default opening with no marker; the tail ring is used for the preceding context of a late marker and the EOF backfill. The ring storage must not introduce a new O(M) loop via shift each time.

When writing a space, it can be counted into n immediately (keeping the marker's observed value), but it can't be taken as evidence that the full text has exceeded the boundary. After each non-whitespace ordinary code point, the current n is a confirmed length: even an immediate EOF won't roll it back by trim. A marker itself doesn't confirm a trailing space.

Once firstMarker is known, compute a tentative window once with the current n, in the same computation order as the old makeSnippet (including the fixed prefix and the cap 2/3 special branches). Only when n>M and firstMarker<n and the tentative end<n can that window be returned early:

- The actual final N>=n, so the short-full-text branch is never entered again;
- The marker's clamp is stable, because firstMarker<n<=N;
- start/prefix/contentLength depend only on M and the stable marker;
- end<n<=N proves the near-end backfill won't be triggered. Subsequent text, markers and whitespace can't change the result.

M=1 can independently return the ellipsis once n>1 is confirmed, without continuing to look for a marker. The general-M case with no marker still scans to EOF; constant-time scanning is not falsely claimed.

At EOF, if the last item is a space, n is decremented by 1; then the old window computation is executed fully with the final n and the first marker. Extra trailing spaces kept in the ring and the first segment don't participate in the final indexes. Near-end only needs the last M code points, which the ring covers; before the initial marker at most floor(M/3) is needed, and the later stopping point at most one result window, so 2M+4 is a conservative capacity and the complete prefix needn't be kept.

## Required public boundary checklist

Compare value by value against the original through real Session/SQLite public search results, without exporting the helper directly:

- Short / exactly M / long text; cap 1/2/3 and the default 240.
- First hit at the beginning, middle and end; multiple hits keep taking only the first position.
- Leading/interior/trailing whitespace runs, newline/tab and Unicode whitespace; after a hit at the end there is only whitespace, and the suffix must not be decided early by mistake.
- Near-end backfill and output where the old prefix isn't recomputed.
- Chinese, emoji and text that persistence actually accepts; code-point counts aren't the same as UTF-16 units.
- When the body contains reserved marker code points, it goes through the existing sanitize and then FTS, with no marker leaking into the result.

Whether SQLite's normal highlight produces "a marker followed only by trailing whitespace" or no marker at all is determined by actual public queries; don't fake a producer to cover private wide input. The above are not all verified cases.

## Expected scope and stop conditions

Early hits with a long tail may save most of the normalize scan / the complete temporary character array; late hits still have to scan the prefix, and SQLite highlight and sorting/reading back the complete marked_text are not optimized either, so a total cost of O(M) or saving all 8 MiB of memory can't be claimed. With no marker it may only save the array, not the scan, and the negative result of the old join prototype must still be kept. The author first measures the real public cost and typical positions; without stable value it doesn't continue, and adding caches for ownership/capture/validation is not part of the plan.

## Very large legal budgets and storage bounds

The configuration's assertPositiveInteger only requires Number.isInteger(value) and value>=1; it doesn't require a safe integer and sets no upper limit. The implementation must not pre-allocate the budget size with `new Array(2*M+4)`.

In the current prototype, first=[] and tail=[] grow only with characters actually read. If M is larger than the actual full text length, all read indexes fall into first, and it ends up on the full-text path; although the tail capacity may exceed the exact integer range, the actual indexes are still smaller than the real short text length. When M=Number.MAX_VALUE, 2*M+4 is Infinity, and a finite index % Infinity still equals that index, so it neither triggers an array-length construction error nor produces a new NaN index. No new text-length promise: it only proves the normal finite index range of existing usable JS strings.

So there's no need to modify the prototype being measured to add a cap limit; a limit would change the public configuration contract. In cost terms the dynamic buffer is O(min(N,M)), not pre-allocated O(M); the first segment and the tail ring still use pointer/character array space; RSS was not measured, and zero extra storage is not claimed.

## Portable draft tests and the boundary of existing measurements

runtime/tests/search-snippet-window.test.mjs is the real Context/SessionStore/SQLite public searchEvents; when lazy DSH_TEST_PREFIX??DSH_PREFIX is missing it skips per test, doesn't load the prefix at module top level, and doesn't depend on CLI/Python/external binaries. Currently 18 cases: 12 measured original goldens, 4 short texts with large caps, cap 1 short-full-text priority, and near-end controls with real tab/newline/Unicode trailing whitespace.

The 12 goldens were extracted from the original's actual complete results, and the original controls use real tab/newline; the new 6 cases add adjacent controls such as very large budgets, without reimplementing the algorithm to serve as an oracle. Finally the original was 18/18 and the candidate 18/18; together with the six complete query-open-retry cases the candidate was 24/24. The first test port misread the escaped display of tool output as literal characters and hand-computed one near-end expectation wrongly, causing a preparation failure; the raw is kept and not counted as a functional red.

Number 688; Refs #444, #463, only the normal large-document search cost; no claim to fix specific device symptoms. After the fixed performance work was done, only the uncalled normalizeMarkedText was deleted, without changing the tested makeSnippet algorithm; the new 18 cases and the related 6 cases were run after deleting the dead code.
