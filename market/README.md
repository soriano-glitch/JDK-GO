# JDK-Go plugin market

This is the complete directory to be split out into the public repository `ccch1mneyyy/dsh-go-market`. The install entry is JDK-Go's plugin market; this repository only maintains the pinned-version catalog and static check results, and neither hosts nor executes plugin code.

Published artifacts: `index.json` uses DSH format 1, `dsh-go.json` uses JDK-Go sidecar schema 1, and `audit.json` keeps this run's structured scan evidence. The Worker serves `https://go.dshtui.com/market/` externally, and the share page is `https://go.dshtui.com/p/<encodeURIComponent(package name)>`.

## Submitting a plugin

1. First publish a DSH bundle with an OSI open-source license to npm; the market accepts only exact versions, such as `1.2.3`, not `latest`, ranges or Git addresses.
2. Fork the market repository and add one JSON file under `plugins/`. A non-scoped package uses `<package name>.json`; `@scope/name` uses `@scope__name.json`.
3. Fill in the information in the example below and open a PR to main. Add or change only one entry at a time. An upgrade likewise changes the version number in this file, without appending historical versions.
4. After all automated checks succeed, GitHub auto-merge is enabled; no manual approval is needed. Risk features alone don't block listing; they are written into the data the app displays. Structure, license, integrity or query failures block it and give the reason.

```json
{
  "name": "@someone/dsh-weather",
  "version": "1.2.0",
  "title": {"zh": "天气", "en": "Weather"},
  "summary": {"zh": "查看天气预报", "en": "Weather forecasts"},
  "category": "tools",
  "screenshots": [],
  "homepage": "https://github.com/someone/dsh-weather"
}
```

The title and summary must have English `en` and may add Chinese `zh`; screenshots are HTTPS only, at most four. Categories are `tools`, `media`, `productivity`, `communication`, `other`. **Don't submit `tier`, risk, integrity or review conclusions.** Official status is taken only from the maintainer-controlled `policy.json.officialPackages`; historically disabled versions are managed in `policy.json.blockedVersions`, and no author can declare official status or erase a warning on their own.

## Local checks and generation

Needs Node.js 22 or newer. Run the following commands in this directory:

```sh
npm ci --ignore-scripts
npm test                      # Offline tests (including the original npm tarball fixtures)
npm run check                 # Live online scan, structured results written to reports/ and JSON printed
npm run build                 # Rescan online again, and on success generate the three files under dist/
npm run watch                 # Check dist-tags.latest and look for new versions, outputting reports/updates.json
```

`check` and `build` can take a directory argument, e.g. `node scripts/check.mjs candidates`. Candidates failing is expected. The build doesn't consume scan results provided by submitters; it always re-downloads the tarball, verifies the npm SHA-512, reads the actual package.json and files inside the package, and then queries npm advisories. It doesn't execute scripts in the package and doesn't extract to host paths. File size, expanded size, entry count, links, path traversal, duplicate extraction targets and extraction caps are all limited; archive paths can't contain empty segments, colons or trailing dots/spaces in a segment, a trailing `/` on a directory and a suffix-less directory are checked as the same target, and targets are deduplicated case-insensitively to avoid Windows alias collisions.

The generator calls `parseMarketIndex` of `@deepseek-ai/dsh-plugin-market-index@0.2.1-rc.2`, pinned by the lock file, directly; it doesn't simulate the official validator itself. Each entry has exactly one npm version. The two indexes have the same names and versions.

## Check rules and boundaries

Blocked: the exact version doesn't exist; the license isn't in SPDX's OSI list; more than 50 MiB compressed or expanded; package identity, SHA-512 or the DSH bundle patch inconsistent; invalid format 1; the version hits high/critical in npm advisories; `tier` submitted; a network query required by the check fails. An `OR` license needs only one selectable OSI branch, `AND` needs all to be OSI; complex expressions with an exception are conservatively rejected, and maintainers can extend the rules.

Allowed and flagged: install lifecycle scripts / native binaries (high), child processes / file writes / large minified or obfuscated source (medium), network / undeclared but statically passing native protocol (low). The risk level takes the highest value. Each item records at most 12 actual file paths for locating. Workspace paths depend on runtime, and a text scan can't prove writes are always within the workspace; on seeing file-write APIs it conservatively flags `filesystem`, so false positives are possible.

**Features found by automated checks don't mean the plugin is malicious.** This is a reproducible heuristic scan, not a sandbox, signature certification or proof of malicious code. Dynamic imports, concatenation and indirect calls may be missed. The npm bulk advisory queries only the exact version of the currently published package, **does not resolve the dependency tree and doesn't claim dependencies have been reviewed**. Dependencies can resolve to different versions at install time, and the host should still enforce its own locking and security policy. A query failure rejects this build and keeps the already published version.

`integrity` proves that what was scanned is the tarball npm gave at that time; it doesn't prove the author's identity or the bytes the host actually installs later. The current DSH `pluginManager.installBundle` neither accepts an expected integrity nor returns the actual installed tarball hash, so the app can only compare against the registry before installing and can't claim end-to-end integrity enforcement.

## Native adaptation declaration

It reuses the existing JDK-Go `package.json.dshGo` protocol v1 without introducing another manifest:

```json
{"dshGo":{"v":1,"minApp":"1.0.3","contributes":{}}}
```

The actual minimum app version is determined by the author per feature. After the checker passes the SDK manifest JSON Schema, it also needs actual contributed slots, or source containing `dsh-go/view` / `dsh-go/media`. An empty declaration with no implementation is still `not-adapted`. features are generated from these traits; `minApp` is passed through from the valid manifest. A static pass doesn't mean it has been verified running in the app. For the SDK schema snapshot and its source see `vendor/native-schema/README.md`.

## Maintenance and release preparation

The public catalog repository is [ccch1mneyyy/dsh-go-market](https://github.com/ccch1mneyyy/dsh-go-market), with the Pages address https://ccch1mneyyy.github.io/dsh-go-market/ . This directory holds the corresponding maintenance source; the standalone repository uses this directory's contents as its root, with `.github` at the root.

Deployment configuration and maintenance requirements:

- Create `ccch1mneyyy/dsh-go-market`, with default branch main, allow GitHub Actions to create PRs, and enable auto-merge and squash.
- Configure strict branch protection for main: require the latest base and the `market/catalog` status; other checks that must pass are also added to required checks. Constrain this status by GitHub Actions source, to prevent other writers from forging it. The workflow detects a missing protection of this kind and refuses to auto-merge, and won't lower the protection on its own.
- In the Pages settings choose publishing through GitHub Actions. `publish.yml` gives only the deploy job `pages:write` and `id-token:write`; no Cloudflare secrets are needed.
- A single-plugin PR uses `pull_request_target` to run **trusted base** code, compares changes by pinned base/head SHAs, then reads the only JSON along that head's commit → tree → blob and verifies it's a regular file; symlinks and submodules are rejected, and PR scripts are never checked out / executed. The success status is written on the actual PR head SHA; auto-merge re-checks the SHA. Other maintenance changes don't go through auto-merge and need maintainer review and separate verification.
- The daily `watch.yml` creates a PR changing only one entry for a new version that passes the scan, and explicitly calls `workflow_dispatch` to reuse the full checks. GitHub's GITHUB_TOKEN doesn't recursively trigger ordinary PR/push events; the publish workflow also has a compensating schedule every ten minutes (GitHub scheduling can be delayed), and a manual dispatch can also publish immediately. For related behavior see [GitHub's official events documentation](https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows).
- The Worker's default upstream is `https://ccch1mneyyy.github.io/dsh-go-market/`; `MARKET_SOURCE_URL` can change it to another HTTPS publishing root. It reuses the existing QUOTA KV to store a whole successful copy, with no expiry and a ten-minute refresh; when the upstream fails it keeps returning the old copy with `X-Market-Stale: true`, and returns 503 when there has never been a successful copy. The cache isn't a permanent online guarantee; when a KV write fails, only the current isolate's memory may keep the new copy.

For the first candidates and the actual reasons they can't be listed, see `candidates/README.md`. The media package will be moved into plugins after it is published, without occupying an empty package or generating fake review data.
