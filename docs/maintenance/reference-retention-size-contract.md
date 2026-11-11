# Reusing exact byte counts when trimming session references

Refs W17-B, no corresponding public issue number. Base 63e255f; this change modifies runtimeVersion. Not compiled for Android.

Only the second shorten loop inside `retainReferencedSession` is changed; public fields, capture timing and storage ownership are unchanged. Each message still reads its source independently; preview/spill reuse their original snapshot. There is no cross-message/cross-call cache.

The original patch 57 already made the first drop loop maintain an exact renderedBytes: the initial value equals the UTF-8 byte count of the TagSafe JSON; each deleted item subtracts its JSON byte count and one comma. The newest item is always kept, and there are at least two items before a deletion, so subtracting the comma is always exact. Other items and metadata are unchanged, and at the entry of the second loop renderedBytes=size() still holds.

The second loop uses that exact value to decide whether the limit is exceeded and to compute the overflow. After each assignment to retained[longestIndex], size() is recomputed immediately, restoring the invariant. Therefore the choice of the longest item and tie order, each round's target, the truncation marker, the body, budget failure, omittedBytes and all return fields are the same as the original algorithm; only repeated full serialization/UTF-8 length measurement is removed. If shorten runs k times, the related length measurements including the initial size go from 2k+2 to k+1, not counting other serialization outside the function.

The existing reference-drop-cost test's full-object serialization count on the no-shorten path at four scales goes from 2 to 1; the test only mechanically updates that cost assertion; existing content and budget goldens are unchanged. The new manual live test uses a real Host/Agent, its own closed source Session and a local model HTTP gate; two public steer inputs enter the same step and each still reads the source once.

Performance is not a functional bug fix. Fixed 1/8 MiB, 3 samples each for AB/BA; the 1 MiB AB median regressed about 4.4%, and the 8 MiB medians were lower in both orders but noisy. Don't advertise stable gains at all scales or device speedups. Complete model requests have real differences in run paths/time/session/ports and their derived output budgets, which need to be kept independently; identical normalized reference context can't be written up as identical raw requests. Old records and logs are not modified, and model text and authorization are unchanged.
