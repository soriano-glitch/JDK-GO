# Real npm tarball fixtures

The `.tgz` files in this directory are the original files downloaded from the official npm registry, not repackaged and with none of their code executed. The matching `.json` records the source URL, download time, npm SHA-512 integrity, license, exact version metadata and the raw response of that run's bulk advisory API. The original authors' licenses are kept inside the packages.

- `@liustack/modsearch@5.10.11`, MIT, 170839 bytes
- `@liustack/modlens@3.27.2`, MIT, 239567 bytes

Refresh: run `node scripts/capture-fixtures.mjs` in the market root. A normal `npm test` doesn't access the network and doesn't run downloaded install scripts. Negative tests additionally generate tarballs, clearly labeled as modified, in a temporary directory, covering a missing license, identity mismatch, install scripts, path traversal, links and duplicate filenames.

The historical advisory responses exist only to reproduce tests; publish checks query online every time, and this fixture can't be taken as a current security conclusion.
