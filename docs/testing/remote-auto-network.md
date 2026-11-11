# Remote automatic route selection and network details

This round was checked against Li Guobao's [ds-harness-remote `0aacfcfe`](https://github.com/liguobao/ds-harness-remote/tree/0aacfcfe85cbd1ad43545115a05e52dd146f7587) (2026-10-31), mainly referring to Android's `src/lib/network-route.ts`, `src/services/network-route.ts` and the shared WebRTC transport. The change ships with app 1.0.4; 1.0.3 uses the old default-off behavior.

## Behavior

- It automatically tries LAN / P2P, then TURN, and finally Relay; the user-visible P2P switch is removed. The old `remote_direct_p2p=false` is also migrated to the automatic policy, so that an upgrade doesn't leave it stuck on the relay.
- Wi-Fi / Ethernet keep LAN priority; when a cellular network is confirmed, LAN is skipped. VPN-only, brief disconnections or unknown information don't tear down a healthy connection. When a switch between Wi-Fi and cellular is confirmed, ICE is renegotiated.
- LAN/P2P share the first ICE probing round, with the route chosen by candidate priority and actual connectivity; that round removes the TURN configuration and filters relay candidates from both sides' SDP / trickle. Merely dropping the local TURN URL can't be used to claim TURN won't jump in first.
- The TURN stage uses relay-only ICE; when a stage fails, a new authorized connection is created, and the final path does the Noise handshake again. Authorization revocation or a host identity error terminates directly and is not a reason to change paths.
- A failed path is cooled down per Host for 45 seconds; it is retried after the network preference changes. Each RTC stage defaults to 8 seconds, a larger server budget up to 15 seconds; ICE credential requests up to 5 seconds. The app's total wait budget for the first connection is 45 seconds, with no extra waiting on success.

## Network information

Tap the LAN / P2P / TURN / Relay label next to a connected host or on the connection card at the top to open the details. It shows the latest observation time, the actual path, connection time, RTT and the fallback reason; when there is no observation it shows not measured.

Refreshing reads the existing WebRTC stats only on demand, with no new background ping or periodic sampling. RTT is the round-trip time of the ICE candidate pair, not the duration of one application RPC; Relay doesn't fake an RTT for now. Logs and diagnostic exports contain only restricted fields, not SDP, candidate addresses or credentials. After a disconnect, reconnect or connection replacement, old measurements are discarded.

## Verification boundaries

- Pure-Dart protocol package: 198 passed, 4 live environment gates skipped; covers the real state machine, two-stage fallback, candidate filtering, short cooldown, authorization failure, chunking and host key checks.
- App UI / interaction / screenshots: 51 passed, including Chinese and English, separation of the four paths, latest observation time, safe errors, unknown values and late measurements.
- Latest upstream self-hosted Server + published Host 0.6.0 / Harness 0.2.1-rc.5: 4 live tests passed; the Relay node saw 4 attaches, 4 pongs and 143 forwarded frames. Isolated accounts on this machine only; the user's online Host was not used.
- App Remote extended regression: 263 passed, 7 test gates skipped; the final targeted 13 passed, covering upgrade migration, network hints, reconnect races and the log-reason allowlist; Dart analyze reports no issues.
- API 35 x86_64 native WebRTC: a real P2P connection succeeded with ICE RTT of 2 ms; a real connection via an assigned Relay node succeeded. Each path completed 20 round trips, reassembly of a 120 KiB request in chunks (receiving the Host's expected input-length validation error) and a 38,328 B response.
- In a dedicated emulator, with direct TCP / UDP over IPv4 / IPv6 blocked by app UID and only the test Server / Relay ports allowed: after the first direct probe timed out it fell back to Relay automatically, with a connection time of 13,542 ms, and all subsequent transfers succeeded. The dual-stack rules both logged actual deny counts and were removed after the test.
- The native fixture assigned the client a Relay address reachable from the emulator and the Host a host-machine loopback address; WebRTC signaling forwarding and the Relay node are test patches and don't mean the public self-hosted Server provides these capabilities by default. Blocking only IPv4 or only UDP can't serve as evidence that direct connection is completely unreachable.

Real public-internet NAT, an actual TURN service, mobile networks and OEM real devices need separate acceptance. Success on this machine's emulator can't replace those results, nor does it prove P2P is faster than Relay on every network.
