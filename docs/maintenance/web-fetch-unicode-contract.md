# web_fetch truncation contract for legal UTF-8 content (670)

Base 63e255f, DSH 0.2.2-rc.1. Before implementing, its own ordinary HTTP UTF-8 text/plain and text/html, through the real Cordis WebRuntime/HTTP provider and ToolRuntime's public admission/execute, reproduced three places where truncation produced a lone high surrogate: the provider's maxBodyChars, the source input before HTML conversion, and the final output with footer.

The length budget is still in UTF-16 units, not changed to code points/graphemes. The provider's maxBodyChars original contract is positive finite, allowing decimals; slice's rounding semantics for positive decimals are kept: first cut the prefix at the original cap, and back off one unit only when the left and right of the cut are a valid high/low pair, adding no dependencies. The original truncated judgment is unchanged, including positive caps of less than one unit.

The tool keeps using the truncateWithoutSplittingSurrogatePair it already depends on, handling renderBody's source input and the prefix with footer; no new helpers or interfaces. That existing helper removes a trailing high after actual truncation and keeps untruncated input as is; this run's test sources are all legal UTF-8. For the output branch under 78, the ordinary HTTP URL/header prefix is ASCII; this run didn't prove Unicode body can reach it, so the original slice is kept unchanged.

The original footer, truncated/meta and total length limit are kept; HTTP validation, redirects, timeout, cancellation, the byte cap and the HTML conversion mechanism are kept. The tool render/presentationMeta's original memo is unchanged. Arbitrary already-corrupted input is not repaired, and equivalence of invalid Unicode output for all historical custom providers is not claimed.

The provable consequence is only that the returned JavaScript string no longer gets a lone surrogate created by this kind of legal-pair truncation; this isn't the same as having measured network illegal UTF-8, JSON rejection, model errors or device crashes. Changes runtimeVersion, pins unchanged; not compiled for Android, real models/PRoot/ARM not run.
