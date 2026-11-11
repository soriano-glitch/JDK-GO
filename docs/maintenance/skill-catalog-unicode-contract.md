# Skill catalog description truncation contract (672)

Base 63e255f, DSH 0.2.2-rc.1. The default catalogDescriptionMaxLength=500; normal legal SKILL frontmatter descriptions enter the agent/pre-step catalog user-role message via the filesystem SkillRegistry. The first Messages request of the actual CLI/Agent has confirmed that 496a+emoji+tail cut at 497 units produces a lone high surrogate, not just in a UI label.

normalizeWhitespace, trim, the original three-dot ellipsis, the total UTF-16 budget and untruncated input are kept. Only when truncation is actually needed, if the left side of the maxLength-3 cut point is high and the right side low, it backs off one unit before appending the original ellipsis; no new dependencies, and no change to names, skill discovery, permissions, the complete skill body or loading behavior. At the minimum allowed limit of 3, the kept prefix is empty and it's still just the ellipsis.

The catalog source.entries and the model-rendered text share this description result; the digest/dedup logic is unchanged. No evidence was found of actual consumption of the bundled PartialArguments.textPrefix at 309, so its code isn't changed and the UI scope isn't widened.

The new verification is run explicitly as *-live.mjs: real CLI/Agent/provider, own files and a local model protocol fixture, no real remote model or Android. The ordinary first failure is the same formal assertion failing on the original; the early observation script exiting naturally with 0 is not called a pass. It isn't inferred that JSON can't encode it or that the model necessarily rejects it. Changes runtimeVersion; not compiled for Android, PRoot/ARM not run, pins not changed.
