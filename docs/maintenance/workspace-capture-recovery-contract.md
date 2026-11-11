# File change records: a failed content copy must not take part in later deduplication

Refs W17-B, no corresponding public issue number. Base 63e255fab5cb9d817af30b631c3643ccce8e9231, DSH 0.2.2-rc.1. Changes runtimeVersion. Not compiled for Android; ARM, PRoot and phone storage faults not verified.

## Reachable problem

Before a file tool modifies a file, the official `dsh-workspace-changes` names a temporary copy by the SHA-1 of the original file's complete bytes. The original implementation wrote that name directly with `writeFile(path, bytes, {flag: "wx"})`; on EEXIST it treated it as an existing complete copy. An actual write failing partway can leave an incomplete file whose name is still the digest of the complete content. When a later turn of that Session captures the same content again, EEXIST makes this leftover accepted, and the public summary/diff then uses the truncated old content.

These copies live in a temporary directory exclusive to each TurnRecorder, serving only the Session change records in the current Host, and are deleted when the Session is released. This problem affects change summaries and comparison content; the tests additionally verify verbatim that the user file and the persisted session log are intact, and the display error isn't exaggerated into the user's source file being truncated.

## Minimal change and ownership

First explicitly `open(path, "wx")`. Only when this run's exclusively created handle is obtained successfully does it write and close; when writing or closing is rejected, after attempting to close the handle, it removes the copy newly created by this run, then propagates the failure. EEXIST is handled only in the open stage; an existing copy keeps the original dedup behavior. A cleanup failure still propagates outward; a failed copy can't be returned as a success.

Both internal call sites of `captureFile` are inside the `TurnRecorder.enqueue` task chain: the capture task before the tool, and the record task at turn end; the record loop awaits item by item. `scratchDir()` synchronously saves a single mkdtemp Promise, and each recorder uses an exclusive directory. dispose first aborts the lifecycle, waits for the task chain, then deletes the directory. So the module's normal internal writes have no parallel writer for the same copy; a file that errors after a successful exclusive open is cleaned up by that task. EEXIST in the open stage doesn't enter the cleanup branch.

The digest algorithm, file naming, public RPC, change ordering, file count and byte budget are unchanged; no new dependencies, configuration, fsync or cache. The write mechanism for the user's original files is unchanged. Cleanup targets only the temporary copy exclusively created by this run, and ownership isn't inferred by checking existence beforehand.

## Real verification entry point

Run from a repository with the patch applied and the runtime prefix prepared:

```sh
DSH_PREFIX=/absolute/prepared-prefix DSH_EVIDENCE_DIR=/absolute/new-evidence \
  node runtime/tests/workspace-capture-recovery-live.mjs
```

This manual live test needs Linux, Python's resource.prlimit and the real DSH CLI; it isn't added to the ordinary CI test glob and doesn't require root. The parent process changes only the soft file size limit of the Host child process it starts, leaving the hard limit unchanged; the scope surrounds the first official file tool's real capture write, and finally restores the original limit immediately. No disk filling, global quota changes, replaced I/O returns or constructed private producers.

Three fixed scenarios: the first capture of a 2048-byte/128-line file hits a 256-byte soft limit and then recovers; a 128-byte file completes normally under the same limit; a 2048-byte file without changing the original limit reuses the existing copy in the next turn. Each scenario has two turns, six requests to its own loopback model protocol and four successful official read/write calls, with results finally observed through the public workspaceChanges.summary/diff. The real SessionController, Agent and file services take part; synthetic model replies are not called external model verification.

Golden: the fault still produces the original EFBIG warning, a failed capture leaves no incomplete copy, and after recapture in the next turn the diff keeps the complete 128 lines; the two successful scenarios keep the complete original and the modified body; the user file is verbatim correct; the validated persisted log read via flush and a real read handle deep-equals the live events; the soft limit is restored to the original value. The Host is wound down by the fixture with SIGTERM in finally, and the driver's exit code is recorded separately.

The known local subprocess containment hint is allowed only with its exact original text and must appear before the first capture; it doesn't change the process isolation settings or ignore other runtime failures. Other system faults such as close and delete only describe the source handling boundaries; this file size limit experiment isn't claimed to cover those faults.

## Device check

After deploying through the normal build process, complete two reads and modifications on your own ordinary file, and check the change card and the complete comparison line count. If this machine has a controlled storage-fault test environment of your own, also verify once that after a record copy write fails, the next turn recovers the complete comparison; don't fill the user's device or change global storage limits. Without such a facility, mark the device fault recovery gate as not run. Reverting this runtime diff and the related tests and docs restores the original behavior.
