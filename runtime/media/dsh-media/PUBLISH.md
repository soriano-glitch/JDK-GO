# Publishing preparation and execution notes

> 0.3.0 pending release: after npm officially publishes it and the tarball is verified, change the `version` of `market/plugins/@ccch1mneyyy__dsh-media.json` to `0.3.0`, then rebuild the index per `market/VERIFICATION.md`; don't point the market at 0.3.0 before npm publication.

The current version `@ccch1mneyyy/dsh-media@0.2.1` was officially published to npm on 2026-10-31 (Asia/Singapore) with a granular token that has direct-publish permission. After HTTP 202 acceptance, on 2026-10-30 19:55:51 UTC the anonymous exact-version query and the public tarball download both returned 200, and the double verification of the registry SHA512 and the local SHA256 passed. No manual staging approval was needed. The package name uses the user-authorized backup organization; the namespace / bundle entry ID is kept as `dsh-media`, and the existing app supports the `/dsh-media` package name, so no new app release is needed.

The published package is 48,019 bytes, 19 regular files, with SHA256 `9829f5106dec8cb354c203c74cc0510656f0f94538c36abf0fb80226388d13c9`. Compared file by file with the 306/306-passing version, only the version in package.json changed from 0.2.0 to 0.2.1, and the runtime code is identical. The explicit files list contains no tests, credentials, private logs or dev dependencies.

## Limits of this release and version choice

- The previous GAT, despite Bypass 2FA and coarse package/write metadata, in fact had stage-only permission. The first publish returned E404; after staging created the package, the same token's direct publish explicitly returned `E_STAGE_REQUIRED`, so the earlier 404 can't be used to assert that the organization lacked permission or that the account not having 2FA enabled was the only cause.
- `0.2.0` was uploaded and verified through official staging with stage ID `87e228cd-1e3b-4014-8410-f49ab24581af`, and the staged tarball matches the local hash. It has not been formally published and doesn't enter the installable market.
- The latest token passes the direct-publish permission check, but directly publishing `0.2.0` returned 409: a staged version can't be overwritten. So `0.2.1` was published directly in the normal way with no functional code changes; no further duplicate staging was created, and the user isn't asked to approve the old version.
- Automatic direct publishing needs Packages and scopes set to `Read and write (publish and stage)` with Bypass 2FA turned on; `Read and write (stage only)` doesn't suffice. Official staged approval independently requires manual 2FA, and that requirement can't be applied to all GAT direct publishes.

The public tarball has been checked against the registry SHA512 and the local SHA256. The market's real scan, 24 tests and the 5-package build passed, and Pages is deployed; on 2026-10-30 19:58:47 UTC both Worker files returned 200 with X-Market-Stale:false, the official format and Worker validator passed, the official entry is official / 0.2.1, and the SRI matches npm. The independent verification plugin share page returned HTTP 200, with the Chinese title, version and app deep link correct. The market lists only official versions, not the placeholder versions of npm staging.

## Local verification and token publishing

From the repository root, prepare dependencies per VERIFICATION.md, run the full tests and headless; then:

```sh
cd runtime/media/dsh-media
npm pack --dry-run --json
npm pack --pack-destination /absolute/private/release-dir
```

After reviewing the tarball contents and SHA256, the owner can choose on their own machine a short-lived granular token limited to that organization/package and satisfying the publishing 2FA policy. Don't put a real token into command text or the repository. Below are the routine steps for later new versions; this time `0.2.1` was submitted through this normal direct-publish path; when publishing a new version, first check that the version isn't already taken by a published or staged record:

```sh
umask 077
media_npmrc=$(mktemp)
trap 'rm -f "$media_npmrc"; unset NPM_TOKEN' EXIT
printf '%s\n' '//registry.npmjs.org/:_authToken=${NPM_TOKEN}' > "$media_npmrc"
read -rsp 'npm token: ' NPM_TOKEN
export NPM_TOKEN
NPM_CONFIG_USERCONFIG="$media_npmrc" npm whoami
NPM_CONFIG_USERCONFIG="$media_npmrc" npm publish /absolute/private/release-dir/ccch1mneyyy-dsh-media-0.2.1.tgz --access public
```

Complete authentication per the organization's 2FA / granular token policy; don't presume the organization policy can be bypassed. For using an `.npmrc` that references an environment variable, see the [npm token documentation](https://docs.npmjs.com/private-modules/ci-server-config/). Publishing with an ordinary token on this machine doesn't claim CI provenance.

## Old 0.2.0 staging record (not a prerequisite for this release)

```sh
npm stage view 87e228cd-1e3b-4014-8410-f49ab24581af --json
npm stage download 87e228cd-1e3b-4014-8410-f49ab24581af
npm stage approve 87e228cd-1e3b-4014-8410-f49ab24581af --auth-type=web
```

`@ccch1mneyyy/dsh-media@0.2.0` can also be approved in the npm website's Staged Packages tab. The official requirement is that the maintainer completes account 2FA at formal approval; a Bypass 2FA GAT can't replace this step. The first staging may generate an npm-managed `0.0.0-stage`, which doesn't contain the content of the version to be published and isn't an installable version of this plugin. See [official staged publishing](https://docs.npmjs.com/staged-publishing/).

## Optional GitHub Actions provenance template (not enabled)

This package hasn't configured a `repository.url` of a public source or a provenance workflow, so it **can't directly claim to meet public provenance requirements**. Before enabling, the location of the plugin's public source code must be made explicit, `repository.url` in package.json filled in with the same case as that public repository, the complete verification inputs kept, and the tests re-run. npm's provenance requires public source and a supported hosted runner; the binding for OIDC trusted publishing must also be configured on the npm side. See [provenance](https://docs.npmjs.com/generating-provenance-statements/) and [trusted publishing](https://docs.npmjs.com/trusted-publishers/).

Below is a template keeping this repository's paths, to be copied into `.github/workflows/` only after the owner decides on the publishing plan. Use a protected environment and explicit dispatch, and replace the action tags with exact commits reviewed by the owner. If a standalone plugin repository is split out, first move in the two existing runtime locks and header golden, then adjust the paths. The following verifies `0.2.2-rc.1` by default; before a compatibility release, another set of dependencies must also be prepared with `--dsh-version 0.2.1-rc.4` and the same checks run.

```yaml
name: Publish media with provenance
on:
  workflow_dispatch:
permissions:
  contents: read
jobs:
  publish:
    runs-on: ubuntu-latest
    environment: npm-release
    permissions:
      contents: read
      id-token: write
    steps:
      - uses: actions/checkout@v6
      - uses: actions/setup-node@v6
        with:
          node-version: '24.x'
          registry-url: https://registry.npmjs.org
          package-manager-cache: false
      - name: Install exact test graph
        run: |
          node runtime/media/dsh-media/test/headless-v2/prepare.mjs --out "$RUNNER_TEMP/media-deps"
          npm ci --ignore-scripts --prefix "$RUNNER_TEMP/media-deps"
          ln -s "$RUNNER_TEMP/media-deps/node_modules" runtime/media/dsh-media/node_modules
      - name: Verify
        env:
          TZ: Asia/Shanghai
        run: |
          node --test runtime/media/dsh-media/test/*.test.js
          node runtime/media/dsh-media/test/headless-v2/run.mjs --out "$RUNNER_TEMP/media-evidence"
      - name: Check and publish
        working-directory: runtime/media/dsh-media
        run: |
          npm pack --dry-run --json
          npm publish --provenance --access public
        env:
          NODE_AUTH_TOKEN: ${{ secrets.NPM_TOKEN }}
```

This template uses npm's official token + provenance mode. After configuring and verifying an OIDC trusted publisher, the token can be removed per the official instructions; you can't claim it is configured successfully just by deleting the environment variable. Provenance proves origin and build; it doesn't mean the code is risk-free. The template adds no automatic tag / release trigger, and the current branch has no executable publish workflow.
