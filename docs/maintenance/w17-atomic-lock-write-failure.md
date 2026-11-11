# W17: cleanup on main lock write failure (redo of user package 549)

Fixed engine 0.2.2-rc.1, source patch base ce00763. The current cumulative K doesn't cover this problem: under a real Linux file size limit, the main lock's wx open succeeds, the PID write hits EFBIG, an empty lock is left behind, and subsequent calls time out. The fix only cleans up the main lock whose handle was obtained by this successful open; it doesn't take over pre-existing empty locks, live process locks or takeover claims.

## Implementation and differences from the old package

withFileLock uses open(wx,0600), with explicit writeFile/finally close; if writing or closing fails after obtaining the handle, this run's main lock is deleted and the error thrown. Errors without an obtained handle keep the original contention protocol. The earlier atomic-claim-write-failure already imports open, so the old 549's duplicate import hunk is deleted and the exact rc1 line numbers regenerated; the full 57-patch chain applies strictly. day-gate-worker also observes EEXIST from the real fs.open/fs.writeFile, keeping the midnight race test, without modifying the budget product.

## Commands and golden

At the project root: `DSH_PREFIX=<independent complete candidate prefix> node --test runtime/tests/atomic-claim-write-failure.test.mjs runtime/tests/atomic-lock-write-failure.test.mjs`.

`node --test runtime/media/dsh-media/test/budget-day-gate.test.js runtime/media/dsh-media/test/budget-ledger.test.js` (node_modules must resolve to the actual candidate prefix).

The new main lock's 5 cases: baseline 2 failed, 3 passed; candidate 5 passed; the original claim's 7 cases passed; media budget 26/26. The real EFBIG is triggered by a ulimit affecting only the child, stdout is a pipe, no simulated I/O, no real waits. Golden: after EFBIG, lock=ENOENT, operation=0; the successor succeeds once; pre-existing live locks and empty legacy locks are byte-for-byte unchanged.

After the full K prerequisites, the atomic module SHA256: 92b9d32bd271d1931bfff55a5d46996cbb691225ee911ee7f1483f35ae0916d4; candidate 000b8994abcbec4e01b2b714fe8c2a37e61670c52e7d3acaf40ec8d39f484dc7. Generation method: from the official rc1, apply the reviewed prerequisite diffs in lexicographic filename order, change the main lock loop, and generate the vendor diff with Python difflib.unified_diff(before.splitlines(True),after.splitlines(True),fromfile='a/node_modules/@deepseek-ai/dsh-atomic-write/lib/index.js',tofile='b/node_modules/@deepseek-ai/dsh-atomic-write/lib/index.js'). The source delivery is exported with git diff relative to the ce index; pins are recorded uniformly on this machine in the final order, and this package doesn't change pins.

## Boundaries and local steps

A close failure can override the write error, and an rm failure can override again; it isn't promised that every cleanup failure still deletes the lock. SIGKILL can't run cleanup, and the claim takeover protocol isn't addressed. Non-Linux real-ulimit cases are explicitly skipped, without falsely claiming cross-platform verification.

On this machine, first apply the final cumulative rc1 and record pins/build, then run the commands above; on an Android device, verify that configuration edits and the media budget save normally and concurrency doesn't double-commit. Don't apply ulimit or write bad locks in a real profile; fault injection only in a disposable Host directory. Not compiled for Android, PRoot/real devices not run, no NDK, no UI changes.
