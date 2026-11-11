# Incremental updates (DSHDLT01 patches)

A new APK often differs from the old one in only a few zip entries (the Dart code `libapp.so`, `classes.dex`, a few resources). At release time, one patch is made for each of the latest few old versions; an app that has one of those versions installed downloads only the patch, assembles the new APK from the old APK on the phone, and installs as usual once the SHA-256 matches. If assembly fails or the hash doesn't match, it always falls back to the full package.

| Part | Location |
|---|---|
| Format and reference implementation (generate `make`, apply `apply`) | `tooling/apk_delta.py`, tests `tooling/test_apk_delta.py` |
| Generated at release and written into the manifest | `tooling/release_assets.py --delta-from N` (default 3), tests `tooling/test_release_assets.py` |
| Upload to every route and download back to verify | `services/share-worker/scripts/publish-release.sh` (every file listed in `SHA256SUMS` is uploaded) |
| App-side patch selection, download, assembly and fallback | `app/lib/update/`, implemented per this document's contract |

## Format

Big-endian. A patch = an 80-byte header + a series of operations, which write the target file out from front to back:

```text
header  "DSHDLT01" (8 bytes)  SHA-256 of the old APK (32)  SHA-256 of the new APK (32)  u64 length of the new APK
0x01    COPY  u64 offset in the old APK  u64 length        copy this span from the old APK
0x02    DATA  u64 length  then that many bytes              written out as is
0x00    END
```

- COPY ranges can be in any order and can repeat within the old APK; adjacent operations of the same kind are already merged (there won't be two consecutive DATAs, nor two COPYs that are end-to-end in the old APK).
- Nothing is read after END.
- The result must be **exactly** the length and SHA-256 in the header, or the whole result is discarded.

## How it's generated (`apk_delta.py make BASE NEW OUT`)

Done per zip entry, using only the standard library (runnable with `python3 -I`):

1. Read the central directories of both APKs; where each entry's compressed data starts is determined by the local file header (zipalign pads in the local header's extra, which differs from the central directory).
2. For each entry of the new APK: if the old APK has an entry of the same name with the same CRC-32, compressed size and compression method, **also compare the compressed data byte by byte**, and if identical, COPY that span from the old APK.
3. Everything else in the new APK is DATA: local file headers, changed entries, the APK Signing Block, the central directory, the EOCD, and gaps between entries.
4. Before writing out the patch, apply it once, and only write to disk if the result's SHA-256 matches the new APK.

The correctness of COPY doesn't depend on understanding the zip structure: as long as that span of the old APK is byte-identical to this span of the new APK, the assembled result is correct; the structure is only used to find candidate ranges.

When `release_assets.py` generates `dist/`:

- `gh release list` takes the latest N published versions (excluding drafts and this version), `gh release download` downloads each one's arm64 APK and `SHA256SUMS` to `~/.cache/dshgo-release/apk/<tag>/`, and the APK must match the `SHA256SUMS` published for that version (re-downloaded if the cached one doesn't match). The first time requires downloading N full packages (about 200 MB each, several minutes each on the release machine), after which the cache is used. `fromVersion` is read from the old APK with `aapt2`.
- A patch `dsh-go-<new version>-from-<old version>-arm64.dshdelta` is generated for each; **only those under 60 % of the full package are kept**, and the rest are deleted. Above 60 %, the traffic saved isn't worth one more path to maintain that can go wrong.
- The kept patches are written into `dist/`, `SHA256SUMS`, and `update.json`:

```json
"patches": {
  "arm64": [
    { "from": "<SHA-256 of the 1.1.0 APK>", "fromVersion": "1.1.0+10201200",
      "name": "dsh-go-1.2.0-from-1.1.0-arm64.dshdelta", "size": 13278848, "sha256": "<SHA-256 of the patch>" }
  ]
}
```

- With no patches there is no `patches` field; `--delta-from 0` doesn't go online and produces no patch. Older app versions don't recognize this field and download the full package as usual.

`publish-release.sh` uploads every file in `SHA256SUMS` (APKs and patches) to every route and downloads each back to verify; all three manifests (R2 `beta/update.json`, the public bucket `dl.dshtui.com/update.json`, GitHub's `update.json`) carry the same `patches`. The GitHub Release body notes that `*.dshdelta` doesn't need to be downloaded manually.

## App-side rules (contract)

1. **Select**: in this flavor's `patches`, the one whose `from` equals the SHA-256 of the installed APK (`ApplicationInfo.sourceDir`). If there is none, download the full package.
2. **Address**: a patch has no `url`. On every route it's in the same directory as the APK (public bucket `download/<version>/`, R2 `beta/<version>/`, GitHub Release, Hong Kong bucket `<version>/`), derived the same way as the APK address: replace the filename in the APK address with the patch's `name`; when the APK in the manifest has no `url` either, it's GitHub's tag + filename.
3. **Download**: resume and switch sources just like the APK; after downloading, verify the patch itself against the manifest's `size` and `sha256`.
4. **Before applying**: the header's magic is `DSHDLT01`; the old APK's SHA-256 is computed on the spot and equals the one in the header; the header's target SHA-256 and length equal the manifest APK's `sha256` and `size`.
5. **Apply**: stream-read the patch, read the old APK per COPY, and write to a temporary file; stop immediately when the amount written exceeds the target length. Only one copy buffer is needed (1 MiB in the reference implementation).
6. **After applying**: if the length and SHA-256 both equal the target, treat it as a downloaded full package and proceed with the signature pre-check and PackageInstaller installation as usual.
7. **Fallback**: if any step above goes wrong (not found, download failure, verification failure, the old APK unreadable, unknown op, out of bounds, result mismatch), delete the patch and the half-finished product, **download the full package for this update**, and don't try other patches. A patch saves traffic; it isn't a source of correctness.
8. **Space**: both the patch and the assembled APK must fit; if they don't, download the full package directly.

Security is unchanged: the assembled file must equal the manifest APK's SHA-256, and the subsequent signature pre-check and system verification are done in full. A tampered patch only assembles a mismatching file and then falls back to the full package; `from` is used only to pick a patch and is not trusted.

## Measurements and expected sizes

Measured on the release machine (the arm64 package from 1.0.7 → 1.0.8, full package 205,180,162 bytes; the 1.0.7 fetched back from GitHub matches the local copy, and so does the patch):

| | Bytes | Share of full package |
|---|---|---|
| **Patch 1.0.7 → 1.0.8** | 175,478,829 (167.3 MiB) | 85.5 %: over 60 %, not published |
| of which the runtime `assets/runtime/rootfs-arm64-v8a.tar.xz` (1.0.8 changed the runtime) | 158,284,672 | 90.2 % of the patch |
| of which `lib/arm64-v8a/libapp.so` | 13,108,813 | |
| of which `classes.dex` | 3,536,553 | |
| of which `resources.arsc`, `libdartjni.so` ×3, `META-INF/` signature, a few resources (27 entries in all) | 433,798 | |
| of which local headers, Signing Block, central directory (structure) | 99,121 | |
| of which operation headers (607 COPYs) | 15,872 | |
| 607 entries copied as is | 29,717,205 | |
| **Estimate: only Dart code changed (only `libapp.so` changed)** | ≈ 13,278,848 (12.7 MiB) | ≈ 6.5 % |
| Estimate: `libapp.so` + `classes.dex` (plugin or Kotlin changed) | ≈ 16,815,401 | ≈ 8.2 % |

- Estimate = the compressed data of `libapp.so` (and `classes.dex`) + the v1 signature files that change every time (`META-INF/MANIFEST.MF`, `CERT.SF`, about 55 KB) + structure + operation headers. An actual release usually also carries a few resources, adding tens to hundreds of KB.
- Time and memory: `make` 0.7 s, `apply` 0.3 s (files in the page cache), peak memory 22 MB; reads and writes are streaming, independent of APK size.
- The runtime is **one** whole-compressed `.tar.xz` (stored in the APK): change a little inside and xz's output differs throughout, so that entry can only be re-sent whole. So versions that change the runtime always go with the full package; to let runtime updates go with small patches in the future, the runtime would have to be split into several entries (separating the base system from frequently changing packages), which is a separate matter.

## Why per zip entry, rather than bsdiff / zstd

- **The bulk of an APK is compressed data already** (deflated `.so`, `.dex`, the xz runtime). Change the content a little and nearly all the compressed bytes change; running bsdiff / `zstd --patch-from` directly on the APK finds little in common; doing it well requires decompressing first, diffing the raw content, and then recompressing with exactly the same parameters as the build to get a byte-identical result (which is what Google's archive-patcher does), and one differing byte in recompression breaks the signature, which is complex and fragile.
- **Unchanged entries are byte-for-byte identical**: the same input builds the same compressed data (1.0.7 → 1.0.8 has 607 entries copied as is). COPY per entry already captures the main benefit, and a typical Dart release is only 6–8 % of the full package.
- **No native dependency on the app side**: only COPY / DATA operations, about a hundred lines of Dart or Kotlin; bsdiff needs bzip2 and JNI, and zstd requires shipping a native library.
- **Streaming, small memory**: reads the patch in order and the old APK by offset, needing only one buffer's memory; `zstd --patch-from` loads the whole old file into memory as a dictionary, so a 200 MB APK needs a window of hundreds of MB, and gets killed on low-end phones.
- **Small error surface**: it's already applied and verified at generation time, the app side ultimately trusts only SHA-256, and the simpler the format the less likely to assemble wrongly.
- **Cost**: when the change lands inside a large entry (e.g. the runtime), the patch is about as big as the full package. This is exactly the case the 60 % threshold handles: no patch is published, and the full package is used.

## Tests

`python3 -m unittest discover -s tooling -p 'test_*.py'`

- `test_apk_delta.py` (temporarily generated zips): unchanged entries → COPY, changed entries → DATA, entries reordered → COPY out of order by old position, stored versus deflated (same name and CRC but changed compression method → DATA), same header fields but different bytes → DATA, round trips in both directions byte-identical, the layout of the header and operation stream, a wrong old APK rejected, and corrupt / truncated / out-of-bounds / wrong-magic patches raising errors leaving no file behind.
- `test_release_assets.py` (fake `gh`, no network): patch naming and manifest fields, patches over 60 % dropped, taking the latest few published versions (excluding this one), using the cache after one download, re-download when the cache is corrupt, an APK that doesn't match that version's `SHA256SUMS` rejected, and a `--delta-from 0` hint when `gh` fails.
- `npm run smoke:publish` (`services/share-worker`): a fake dist includes a patch, confirming it's uploaded to every route like the APK, downloaded back to verify, and appears in all three manifests.
