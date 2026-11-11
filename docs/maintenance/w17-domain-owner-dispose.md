# W17: reject late domains after explicit unload (redo of user package 537)

Fixed engine 0.2.2-rc.1, source patch base ce00763. The current K still reproduces three actual Cordis/JSON backend leaks: when the domain plugin is unloaded while backend.open, loadAll or backupRecord is pending, after the disposer has completed closeAll, a late open still publishes the domain and keeps the unit.

## Change and handling of the old package's regression

After all awaits complete and before constructing/publishing DomainImpl, call the real `this.ctx.fiber.assertActive()`; the existing catch closes the unit, clears reserved and propagates INACTIVE_EFFECT. Reopening after an explicit closeAll of a live facility is kept; closed isn't set permanently, and it isn't widened into a restart/unload protocol.

The old 537 made three hand-written title-cache context fixtures fail for lacking a fiber. This time they are explicitly given a real Cordis Context's fiber and cleaned up; no optional chaining is added in the product to dodge the contract, and no assertions are deleted. The original K's changes to the summaryKeys and deleteMany tests aren't carried again by this package; the combined tests are verified with K's original files plus this package's local hunks.

## Commands, golden and results

`DSH_PREFIX=<candidate prefix> node --test runtime/tests/storage-domain-owner.test.mjs`: baseline 3 failed, 2 passed; candidate 5/5. The goldens for all three gates are close=1, retired-domains=0, retained-unit=false, reserved=0, with the shared backend and unrelated units still alive; a replacement plugin can open again. The original IO exceptions keep their original objects.

Affected gates: workspace-lifecycle, deletion-durability, runtime-upgrade-sessions-schedule, plus the two atomic lock modules, 25/25 in total; title-cache-regression passed, title-cache-stat-regression 8/8, title-cache-scale's two 500-entry paths and overlap assertions passed. No real waits were used.

Run one by one: `node runtime/tests/title-cache-regression.mjs <prefix>`, `node runtime/tests/title-cache-stat-regression.mjs <prefix>`, `node runtime/tests/title-cache-scale.mjs <prefix>`. The upgrade test also needs DSH_OLD_PREFIX=<read-only rc4 prefix with the complete original patches>.

After the full K prerequisites, the domain module SHA256: 516caad9c0dd0c67c9785eb95490b84f459eaa41e818e41a5b3c4ae8917b79d8; candidate a50f853f9cc1d4d4d2eea6c4f21498ef604ef11ae3131bc41e21189fc5f4483a. Generation method: overlay the reviewed prerequisites onto the official rc1 in lexicographic order, add the check, then generate with Python difflib.unified_diff using the corresponding a/b node_modules paths; export the source patch with git diff relative to the ce index. The strict 57-item chain passes, and the two production files under test are byte-for-byte identical to the strict chain's output. This package doesn't change pins; they are finally recorded on this machine.

## Scope and local steps

Guarantees an inactive fiber after an explicit plugin.dispose; it doesn't claim to cover restart/_unload that keeps the uid, and doesn't change the public contract that the caller is responsible for closing handles. The three gates are real Cordis and JSON backend; only the I/O completion positions are controlled by the test gate, and no device stress results are falsely claimed.

On this machine, apply the final cumulative patches, record pins and build, then run the modules above; in a disposable profile, repeatedly start and stop the storage-domain-related plugins, checking normal data reads and remounting, with no late domain leftovers. Don't do destructive faults on the user's only data. Not compiled for Android, PRoot/real devices not run, no NDK installed, no UI changes.
