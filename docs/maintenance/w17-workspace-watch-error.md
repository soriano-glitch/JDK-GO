# The file observation stream doesn't swallow watcher errors during metadata reads

## Contract and cause

When workspaceFiles/changes waits on fs.stat after ready, the watcher may report an I/O error. The existing ChangeFollower.fail saves the error and aborts the signal; the stat path turns the abort into undefined, after which follow returns directly, skipping the error propagation at the end of the read iterator, so the client receives a normal end.

This change only checks for and throws the saved watcher error first after the live metadata await, before handling ordinary cancellation; a closed follower ignores a late fail, and the identity of the first fault is kept. Normal user cancellation and service release are not turned into faults; the initialization watch-unsupported wrapping is kept. No changes to URLs, permissions, file contents, UI or protocol fields.

## Evidence and re-running

Uses the real rc1 Cordis, LocalFileSystem, WorkspaceFiles and real directories/files/watchers; the test only controls the metadata await boundary and feeds a synthetic EIO into the actually registered watcher callback, without faking business results or waiting on the real clock. This test doesn't claim to have induced a kernel watcher error on a physical device.

```sh
DSH_PREFIX=/absolute/patched-rc1 node --test runtime/tests/workspace-watch-error.test.mjs runtime/tests/workspace-observation-queue.test.mjs runtime/tests/workspace-lifecycle.test.mjs
```

The 6 new cases are 4 pass / 2 fail on the current cumulative baseline, and the candidate's three related modules are 16/16. The two failures cover stat honoring cancellation and still returning successfully; the controls cover late errors after user cancellation/service release, the original identity of an idle fault, the setup error code and a single unwatch. Uses a Promise gate, not sleep. Not compiled for Android.

## Applying and generating

The source patch is relative to ce00763; the new vendor diff is sorted by filename and appended after this round's 57-item K+606/607 rc1 chain, so 58 apply strictly, and the output is byte-for-byte identical to the module under test. The standalone source patch can be applied to ce, but running it requires first using this round's fixed 0.2.2-rc.1 cumulative upgrade; it can't be used as an rc4 runtime upgrade package. Pins are recorded on this machine per the final build chain; this package doesn't modify them.

The vendor diff uses Python difflib.unified_diff to compare dsh-api-workspace-files/lib/index.js from the strict 57 chain with the candidate, with fromfile/tofile a/b/node_modules/@deepseek-ai/dsh-api-workspace-files/lib/index.js. The source export selects only this diff, this test and this document; the existing observation queue patch is not overwritten. No golden updates needed.

Real-device re-check: open file observation normally on this machine or a remote one; editing the target should keep refreshing; after cancelling/switching sessions the observation should be released with no error prompt. Kernel watcher errors can only be triggered in a controllable test environment; deleting real user files is not used for fault injection. This fix doesn't change the existing cancellation and reconnection policy.
