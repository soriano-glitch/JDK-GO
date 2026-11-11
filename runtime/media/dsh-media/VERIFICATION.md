# Media verification and reproduction

## 0.3.0 compatibility integration — 2026-11-07

This section is based on an isolated worktree at the latest main baseline 3a91fab9, and doesn't reuse the old worktree's conclusion of 320 passing. The fixes and tests already on main for owner teardown, staging cleanup and storage error classification are kept; production runtime locks, patches and media execution code were not changed.

- DSH 0.2.2-rc.1: the complete Node suite 325 passed, with 4 DSH_PREFIX-gated cases skipped; owner lifecycle was also run 4/4 passing (no skips) with the real rc.1 service. headless image and video both passed, with 27/38 events respectively.
- DSH 0.2.1-rc.4: the complete Node suite 325 passed, with 4 DSH_PREFIX cases that apply only to rc.1 skipped; headless image and video both passed, with 27/38 events respectively.
- The test prefixes for the two versions are derived from each one's existing runtime lock, adding only the mock-server and image-size at exact SRI; compatibility.test compares all non-root records of the original lock one by one and verifies the positive/negative version gates of the real host compatibility evaluator.
- headless waits for the actual video job to settle before fetching the result; rc.1 keeps the explicit native executor on / PTC executor off, and only rc.4 uses the old tools.mode configuration.
- Linux arm64 / Android PRoot, Node v24.22.1, local HTTP/LLM mocks, with no real paid provider, app installation, media viewer or market release verification.

Reproduction: prepare.mjs defaults to 0.2.2-rc.1; for the older version add --dsh-version 0.2.1-rc.4. Run npm ci --ignore-scripts separately for each version, switching the source's node_modules test link serially. Don't omit the current platform's native loader/system optional binding. The real owner lifecycle case is run separately with DSH_PREFIX set to the rc.1 prefix, and a skip can't be written up as a pass.

## History: 0.2.0 verification and reproduction

Environment: Linux, Node v24.21.0, DSH npm `0.2.1-rc.4`, `TZ=Asia/Shanghai`. All 628 non-root records of the existing rc.4 runtime lock are kept, adding only `dsh-llm-mock-server@0.2.1-rc.4` and `image-size@2.0.2` with exact integrity; jobs of other versions are not mixed in.

## Reproduction

Run from the repository root; `/absolute/media-deps` and `/absolute/media-evidence` must be new directories. The install step doesn't run npm lifecycle scripts; when the actual workspace's node_modules already exists, don't overwrite it, and verify its source first.

```sh
node runtime/media/dsh-media/test/headless-v2/prepare.mjs --dsh-version 0.2.1-rc.4 --out /absolute/media-deps
npm ci --ignore-scripts --prefix /absolute/media-deps
ln -s /absolute/media-deps/node_modules runtime/media/dsh-media/node_modules
TZ=Asia/Shanghai node --test runtime/media/dsh-media/test/*.test.js
TZ=Asia/Shanghai node runtime/media/dsh-media/test/headless-v2/run.mjs --out /absolute/media-evidence
```

On a shared development machine, run tests / headless serially and give each workspace its own TMPDIR. The prepare script writes only to the standalone directory and doesn't re-resolve or modify the runtime lock; the output test-inputs.json records the baseline hash and the number of kept entries.

## What was executed and the scope of evidence

- Full Node suite: **306 / 306 passed**, including the existing M0, budget ledger, HTTP / file-safety regressions and the new provider / jobs wiring cases.
- Local real HTTP: images and edits for OpenAI, Ark, Bailian and SiliconFlow; text-to-video / image-to-video for three vendors, actual DELETE / POST cancellation, not cancellable while running, failure, submit timeout, query timeout. A socket disconnect after the POST is accepted submits only once and stays submission_unknown. Downloads keep the original bytes and don't carry the service key.
- Security boundaries: exact reference-file approval, rejection of identity replacement after approval, FIFO rejection, metadata inflated by JSON escaping rejected before the POST, budget across requests, calling video under the default image service, and original-session recovery. A real subprocess does `process.exit(77)` after publishing the MP4 and before writing the index, then a new process state resumes publishing under a new filename, the old file is kept, and provider POSTs are zero.
- The real unmodified rc.4 public CLI: one actual Session each for image and video, going through the production admission / approval / ledger; the mock seam replaces only the HTTP target, and doesn't replace generate or skip cost approval. Video uses the real jobs.start, the completed producer state and the tool-jobs notification, then actually executes get_media_result, with the initial and final rid/job consistent.

The headless output contains identity.json (hashes of Node, CLI, source and test lock), summary.json, per-case wire-audit.json, raw Session events, the physical V4 JSONL and verified.json. It verifies continuous seq, raw events matching persisted events object by object, normal exit, no fake-credential echo, and output matching fixture bytes. Logs keep the absolute path of the private test workspace, which isn't rewritten into a phone path, and isn't copied as the app's live fixture.

A single headless rc.4 run doesn't automatically wait for ordinary jobs. The test makes the second local mock LLM response wait for the download to finish before ending the current turn, ensuring the real notification enters the still-alive Host; it doesn't call jobs.wait / job_output(wait:true), which would mark awaited and suppress the notification. This verifies the real Host wiring and doesn't prove that an arbitrary one-shot headless process will wait on its own until the video ends.

The video fixture is a locally synthesized 32×24 blue 1-second H.264 MP4 with no third-party material; the generation command:

```sh
ffmpeg -f lavfi -i color=c=blue:s=32x24:r=1:d=1 -c:v libx264 -pix_fmt yuv420p -movflags +faststart synthetic.mp4
base64 -w0 synthetic.mp4 > runtime/media/dsh-media/test/fixtures/video.base64
```

## Not verified / intentional limits

No real paid service was called; the interface fields come from the official materials listed in data/models.json, which doesn't prove account permissions or actual image quality. Not executed: the full Android / PRoot / app media chain, real model language understanding, real settings form write-and-reload, cross-Host deployment. The old test/headless M0 verification materials are historical records only; the current entry is headless-v2.

Current prices are unknown, and per-request approval plus local reservations can't guarantee the provider bill won't exceed ¥20; no refunds are inferred. After a Host restart the original session must explicitly resume_media, and tasks aren't rebuilt automatically; an uncertain submission without a task ID can't be recovered automatically. Recovery uses new names to avoid overwriting half-published leftovers, and old files and .pending directories produced by a crash are not deleted automatically. MP4s are checked only for format and actual header metadata, and decoding on every device isn't guaranteed. Ark/Bailian confirm cancellation only while queued, and SiliconFlow provides no cancellation.

npm pack completed a local content check and an unpack import. Before publishing on 2026-10-31 and after switching to the backup organization, the whole suite under the exact rc.4 dependencies passed 306/306. The old 0.2.0 package's staged download matched byte for byte; a direct publish with the new token returned 409 because the staged version was occupied, and the normal update was `@ccch1mneyyy/dsh-media@0.2.1`. The final tarball's 19 files match the source, at 48,019 bytes; compared with the 306-passing package, only the package.json version field changed, with no runtime code changes. The historical headless's JS source, CLI, Node and test lock identities all matched, and it wasn't re-run.

The previous token's direct-publish restriction was finally identified as `E_STAGE_REQUIRED`, not that every npm publish must have manual approval. The latest token submitted 0.2.1 and got HTTP 202; after 2026-10-30 19:55:51 UTC the anonymous exact-version query and the public tarball download both returned 200, and the downloaded 48,019-byte package fully matched the local SHA256 and the registry SHA512, confirming the official version can be downloaded. Device installation, the Android/PRoot full media chain and real paid generation have gained no new verification; see PUBLISH.md and the market acceptance record.

## Public package installation and profile composition (0.2.1)

A brand-new private consumer, with a separate empty npmrc, actually installed the exact `@ccch1mneyyy/dsh-media@0.2.1` from the public registry, using `--ignore-scripts --legacy-peer-deps`, installing 6 ordinary dependencies. The 10 Host peers were checked one by one at exact versions and reused the existing rc.4 dependencies, and the tarball URL and SHA512 recorded in the install lock equal the officially published artifact.

Through real bare-specifier imports of the three exports `. / ./config / ./package.json`; the installed package's `cordis.patch.yml` points to the official new scope, and the entry ID is still `dsh-media`. The unmodified rc.4 CLI ran `--dump-config` in a separate `DSH_HOME` and successfully composed `dsh-media` using the installed package's original patch. This is an actual npm install, export loading and profile patch composition verification, and doesn't claim actual mounted activation, app installation or new media generation verification.

The market's real npm scan and 24 tests passed, with all 5 packages built; Pages and the Worker's two files were both HTTP 200 online, Worker `X-Market-Stale:false`, the official format 1 parser and the actual Worker validator both passed, the media official entry is official / 0.2.1, and the SRI matches npm. The independently verified `/p/%40ccch1mneyyy%2Fdsh-media` share page is 200, containing the Chinese title, 0.2.1 and the correct `dshgo://` deep link. The in-app entry is Settings → Plugins → Plugin market → Official; when not installed, Settings → Images and video also offers an install button for the current host. This confirms the online discovery path and the existing UI wiring, and no real tap-to-install was performed on a phone.
