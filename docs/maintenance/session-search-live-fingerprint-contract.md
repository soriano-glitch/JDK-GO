# Immutable snapshot fingerprints for searching active sessions (665)

Base: 63e255fab5cb9d817af30b631c3643ccce8e9231 / v1.0.11, DSH 0.2.2-rc.1. Refs #444, #463, #370. This item reduces the processing cost of repeated searches after the index has been built; it doesn't promise to solve the first-frame parsing, Android jank or remote crashes in those reports.

## Existing ownership and invalidation contract

The official `Session` builds an independent log array for each instance. The parameterless `snapshotEvents()` returns the current complete immutable snapshot, reusing the same array until the next append; append invalidates that snapshot cache before publishing observation events. Old snapshots stay stable. The Session header and inheritedEventCount are immutable for the instance's lifetime. The restore path can take over exclusively owned events without physically deepFreezing every outer object; what's relied on here is the official immutability and ownership transfer contract, not the claim that all restored objects are deep-frozen.

`observeLive` can therefore use this accepted complete snapshot read-only. Each SQLite query engine uses one WeakMap, with the complete snapshot array as a weak key and the existing SHA256 fingerprint string as the value. An append, a new Session (even with the same ID) or a restore producing a different complete snapshot always recomputes the fingerprint; different query engines don't share this table. Table values don't hold strong references to detached events, search documents, Sessions or snapshots, and it can't on its own extend a snapshot's lifetime.

## Boundaries kept

Each observation still copies the header and rebuilds and validates the search document; the fingerprint is read or recorded only after the document is built successfully. The first fingerprint and those after changes use the original field order and algorithm. Cold sessions still go through the original `observeSession`, keeping its detach and recomputation. Persistent flag changes, persistence binding changes, deletion, generation and cursor checks are still decided by the existing outer logic and can't be skipped because the snapshot fingerprint is the same.

The search's `currentSessionMessageProjections` is a fixed set exported by format-catalog, different from the instance registry of `SessionStore.registerMessageProjection`. The latter's public register/unregister can't be written up as a proven fact that it changes the former; this item didn't create tests by modifying the exported array or private Session logs.

This fix adds no RPC fields, configuration switches, SQL materialization or disk cache. Search still needs to build semantic documents, run SQLite queries and process persisted sources; the whole search is not claimed to be O(1). The cache only saves the repeated copying of active events and the JSON serialization and hashing of the same complete snapshot; a few weak table entries and fingerprint strings still cost memory.

**Changes runtimeVersion. Not compiled for Android.** PRoot, ARM, real models, the app and real-device performance were not run for this item; desktop public service fixtures and cost counts can't replace them.
