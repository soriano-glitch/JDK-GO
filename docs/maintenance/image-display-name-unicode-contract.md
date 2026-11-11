# Unicode boundary for image display name truncation (679)

Base 63e255fab5cb9d817af30b631c3643ccce8e9231, DSH 0.2.2-rc.1. Refs W17-B: found this round through the real public image storage API; no corresponding public issue number.

The image display name still takes the last path segment, removes control characters and trims, keeping at most 255 UTF-16 code units; the behavior of omitting the name when it is missing or empty after cleaning is unchanged. If the truncation point falls exactly in the middle of a valid surrogate pair, it backs off one unit; it doesn't return half a character, doesn't add an ellipsis, doesn't widen the budget, and doesn't switch to a filename byte budget. The existing UTF-8 storage leaf-name rule of fileLeafName is unchanged.

Image objects are still stored by content hash. The display name belongs to the returned reference metadata, and readImage returns the display field as is per the existing convention; this fix doesn't add a name-side file, doesn't modify the content hash or image bytes, and doesn't rewrite references in existing Sessions. A single save/read passing can't be described as the app/model or Session having been fully verified as consumers. It only guarantees that when a new legal complete Unicode name is received, truncation won't create a new lone surrogate; originally corrupted input is outside this fix's cleaning scope.

Changes runtimeVersion; pins/version are recorded by the owner. Not compiled for Android; PRoot/ARM/real devices were not run.
