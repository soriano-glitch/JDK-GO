# Local skill installation: main isolate, native serial transaction and write permit

## Purpose and boundaries

`RootGate` keeps `UiSkillAutoInstaller` alive. Each time the local kernel is ready, the app maintains the three built-in skills in the order UI → plugin → guide. The old implementation's `installUiSkill` returned a Future, but its body's exists/read/create/flush/rename were all synchronous, executed file by file on the Flutter main isolate.

The production automatic entry now calls the private `dsh/runtime` channel, with the file transaction executed by `RuntimeController`'s same worker. That worker also carries install/reset/activateRootfs, so an old transaction won't keep committing onto a new root the native side has already replaced. The original `installUiSkill` remains a synchronous reference helper for an explicit exclusive directory, used by file/SSH and other tests; a missing plugin, unknown generation, rejection or error never triggers a synchronous production fallback.

This change doesn't shorten engine RPC, asset reads or the disk time itself, and doesn't change A5's startup, PRoot/direct selection or process ownership logic. The synchronous transactions of config files and large JSON decoding are not modified by this patch.

## Private permit and call contract

`RuntimeStatus.managedSkillGeneration` is an optional positive integer. Each new skill-write permit on the native side uses a monotonic generation; it is not `runGen` and not authorization for general RPC.

- ready binds the real `runGen`, token and the current Flutter engine attachment.
- A normal re-report of the same ready keeps the same permit, avoiding repeated installs.
- A stop request retires the skill permit immediately, without waiting for the Service to receive the asynchronous ACTION_STOP; phase changes from install/reset/exit/new run also retire it.
- engine detach retires the owner; a new attachment retires the old owner and, if still ready, issues a new permit generation. An old handler can't use the new permit; even if an old wire reaches a new handler, the old generation can't borrow the new owner.
- The permit is captured by Dart after being passed back from native state; the latest generation can't be obtained for an old request when it arrives/executes. A token reuse A→B→A can't restore an old permit either.
- Generations aren't persisted across app process death; the old process's worker, Flutter messenger and requests all end with the process.

Within the same short lock, the Gate separately stores the run fact actually confirmed by `onReady` and the attachment's write scope. When the first attachment is later than ready, or a replacement attachment happens when ready has been confirmed but `RUNNING` hasn't been published yet, a new permit for the current owner is issued from the still-valid fact, with no need for another ready or another attachment. detach retires only that owner; stop / retire clears both the run fact and the scope, and a later attachment can't restore write rights for a retired run. The Controller no longer reads phase / token separately and then re-reports ready for the attachment.

The lock order is still the existing Controller monitor → Gate monitor; the Gate has no IO, callbacks or calls back into the Controller, and cancelling the old owner's queued work happens after the Gate returns. The attachment doesn't wait for the existing log file operations inside `onReady`. The `STARTING` phase may record the permit first, but installation is still admitted jointly by the Controller's `RUNNING`, runGen, stopGen, resetting, token and scope conditions; the permit is not a substitute for a startup-complete marker.

| Method | Input | Reply |
|---|---|---|
| `installManagedSkill` | `requestId`, `expectedRoot`, `expectedToken`, `expectedGeneration`, fixed `name`, `files` | `result`, `current`, fixed `reason` |
| `cancelManagedSkill` | exact `requestId` | Empty; cancels the permit, no rollback is claimed |

`result` is `installed` / `updated` / `unchanged` / `userOwned` / `noHome`, or null for an unfinished transaction. `current` is re-verified when the reply is actually delivered; what has already been written isn't disguised as not having happened because of a late retirement. Dart publishes only a result where the current Ref/build, run state and permit are all consistent.

`reason` is a fixed value such as `invalid` / `stale` / `duplicate` / `cancelled` / `io`; it contains no token, file content or system error text. A missing or abnormal expectedGeneration is rejected on the native side; an older version without a permit doesn't detour to the old helper either. The input token is used only for private comparison and must never be output to logs.

## Boundedness and queuing

Each Dart build captures the Ref, bridge, resolver and loaders. A drain has at most one executing batch and one latest pending; a running uncancellable resolver/loader must finish before the latest pending is processed, and it isn't claimed that underlying asset IO can be aborted. A new ready replaces the pending item; after the old await returns, it is validated step by step and neither writes to the new root nor rolls back the new state.

Natively, the whole controller has at most one active and one latest pending. After cancelling the active one it still occupies its work slot until the physical IO exits; repeated cancellation can't pile up unbounded file tasks on the Executor. When a pending item is replaced, the old callback is ended exactly. The callback keeps only a lightweight permit record, and a cancelled pending payload isn't held by the reply closure. Cancels/replacements initiated on the main thread reply directly; worker results return to the main thread.

| Item | Bound/rule |
|---|---|
| bundle names | dsh-go-ui / dsh-go-plugin / dsh-go-guide |
| File count | 64 |
| Per-file UTF-8 | 512 KiB |
| Total UTF-8 | 1 MiB; exceeding it rejects the whole request |
| main pre-check | String type, count, UTF-16 length upper bound; no encoding, no disk reads |
| Relative path | At most 512 characters, ASCII-safe segments, no absolute path, `.`, `..` or empty segments |
| requestId | Non-empty, at most 200 characters; unique within the owner |
| root/token | At most 4096 characters each, token not output |

MethodCodec encoding/decoding still has synchronous cost. The current three assets total 50 files, 375727 UTF-8 bytes; this is only a fact of the version at measurement time, not a permanent size for future assets. The code validates against fixed budgets and doesn't truncate files or half a skill.

## File transaction

1. Inside the worker, verify the canonical path of expectedRoot; no canonical file access on the Android main thread.
2. Strictly encode UTF-8 and check the total bytes; confirm the input SKILL.md's frontmatter has the managed marker.
3. If the local `.dsh` doesn't exist, noHome; if an existing SKILL.md is unreadable, has abnormal UTF-8, exceeds the read bound or has no managed marker, userOwned.
4. Compare by original text, and don't write on a match. Reading keeps Dart's leading-BOM handling; file comparison is bounded.
5. All non-SKILL.md files are committed first, with the current permit verified before each commit; temporary files are flushed and then atomically moved in the same directory; SKILL.md last.
6. Cancellation/errors clean up this run's temporary files. A half-finished new install without a committed SKILL.md doesn't appear as a complete skill; later normal runs can repair it.

A single file-system operation already in progress may complete; cancellation isn't a transaction rollback, and no hard disk timeout is promised. During an upgrade, a skill with an existing SKILL.md may temporarily see file-by-file updates, which is the granularity of the original implementation. Native rootfs activation can't interleave with the writer, but these path checks aren't treated as a file-system sandbox against another process maliciously changing symlinks at the same time.

## Measurement, tests and device boundaries

On the desktop Flutter test main isolate, the old synchronous transaction was run with real assets and a real temporary disk: the first-install queued event median was about 116 ms, a managed upgrade about 80 ms, and all 8 events of the various sample types came after the whole batch completed. Shared host load wasn't isolated, and frame-time/startup gains on Android are not extrapolated.

The new path is verified separately: the real RuntimeBridge/MethodCodec carrying the actual bundle, with events deliverable while a controlled native reply is unfinished; real buttons clickable while the transaction is unfinished; pure-Kotlin real files/threads and actual activateRootfs serialization; and real API compilation against Android 36/the Flutter embedding. Together these support the structural removal of main-isolate IO, but can't replace performance measurement on a real Android device.

Device verification should record the same model/runtime version/hot-cold state, measuring first install, no change, managed upgrade and user takeover; actual scrolling/back during installation, stop→ready, reset/upgrade, Activity rotation and Flutter engine rebuilds; and check SKILL being last, bytes/mtime, the result generation and no leftover temporary files. Never record the token. Device paths not run must stay unverified.
