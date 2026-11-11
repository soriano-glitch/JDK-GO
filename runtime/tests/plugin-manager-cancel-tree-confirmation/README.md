# Cancellation confirmation for the package process group it owns

This group of tests targets the service/POSIX path; it actually runs the rc4 `runCli()`, the formal HTTP RPC and real local processes. The package manager is a self-written controlled fixture that doesn't run pnpm, download any dependencies or access an external registry; `.invalid` addresses are only parameter and classification inputs. The tests are not proof of an Android/PRoot or full ABI runtime build.

## Preparation and commands

In the repository root, prepare a patched DSH 0.2.1-rc.4 prefix, in the same way as `install_dsh` and the patching step of `runtime/build-runtime.sh`:

1. Copy `runtime/locks/dsh-0.2.1-rc.4/package.json` and `package-lock.json` into a new empty directory (the prefix below) and run `npm ci --ignore-scripts --no-audit --no-fund` in it. build-runtime.sh additionally passes `--cpu`, `--os=linux`, `--libc=glibc` to choose the target ABI; when running this test on a Linux host, the host platform is fine.
2. `python3 -I runtime/lib/rtbuild.py patch-dsh --prefix /absolute/own/prefix --dsh-version 0.2.1-rc.4`. It applies the whole patch chain of `runtime/patches/` in filename order, and checks each file's SHA-256 before and after patching against `runtime/patches/pins.json`. The ones that change `dsh-plugin-manager` are `install-log-redaction.diff`, `plugin-manager-active-run-guard.diff` and this test's own `plugin-manager-cancel-tree-confirmation.diff`.

Don't accept files in an intermediate state of the patch chain by modifying pins or skipping verification. Repeating step 2 on a prefix that is already fully patched is idempotent.

```sh
DSH_PREFIX=/absolute/own/prefix node --test --test-isolation=none --test-reporter=tap runtime/tests/plugin-manager-cancel-tree.test.mjs
python runtime/tests/plugin-manager-cancel-tree-confirmation/run.py --prefix /absolute/own/prefix --out /absolute/own/results --port 39311
```

`--cases` can explicitly select any subset from the table. The runner needs Linux `/proc` and `prctl(PR_SET_CHILD_SUBREAPER)`. The port given by `--port` must be free (default 39311); other tests on the same machine must not occupy it at the same time. Don't point the test home at the user's real configuration.

## Golden scenarios

| Name | Result that must be observed |
| --- | --- |
| cooperative | The group is gone, both interfaces cancelled, both files restored, record and lock removed |
| term-resistant | Parent has exited, same-group descendants resist TERM; cancelled is returned only after the group disappears following the confirmed KILL, no gated late writes |
| stop-unconfirmed | Parent and child resist TERM, and only that group's KILL is blocked; cancel is an RPC error, install failed, the current files and run record are kept |
| nonzero | PM exit 17; stop confirmed, restored, no record leak |
| success-remove | Normal disabled install and formal remove both applied, no record leak in either operation |
| outer-not-bundle | primary exits normally while a background descendant is still alive; the outer not-bundle failure must first stop the group, then restore and release |
| success-background | An ordinary success keeps the original background behavior, doesn't actively kill normal background descendants, and releases the record after closing the cancel window |
| late-cancel | The real runPnpm has returned, and the test only defers the outer continuation; cancel still stops the background group it holds, then restores and releases |
| stop-unconfirmed-emit | When stopping fails, an install-log emit exception is additionally injected; the private stop fact still makes cancel an error and files are not restored |
| compat-primary-unconfirmed | An incompatible manifest appears only after primary installs, and descendants can't be stopped; internal restore isn't entered and repair isn't started |
| compat-repair-success | Repair is actually entered, the two files are already at their original values at startup, a new independent group takes over the record, and finally the incompatible install is failed |
| compat-repair-cancel | The repair's own group accepts cancel, and after descendants are confirmed stopped both interfaces cancelled, restored and released |
| compat-repair-unconfirmed | Repair parent and child are still alive, cancel errors, install failed; no second restore, and the successor repair record isn't deleted |
| compat-repair-timeout | Repair keeps emitting heartbeats and still triggers the original absolute timeout; after the group is confirmed stopped, install failed, restored and released |
| registry-retry | Two controlled adds; before the second starts both files are restored and the first group is gone; the second succeeds applied |

## Evidence boundaries

The first two unconfirmed faults explicitly block KILL for the own group; they can't be used to claim natural D state, permission faults or real operating-system signal loss. The differences among EPERM/EIO/ESRCH are covered by unit injection in the production helper. late-cancel puts a wait gate where the real service instance's runPnpm returns; the emit scenario injects an exception only for the stop-failure log. These test gates are all in the observer/launcher, not written into product code.

All process cleanup first checks PID/startTicks/PGID and handles only identities recorded in this run; the child reaper waitpids only specified own orphans, doesn't use waitpid(-1) and doesn't steal the exit status of the Host Popen. A Z state still counts as the group existing, and disappearance can be asserted only after actual reaping completes. Each run's `evidence/` under `--out` contains the HTTP envelopes, before/after files, SHAs of the modules actually loaded, signal injection and cleanup; the Host raw logs with login tokens stay only in each case's `private/` directory and aren't copied into `evidence/`.

The durations in the test report are observations from this run, not an end-to-end SLA. The product guard uses the existing 5-second wait value for each stage; scheduling, file IO, error emission and other final handling don't get a uniform time limit from it. Normal successful background groups, descendants detached from that process group, system-level races from PID/PGID reassignment, and the different semantics of CLI/Windows are not claimed to be comprehensively solved by this fix.
