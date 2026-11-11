# Local acceptance record · 2026-10-30

Baseline: dsh-app `4f03e98e`. No public repository was created, no npm package published, no remote PR opened, no Pages uploaded and no Worker deployed. The results below come from local execution and can't be taken as GitHub/Cloudflare online acceptance.

| Scope | Result |
| --- | --- |
| `npm test` (market) | 24 offline tests passed; including two original npm tarballs, the official format validator, rejection rules, risk flags, native manifest, archive path/link checks and the CI pinned-version boundary |
| `npm test -- --maxWorkers=1` (Worker) | 112 tests passed, including existing regressions and the new market route tests |
| `npm run typecheck` (Worker) | TypeScript passed |
| actionlint 1.7.7 | The check / publish / watch workflows passed |
| JavaScript embedded in GitHub Actions | Syntax checked by compiling with AsyncFunction, passed; no GitHub write API was called |
| `npm run build` (market) | Passed after actually downloading 4 packages from npm, verifying SHA-512, scanning and querying advisories, and generated format 1 by calling the official 0.2.1-rc.2 validator directly |

This run's online scan:

| Package | Pinned version | Unpacked bytes | Risk features | High-severity advisories for this package's exact version |
| --- | --- | ---: | --- | --- |
| `@liustack/modlens` | 3.27.2 | 732368 | shell, network, filesystem, not-adapted | No hits |
| `@liustack/modsearch` | 5.10.11 | 518726 | shell, network, filesystem, not-adapted | No hits |
| `@xmanrui/dsh-im` | 5.8.0 | 28403878 | shell, network, filesystem, obfuscated, not-adapted | No hits |
| `dsh-context` | 0.78.2 | 764434 | shell, network, filesystem, obfuscated, not-adapted | No hits |

All four entries are community, medium, and did not pass the native adaptation declaration check. This doesn't equal "malicious", nor "can't use Host tools in the app". Dependencies were not recursively resolved and no plugin was executed. The media candidate @dsh-go/media@0.2.0 is not yet published; dsh-univer-office@0.3.9 remains a candidate because its package is over the size limit, and does not appear in the index.

The generated files of this round are kept in the isolated workspace `market/dist/` (ignored by Git). The SHA-256 of this successful generation at 2026-10-30 15:20–15:21 UTC:

```text
58077ac92eac40bc5bacb966e5d15f5de43e6386e397b2933505322eb7fde2b2  index.json
d098719013aad93bbceff9e6423334dcf84191c067456588aa253607272d6b81  dsh-go.json
15a95f29e494ae1f226211374ac03d3ab771bd5d6630ead1f30a08ffd457febf  audit.json
```

The first attempt downloading dsh-im hit a 30-second timeout, correctly refusing to generate; after changing the tarball download limit separately to 180 seconds, the rescan passed. Other metadata/advisory requests still have the 30-second limit, and size checks are unchanged.

The Worker tests cover the ten-minute cache and remaining validity, upstream failure/bad JSON/oversized responses, index and sidecar version mismatch, KV persisted copy and read/write failures, 503 when unavailable the first time, encoded package names, method/404, HEAD, HTML escaping, CSP, risk display, app deep link and download fallback. It reuses the QUOTA KV, with no new Cloudflare resources.

Not verified: the real deployment behavior of GitHub branch protection/auto-merge/Pages, real public-internet Worker routing, the full install chain from the app to the published market, consistency of the bytes the host actually installs, dependency tree security, and real-device runtime adaptation. For the go-live preparation steps and these boundaries see the README; no manual review or security endorsement is forged.

## Input-boundary fixes after independent review

- The catalog PR check uses the captured base/head SHAs pinned. The changed file list is taken from an immutable comparison, content is read along the same head's Git tree, and the comparison result is checked against the blob SHA. A moving branch doesn't change the object reviewed this time.
- The Git mode/type of directories and JSON must both match, rejecting symlinks, submodules and truncated trees; non-regular files are also rejected before writing into the trusted base workspace.
- tar paths reject empty segments, relative traversal and non-canonical names; a trailing slash on a directory is normalized first, then checked together with all entries for duplicate targets, avoiding a mismatch between the reviewed path and the actual install path.

After the fixes, `npm test` ran: 22/22 passed. The new cases cover pinned-SHA reads, returning after the branch changes during reading, the workflow's actual JavaScript wiring, illegal Git modes, content identity mismatch, non-canonical tar paths and duplicate targets. The GitHub API was entirely mocked with local test objects, with no writes to the remote and no workflow executed. actionlint 1.7.7 on the three workflows and the syntax checks of all five embedded JavaScript segments passed. Worker routes were not changed, and the 112 existing Worker verifications remain the earlier results recorded in the table above.

Follow-up cross-platform path check: reject trailing dots/spaces or colons in any path segment, and deduplicate extraction targets case-insensitively. New manifest/nested file/directory conflict and normal mixed-case file cases were added, `npm test` passed 24/24, and the results for the two original npm tarball fixtures are unchanged; `node --check scripts/core.mjs` and `git diff --check` passed. This round is an offline archive-parsing verification on Linux, with no Windows installation or remote operations executed.

## 2026-10-31 Online catalog deployment

The public repository `ccch1mneyyy/dsh-go-market` was created, the Pages workflow run `41099576267` succeeded; the public index and sidecar return HTTP 200. main was configured with strict branch protection requiring GitHub Actions' `market/catalog` check, with squash / auto-merge enabled. The above updates the local verification boundary earlier in this document; plugin installation and real-device adaptation remain outside this verification scope. Worker interface acceptance is below.


### Worker online acceptance and runtime fix

On 2026-10-30 17:39 UTC (local 2026-10-31 01:39) Worker version `3c31b096-b938-41a6-92ce-ff90e603999d` was deployed and accepted, with the code fixes being `8ec9b86b` and `8b014d75`. The market first returned 503 on going live; restricted online logs recorded a `TypeError`, whose root cause was that Workers don't support `redirect: 'error'`, which throws at request construction. It was changed to `redirect: 'manual'`, with 3xx rejected by the existing `!response.ok` check, keeping the boundary of not following redirects; a 302 regression was added. For runtime limits see the [Cloudflare Request documentation](https://developers.cloudflare.com/workers/runtime-apis/request/). Failure diagnostics record only a fixed reason, a restricted exception type and the HTTP status, and don't record URLs, response bodies or arbitrary exception messages.

| Verification scope | Result |
| --- | --- |
| `https://go.dshtui.com/market/index.json` | HTTP 200, JSON, `X-Market-Stale: false` |
| `https://go.dshtui.com/market/dsh-go.json` | HTTP 200, JSON, `X-Market-Stale: false` |
| Real online two files run through the exported `validateCatalog` | Passed, 4 plugins, index and sidecar pairing valid |
| Worker full official tests (excluding the local temporary acceptance script) | 7 committed test files, 113 passed; the temporary online acceptance script is excluded to avoid mixing into the official test count |
| Worker `tsc --noEmit` | Passed |
| Deploy script real share-chain E2E | Upload, read, decrypt, page and security headers, token/admin deletion all passed |

The default `npm test` also passed, 115 in total, of which another 2 are temporary real Pages/Worker directory pairing checks. The above confirms the public market interface and the existing share chain run normally; it is not extended to app plugin installation, consistency of host-installed bytes, dependency tree security or real-device adaptation verification.

## 2026-10-31 Media plugin 0.2.1 official release and market listing

The officially listed package is `@ccch1mneyyy/dsh-media@0.2.1`. As of 2026-10-30 19:55:51 UTC, an anonymous exact-version HTTP 200 and a complete public tarball download were verified; 19 files, 48019 bytes compressed, with SHA-256 `9829f5106dec8cb354c203c74cc0510656f0f94538c36abf0fb80226388d13c9`, and content identical to the local published package. The registry SHA-512 is:

```text
sha512-OCm2F4PwrCaNptn2TLTiZvlcK2RY7vmSNW8Qa3uu8YlUzt49pMSS9VdHQ3sKUUB9VEvST3+bjxs0TlfR4wdbmg==
```

The media source had previously passed 306 Node tests; `0.2.1` differs from that tested package only in the package.json version number. From 19:56 UTC the market re-read the real npm published artifact: 163812 bytes unpacked, MIT/OSI license, archive safety, package identity and DSH bundle patch all passed, and the exact-version advisories were empty. It was recognized as `adapted: true`, `minApp: 1.0.2`, `features: [media]`, with medium risk, keeping the shell, network and filesystem features and the actual file evidence.

`plugins/` gained only this media entry, which the maintainers' policy marks as official; the total catalog is 5 pinned versions. The originally planned `@dsh-go/media` failed to publish; the backup package `0.2.0` was once staged successfully and its download content checked, but the approval interface returned 404, with the root cause undetermined. After the new publish credential got direct-publish permission, `0.2.0` returned 409 because it was already staged, so only the version number was upgraded to `0.2.1` to complete the official release. The old package name, the staged version and placeholder versions were not added to the market.

This round's market `npm test` 24 offline tests passed, and `npm run check` and `npm run build` passed on all 5 exact versions; the build re-downloaded and checked the npm tarballs, verified SHA-512 and advisories, then called the official format 1 validator. The market's static checks don't execute plugins, don't resolve the dependency tree, and don't prove app-install byte consistency, real paid generation or the full on-device media chain.

### Media catalog online acceptance

The public market commit `4d822e9735e00e39b72b433af26608d5d93c9c82` was published to main, pushed using the existing owner bypass without modifying branch protection. The GitHub Pages workflow [41119356203](https://github.com/ccch1mneyyy/dsh-go-market/actions/runs/41119356203)'s dependency install, 24 tests, full online build and deploy all succeeded, with the deploy completing at 2026-10-30 19:57:38 UTC.

| Verification time (UTC) | Object | Actual result |
| --- | --- | --- |
| 2026-10-30 19:57:57 | Pages `index.json` and `dsh-go.json` | Both HTTP 200, 5 plugins, the media entry is `@ccch1mneyyy/dsh-media@0.2.1`, official |
| 2026-10-30 19:58:47 | Worker `/market/index.json` and `/market/dsh-go.json` | Both HTTP 200, `X-Market-Stale: false`, 5 plugins, correct media version and official identity |
| The two sets of real responses above | The actual Worker `validateCatalog` and the official `parseMarketIndex` | Both passed; index and sidecar names and versions pair up, the media SHA-512 matches npm's exact-version metadata; adapted, minApp, features and risk flags all match the scan results |

The Worker's first request hit a not-yet-expired old 4-entry cache with 28 seconds of remaining validity; the acceptance above was completed after waiting for natural expiry, without clearing KV or redeploying the Worker. The final catalog does not include the original package name, the staged 0.2.0 or placeholder versions. The above verifies the market's real public distribution, and is still not extended to app device installation or paid-provider generation verification.
