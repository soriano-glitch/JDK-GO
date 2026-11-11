# Review verdict

**Verdict**: Merge with conditions (the source fixes are done; real-device cross-network acceptance is still needed before release).
**Mode**: Review; **Target**: this round's changes to Remote connection release, IPv6, connection details and compact history.
**First-round baseline**: local `f769193edbb57f7e1c9f8320e5f3989ac6ddbe84` + this round's worktree.
**Submission integration baseline**: integrated first on `origin/main` at `62241f40e15a256c17e066c3900226c585df82bc`, then keeping the mainline's new test isolation fix, fast-forwarded to `ccdcb20479a823b84123bcfbc88702fd6fd08ae3`. Only this round's selected hunks were ported, regenerated and verified in an isolated worktree; the whole old branch was not merged, and the mainline's newly added account restore/refresh owner fence, HTTP late-request cancellation and response decoding fixes were not overwritten.
**Trust level**: trusted-local. The worktree already had many other modifications at the start; others' changes were not reverted. After this round's source fixes, the user explicitly asked to commit and merge into main, so a dedicated commit was prepared in an isolated worktree; no APK release.

## Implementation and boundaries

- WebRTC: when native close throws, dispose is still executed; concurrent releases reuse the same Future; a late DataChannel is closed proactively and no longer goes on to generate or apply an offer; transport-layer fail/abort doesn't close the peer repeatedly, and a synchronous close throwing doesn't skip Control cleanup. Asynchronous teardown is kept, so an invalid native call can't block the Relay fallback.
- IPv6: HTTP self-hosted loopback, ULA `fc00::/7` and link-local `fe80::/10` are recognized by address bytes; public addresses still require HTTPS. The LAN/P2P classification of expanded loopback and the whole link-local range was corrected. "Address allowed" is not written as "link surely reachable", and IPv4 is not forced.
- Connection details: shows the IP version and UDP/TCP of the phone/host on the actually selected ICE pair, keeping the path, time, RTT and fallback reason. With no address or hidden by mDNS it stays unknown; with multiple nominated candidates and no explicit selection it doesn't guess; it is cleared on disconnect, and Relay doesn't borrow old ICE information. Raw IPs, SDP and credentials are not stored or displayed.
- Compact history: off by default, with the setting on the remote hosts page. Only a Host supporting `remote.history.compact.v1` receives the encrypted `remote.history.configure`; the `{compact:boolean}` echo is strictly verified, and before configuration succeeds the session isn't exposed and no business stream is opened. An old Host doesn't receive this RPC, and the client doesn't delete events or change seq.
- A setting change affects only a new DshClient: it takes effect after switching hosts and connecting back, or restarting the app. Automatic reconnects of the same client pin the mode negotiated the first time; if it was initially full and the capability appears later it is still configured false, and if compact and the capability is lost it returns a non-retryable `HISTORY_MODE_CHANGED` requiring a re-selection of the host, to avoid mixing history caches. Calls with side effects are not replayed.

Protocol basis: [upstream §17](https://github.com/liguobao/ds-harness-remote/blob/479b94341c0d0de63846f21d0fcca26997d158d1/docs/protocol.md#17-capability). The Host reduces history tool arguments and output without changing the body, the live stream, approvals or the host's raw records; it isn't guaranteed to reduce the Host's cost of reading history. This round didn't copy or modify the Host's compression algorithm.

## Findings

No unresolved blocking code findings in this round's scope. Independent review raised these, now fixed:

1. Pinning only the user preference still switched the actual mode when the Host's capability came and went, mixing the existing transcript cache; it now pins the first effective mode, with a capability-change test added.
2. When transport selection information is missing, taking any old nominated pair would misreport IP/protocol/latency; it now prefers the authoritative selection identifier, allowing only a single successful nomination as a compatibility fallback, and with multiple candidates it stays unknown.

A Behavior: failures, late arrivals, reconnects, cache mode and selected candidate are all covered. B Contract: the outer RPC, capability negotiation, strict echo, Chinese/English and guide generation are consistent. C Security: public HTTPS restriction, credentials and IPs don't leak, no production configuration changes. D Collaboration: write domains were separated and the Lead reviewed the diff; no PR was created. E Scope: no cleanup of other worktrees was included, and the selected-pair judgment is centralized in the same private entry.

## Clarifying questions

- **Q1**: Whether the coturn 486 in the screenshot was caused by the client is still not located. The current local diagnostics correspond to local/connected, not that remote connection; there's no allocation source, count or release record for the same time period. Code regressions can't prove the online TURN allocation was released, nor can the asynchronous teardown itself be judged a leak.
- **Q2**: When additionally running the existing drawer IdentityBar tests, 10 passed and 3 failed on the 320dp 1.0/1.5/2.0 font-scale semantic-label assertions (couldn't find "Network details"). The failure happens before opening the details; this round didn't modify the drawer implementation or tests. The earlier worktree was not independently restored to verify the cause, so it isn't claimed to be an existing defect, and nobody else's modifications were overwritten to fix it.

## Validation record (first-round old workspace)

Environment: Linux arm64, Dart 3.13.5, matching Flutter arm64 tools/test engine. These widget tests were actually run, not skipped because of architecture. The missing Noto CJK test font was downloaded from the [official repository](https://github.com/notofonts/noto-cjk) to a temporary directory and used through `DSH_TEST_FONT_DIR`, not installed on the system.

All final records are based on the local Head above + the uncommitted worktree. Dart's first test run automatically changed the originally clean dependency lock file; only that generated diff was restored, and `PUB_HOSTED_URL=https://pub.flutter-io.cn dart pub get --enforce-lockfile` successfully restored the original locked dependencies, after which Remote's analysis and 384 tests were fully re-run and passed. No dependency upgrade or mirror change was kept.

| Check | Result | Coverage / obstacle |
|---|---|---|
| Remote package `dart analyze` | exit 0, no issues | Whole package |
| Remote package `dart test --concurrency 2 --reporter expanded` | exit 0, 384 passed, 4 skipped | The 4 live items lack remote test environment configuration; production credentials not used |
| App focused 4-file tests | exit 0, 37 passed | Native peer cleanup, connection details, compact preference, relay backend |
| App `flutter analyze --no-pub` | exit 0, no issues | Re-run on the whole project passed after fixing two infos in the first round |
| Extra drawer tests | exit 1, 10 passed, 3 failed | See Q2, can't be written up as all green |
| l10n merge/check | exit 0, 49 parts / 5494 keys | Generated after modifying ARB inputs, not hand-edited artifacts |
| guide sync/check | exit 0, 26 files | Chinese and English guides and bundled copies in sync |
| `git diff --check` | exit 0 | No whitespace errors |

Final App commands (from the app directory, invoked through the current architecture's Flutter tool entry):

```sh
flutter test --no-pub --concurrency 2 \
  test/remote/webrtc_peer_cleanup_test.dart \
  test/remote/remote_network_details_test.dart \
  test/remote/compact_history_setting_test.dart \
  test/remote/relay_backend_test.dart
flutter analyze --no-pub
```

Failure records along the way are not hidden: the first Flutter configuration didn't get into the test body for lack of fonts; the first l10n generation failed run from the repository root and succeeded from the app directory; guide generation failed navigation-annotation/label validation and passed after fixing the input; the new setting moved the startup switch that an old test depended on out of the lazy viewport, changed to scroll to the target before verifying; after tightening candidate selection, a fixture that asserted the path was confirmed without any succeeded status failed, now asserting separately "only nominated is unknown" and "a unique succeeded can be classified". When the peerNetwork snapshot wasn't hooked up at the assembly stage, the related regression also failed, and passed once connected. The first restoration of the dependency lock file had a relative path not matching the working directory, and the following enforce-lockfile rejected the mismatched lock file; it succeeded after correcting the working directory and restoring the original lock. After every fix the corresponding checks were re-run.

## Coverage and residual risk

- Reviewed: this round's Dart package and Flutter native client changes, producers through to UI/diagnostic consumers, the Chinese/English inputs/generated artifacts, the upstream protocol and the new tests.
- Not reviewed: other modifications present at the start, all app tests, other runtime/plugin features.
- Not run: a new APK build/install, real WAN IPv6, real TURN allocation release/quota stress tests, a cross-device joint test with the upstream Host's compact history. A MethodChannel mock doesn't replace native libwebrtc/coturn acceptance.
- A native close stuck forever may still keep the following dispose from completing; this round has no real-device evidence that this happens, nor was native dispose called concurrently with an arbitrary timeout.
- The changes are still in source, and the currently installed app won't gain these features automatically; the engine was not restarted, TURN quota not modified, monitoring timers not enabled and system settings not changed.

## Latest main isolated integration verification

The integration carried only this round's 47 explicit paths (including generated Chinese/English copy, guide copies and remote page screenshots), and none of the original workspace's image gallery, pet, phone control, upload or repository home page changes. The mainline's existing upload negotiation notes and test hooks are kept, with the old version not used to overwrite them.

- Remote full `dart analyze`: exit 0; full tests **457 passed, 4 live skipped**, including the mainline's newly added restore, refresh owner, late HTTP and response decoding regressions.
- The app restored dependencies from the mainline's original lock file (`PUB_HOSTED_URL=https://pub.dev`, `--enforce-lockfile`), without upgrading dependencies. The first time, using a different mirror, enforce rejected it, and it succeeded after switching back to the lock file's source; the Remote package was restored from its original mirror lock file.
- The new switch changes the page layout, so 12 related remote page screenshots were regenerated in a targeted way; the light login page and the dark LAN-connected page were checked by eye, and other pages' baselines were not modified.
- The first extended run on `62241f4` of the whole Remote directory and the settings index: 284 passed, 7 skipped, 22 failed. One was a footer adjacent-title assertion caused by the settings group added this round, and the still-strict 24dp spacing assertion was changed to the actually adjacent "Remote transport"; the rest were collected separately, and unrelated golden images were not redrawn directly to get green.
- Independent clean `62241f4` baseline: of the 16 specified old page goldens, 1 passed and 15 failed, exactly the same as the 15 in the integration; the SSH save-confirmation tests 0 passed, 5 failed, all `No element` before reading the existing host list, exactly consistent with the integration. Then the mainline `ccdcb20`'s prefs test isolation fix was kept and final verification run.
- The clean `62241f4` no-dsh subset likewise exit 1 (0 passed, 1 failed): the temporary HOME/PATH did not stop the probe from finding the `dsh` already installed on the phone, and the actual result was dshTimeout rather than the expected dshNotFound. Together with the 15 goldens and 5 SSH fixture problems above, the remaining 21 failures in the integration were all reproduced on the clean mainline.
- Final verification changes no unrelated goldens, adds no skip and loosens no assertion: it selected all non-golden Remote files (excluding via the runner only the no-dsh single item caused by the dsh installed on this phone), the settings index, and the 12 page goldens changed this round for independent comparison; uncovered items and failing baselines are kept truthfully.
- Latest `ccdcb20` integration result: Remote non-golden files and the settings index **279 passed, 7 live skipped, exit 0** (the no-dsh single item excluded in the runner selection per the environment evidence above); the 5 SSH save-confirmation tests all passed after keeping the mainline prefs fix. This round's 12 page goldens independently compared **12 passed, exit 0**.
- Latest integrated whole-project `flutter analyze --no-pub`: **exit 0, no issues**. Generated-artifact checks passed (49 parts / 5512 keys, 26 guides), the three dependency lock files have no diff from the mainline, and the dedicated staging area has no whitespace errors. Remote CI and real TURN/IPv6 cross-network acceptance have not been run yet.

## Merge Conditions

1. Before release, on a real phone and a Host supporting the compact capability, verify LAN/P2P IPv6, TURN/Relay fallback, and allocation release after repeated disconnects.
2. Verify that switching between compact and full history requires a new client, that approvals and the live stream stay as they are, and verify the mode boundary when the Host is upgraded or downgraded.
3. For the drawer semantic tests in Q2, obtain independent baseline evidence or fix separately; the related full suite must not be claimed as all green.
