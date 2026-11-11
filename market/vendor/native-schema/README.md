# Native protocol JSON Schema snapshot

Source: the private dsh-app repository `4f03e98e`, `sdk/plugin-kit/schema/*.json`, SDK version 0.1.0, MIT (LICENSE in the same directory). The original file contents are kept, for use by the standalone market repository after the split, without depending on private repository paths.

The checker uses only the manifest schema to judge the structure of the `package.json.dshGo` in a package; the other schemas are its referenced dependencies. A package is marked adapted only when the manifest passes and the source protocol identifier is also present; this is a static declaration check and doesn't mean runtime adaptation tests pass. On a protocol upgrade, sync from the SDK and re-run the market tests.
