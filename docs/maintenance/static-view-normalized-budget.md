# Normalized byte budget for static views

Refs W17-B, no corresponding public issue. Base a1928136c2429d967b5442e1f9a74963800a5836.

The native bridge's view value budget is 32768 bytes (stats.bytes / the UTF-8 length of JSON.stringify(view)), not the total length of the whole HTTP response envelope. The on-disk size check for static files is still kept, but JSON.parse/toJson can change the representation length; for example, the number `1e20` normalizes to 21 decimal digits. The static path now also checks the normalized JSON byte count before publishing to the cache, making it consistent with the dynamic views' existing byte budget.

Exceeding it still returns HTTP 500 / invalid-view, with no new violation counter. The existing plugin-error path for objects that can't be normalized, and JSON number and own-key semantics, are unchanged. Exactly equal to the budget is allowed, and the existing node/depth hints and limits are unchanged too. This fix doesn't handle concurrent file replacement or read races.

The real HTTP test uses the production NativeCore, routes and toJson; the Loader identity follows the existing module fixture; it isn't a full Cordis plugin or Android-side test. The legal object contains a number in scientific notation: raw 8052 bytes, normalized 35252 bytes; the original route returned 200, the candidate 500; nodes 1/depth 1. This evidence proves a gap in the general JSON budget and doesn't claim that this arbitrary metadata field is an app component rendering contract. The full static-view-cache module covers exactly 32768 bytes, normal under-budget, repeated reads, recovery after fixing the file, dynamic views, objects that can't be normalized, and old cache behavior.

This bridge source file is a runtimeVersion input, so it changes runtimeVersion. Not compiled for Android; actual rendering in app components, real devices and PRoot not verified. sync-bridge was not run, and app-generated assets were not hand-edited; the bridge/lib sync is done by the owner's current pipeline.
