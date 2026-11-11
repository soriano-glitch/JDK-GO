# M0 headless · rc4 run notes

Two real local mock sessions (one with a parameter header, one ordinary Chinese) once actually passed in the environment below; for the overall verification scope and what isn't covered, see ../../VERIFICATION.md. The test plugin plugin.mjs is loaded only in headless and not installed into a production profile.

Before re-running, note: run.mjs pins the SHA-256 of ten production files. After the recording, src/header.js, src/config.js and package.json were modified (the parameter header was aligned to the final spec, etc.) and no longer match the pins, so the runner refuses to run. These changes must first be reviewed and the pins updated, with new results recorded under the new identity; the two existing records correspond to the files before the changes.

## Reproducible environment

DSH comes from a standalone npm test prefix. run.mjs requires the SHA-256 of the prefix root's package-lock.json to be 8f1f2d0363e8c481ef1d163be1f263ba8089b378f9a2f99dd02707ce571fb68c (EXPECTED_TEST_LOCK). This lock is based on runtime/locks/dsh-0.2.1-rc.4/package-lock.json, keeps all its 628 non-root records, and only appends image-size 2.0.2 and @deepseek-ai/dsh-llm-mock-server 0.2.1-rc.4 (direct dependencies in dependencies.json). The test prefix does not apply runtime/patches; the conclusions concern the original npm rc4, and don't represent the patched mobile rootfs.

Missing input: this test lock and its package.json are not checked in. Without it, run.mjs's lock verification won't pass; to build it yourself, generate it from the baseline lock per the rules above, replace EXPECTED_TEST_LOCK with the new lock's SHA, and record results under the new identity.

Create a new isolated prefix, put package.json and package-lock.json at the prefix root, and run npm ci --ignore-scripts --no-audit --no-fund (add --offline if there is a cache). Don't re-resolve with npm install and implicitly allow transitive dependency upgrades. Point the product directory's node_modules at this prefix/node_modules; create the symlink only if the target doesn't exist, without overwriting an existing dependency tree. Don't create a standalone node_modules in test/headless.

Run from runtime/media/dsh-media:

    TZ=Asia/Shanghai node --test test/*.test.js
    TZ=Asia/Shanghai node test/headless/run.mjs --out /absolute/new-private-result

out must be a non-existent absolute path with an existing parent directory. The runner refuses to overwrite; Node 22.19 or later 22.x or 24 or later is expected, and the tests actually used v24.22.1. The key engine files, the exact lock, the ten production files and the parent/child module instances are all checked. If the engine already has patches, don't delete the pins to pass the test; first review the actual post-patch image and set a separate identity for that tree.

## The path actually executed

The public CLI dsh headless --patch <file> --json <task>, with an independent home/workspace for each case. credentials-local and this run's fixed fake credentials are restored; the official llm-deepseek-api-key connects only to the local official mock. The script fixes tool_call_success→success and isn't a real model decision. The production Config still uses an HTTPS placeholder, and only the test plugin's in-process generate seam routes to this run's fixed loopback image endpoint. The service address and transport don't come from model parameters or user settings.

The first run uses the formatter to generate the header; the second, ordinary Chinese, must give parseGenerationMessage=null. Both records were made before the parameter header grammar was finalized, and prove the real session execution chain under the grammar candidate of that time; the finalized grammar is checked against the shared golden by test/header.test.js, and headless hasn't been re-recorded for the final grammar yet.

Session post-commit events are each serialized to JSON as is, with seq running continuously from 0. flush uses a queued checkpoint so that the check isn't preempted inside another observer's synchronous flush; it guarantees at least the requested prefix has been captured. The runtime-context user/message is kept, but only source.kind=user counts as real user input. All events after the physical V4 log header equal the captures object by object.

The normal success path must exit 0, have close observed, turn/end completed, one user input/tool call/successful media result, a correct request body, original bytes/size, and Host index and Session consistent, and the fake credentials must not enter events/stdout/stderr/index. Failing any assertion fails the run, and no success summary is created.

## Artifacts and meaning

- stdout.projection.jsonl is only the CLI's display projection and isn't used as the app's original fixture.
- capture/session-events.jsonl is the complete logical events; capture-receipt and loaded-modules record identity.
- durable-session.v4.jsonl copies the physical file as is, aligned with all logical events.
- wire-audit records only request bodies and mock behavior, not authentication headers.
- verified/summary appears only after all assertions of this case / both cases succeed; failure/cleanup/process keep the real failure and shutdown facts.
- The actual originals are kept in the independent workspace; absolute paths in the fixture are not rewritten, and consuming tests should provide their own file provider mapping.
- live_image.jsonl and live_image_plain.jsonl are the original logical logs of the two Sessions respectively and can't be concatenated; no media events were hand-written.

The two primary records each contain 23 events, 2 local LLM requests and 1 local image request. They only prove the actual DSH scheduling/tool/storage chain; real model understanding, provider fees/permissions, production networks, the app and the mobile runtime are not proven by them.

## Failure and process cleanup

On reaching the 90-second limit, TERM is sent first, with KILL after 5 seconds; if there is still no close 10 seconds after stopping, the case fails and records the PID and kill diagnostics, closes the mock network and doesn't move on to the next case. A kill return isn't taken as the process having ended. In successful actual runs, every child was observed to close and the mock was closed.

The early nine pure-JS fault models remain only historical models. OS-level fault injections such as spawn synchronous exceptions, asynchronous error/close, missing pipes, kill failures, multiple errors, exit with stdio not closed and close timeouts have not all been run and are not within the current PASS coverage.
