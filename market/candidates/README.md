# Candidates not yet listed

`candidates/` doesn't take part in generating the index and doesn't mean an entry passed review. After the reason is resolved, move the entry into `plugins/` and re-run the full checks.

| Candidate | Actual finding | Follow-up |
| --- | --- | --- |
| `dsh-univer-office@0.3.9` | On 2026-10-30, npm `dist.unpackedSize` was 195946027 bytes, over the 50 MiB limit | The author reduces the package size, or the maintainers change the published policy separately; no exemption this time |

For the actual pinned versions of other items recommended on community pages, see `plugins/`. Only the `dist/audit.json` produced after `npm run build` completes can show the result of a given check.

## 2026-10-31: media plugin moved into the official directory

`@ccch1mneyyy/dsh-media@0.2.1` has been officially published to npm; the anonymous exact version and the real tarball are both readable, and the downloaded content matches the local published package. The market check re-downloaded the published artifact and verified the registry SHA-512; it passed the entry format, MIT/OSI license, archive safety, package identity, DSH bundle patch and exact-version notice checks, and was moved into `plugins/`. `policy.json` marks only this media package as official; the originally planned package name `@dsh-go/media`, the staged `0.2.0` and the staged placeholder versions are not listed.

The static result is `adapted: true`, `minApp: 1.0.2`, `features: [media]`, with medium risk (shell, network, filesystem). These results don't mean the dependency tree has been reviewed, nor do they replace app installation and real paid-generation verification. For the publishing and live acceptance records, see `../VERIFICATION.md`.
