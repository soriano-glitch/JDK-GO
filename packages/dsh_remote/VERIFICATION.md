# P2P verification record

> The text below keeps the historical 1.0.3 acceptance. For the later changes to default automatic route selection, staged TURN fallback and network details and their verification, see the [Remote automatic route selection record](../../docs/testing/remote-auto-network.md).

This round completed real P2P on an Android 35 x86_64 emulator, Relay with direct connection turned off, and an APK comparison of the dependency increment for two ABIs. No real device, cross-public-NAT or real TURN verification was done; nor is it claimed that the native license audit of the final release is complete.

## Verification scope

The implementation base is `ef2d69b1` and `3b2d9918`. The app's "Direct first (P2P)" is off by default; only when on does it attempt direct connection in later connection attempts. The pure-Dart protocol layer uses WebRTC through a platform interface, the app adapter pins `flutter_webrtc 1.6.3`, and the Android SDK is `io.github.webrtc-sdk:android:150.7871.04`.

This round's native verification uses the standalone probe entry `app/lib/dev/remote_p2p_probe_main.dart`, connecting to a self-built local upstream Server (`7e387df`, with WebRTC signaling forwarding added only for the test) and the packaged Host plugin `0.6.0`; the Host runs on `dsh web 0.2.1-rc.5` with native `@roamhq/wrtc`. The Server has no STUN/TURN configured, and the emulator reaches the host machine via `10.0.2.2`. The `p2p` in the logs is the actual route selection result and doesn't mean public-internet traversal is covered.

| Check | Actual result |
|---|---|
| `dsh_remote` tests | 191 passed, 4 live tests skipped for unset environment; includes chunking, ICE, route selection, timeouts, late peer cleanup and Relay fallback with a new connection/new Noise |
| `dsh_remote` analyze | No issues |
| App targeted tests | 10 passed: direct preference off by default, settings and backend wiring, connection path display and license registration; targeted analyze has no issues |
| Android native P2P | Android 35 x86_64; connection 1,932 ms; client ended with `transport=p2p`, and the Host recorded the authenticated channel `P2P` |
| Android Relay-only | Same emulator, direct turned off; connection 1,173 ms; client ended with `transport=relay`, and the Host recorded the authenticated channel `Relay` |
| TURN | Configuration, filtering and candidate selection have unit tests; no real TURN service or traffic verification |

Both real links ran the following checks:

1. Read the session list, returning an empty list (this isolated Host had created no sessions).
2. Send a 120 KiB search request, receiving the Host's expected validation error for the 500-character search limit. The error shows the large request arrived, was reassembled and entered business validation; it doesn't mean an over-limit search succeeded.
3. Receive the 38,328-byte response of `settings/describe`. P2P covers DataChannel `RTCH` chunked transfer over 8 KiB here.
4. Complete 20 round trips, still on the corresponding P2P / Relay path at the end.

This round didn't use a simulated network stack to replace the two native links above. The evidence boundaries differ for ICE timeout, creating a new Relay/Noise after negotiation fails, real TURN, real devices and WAN/NAT: the first two are covered by unit tests, and the rest have no live-connection results this round. A successful Relay-only run can't be written up as native-runtime failure fallback having been measured.

## APK dependency increment

The same baseline source snapshot and the same release build configuration, comparing the artifacts without the WebRTC dependency and with this round's WebRTC dependency; both use build number `10300400`. This is a dependency A/B measurement, not the release APK after all of this round's features were integrated, and it doesn't include the final full Linux runtime size. The absolute sizes in the table must not be used as the formal install package size.

| ABI | baseline / B | with WebRTC / B | increment / B | increment / MiB |
|---|---:|---:|---:|---:|
| arm64-v8a | 29,021,417 | 46,288,191 | 17,266,774 | 16.467 |
| x86_64 | 29,295,716 | 46,562,493 | 17,266,777 | 16.467 |

SHA-256:

```text
aea299f9fda7012f8a5c1f6fe9dbb9b89a08f3e2eca4ab1045fbefd7230b676c  baseline-arm64.apk
bd8513e90836dfef898ed40f62c454c454d958c4737f1ebb909a718529edc248  webrtc-arm64.apk
e98f95f1800dc1b37e2283ec0c24f551f034b6420fc5d01bea2b1d89e7674070  baseline-x64.apk
1f5cc729d5ba679331bcd0d3f0cf7dfbd5a6ae21d538a18bc833f17927c9c745  webrtc-x64.apk
a57d2391f73566511eb004a954a1847638f2c0bfff102c2b23c8b2e20129ed10  p2p-probe-x64.apk
```

The direct-connection switch doesn't remove the native dependencies already packaged in the APK, so the default-off state still bears this size increment.

## Raw records and pre-release boundaries

The local archive of this acceptance holds `p2p-e2e-final.log`, `p2p-apksize.json`, `p2p-apksize-ab.log`, and the test and analyze logs. These are records on this machine and are not distributed through Git; the key results above and the digests below record this round's evidence, and contain no credentials of the isolated accounts.

```text
c2e93b36ec0210d6502500f1baec48642e556a011b25e73710976e90e708bce4  p2p-e2e-final.log
3d33dd1d7b08cc94b2c5d6dec47269f61204078c8156ff050d5e350915cb68af  p2p-apksize.json
```

The P2P records above only organize build/test evidence that was already completed; no build was re-run and the emulator was not operated. The license completion on 2026-10-31 packaged the official `v150.7871.04` tag's complete 788,358 B / 30-section license compilation as is, shown through the `WebRTC` entry of `LicenseRegistry`; the BSD/PATENTS and flutter_webrtc NOTICE are kept. The official AAR of the same tag was compared with the actual Maven AAR: native libraries for all ABIs are byte-identical, and the only content difference is a Java class major version downgrade. 5 targeted license tests passed, including complete asset loading, SHA-256, sections and the existing entries.

For the source, exact digests, verification boundaries and the final APK verification command, see [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md#bundling-the-complete-upstream-notice-2026-10-31). This closes the gap that the complete upstream notice wasn't bundled with the package; it doesn't claim to have completed an independent GN dependency-graph audit of the components actually linked; the final release APK's asset digest and license page access are still accepted by the release build and recorded separately.
