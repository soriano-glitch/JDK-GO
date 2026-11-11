# Non-HMR bundle updates keep the saved selection

Refs W17-B. Applies to the non-HMR overwrite-install path of the public PluginManager.updateBundle in DSH 0.2.2-rc.1.

Updating the version does not constitute a new enable request. A selection successfully saved by another public setBundleEnabled call during the registry check should be kept by the subsequent overwrite install. When no selection change happens, an originally enabled bundle stays enabled, and an originally disabled bundle stays disabled.

## Original implementation and the change

updateBundle read bundle.enabled before the registry check, and after the check passed the old value to installBundle. The change's profile/package.json file lock covers the actual install but not the earlier registry check. So after a successful disable during checking, the old enabled:true would call selectBundle(name,true) again.

A non-HMR overwrite install doesn't remove the bundle first, and has no need to change the selection. This change makes this branch call the internal installTarget(true), only adding a preserveSelection flag to the internal options. installBundle reads the latest on-disk selection inside the existing change lock, during the configure apply stage: if still enabled, it continues calling the original selectBundle(name,true) with its full platform, compatibility and bundle configuration checks; if disabled, it doesn't re-enable. HMR's installTarget() doesn't pass the flag, and failure recovery is unchanged. An ordinary installBundle doesn't pass the flag, and the original behavior is unchanged. The internal flag doesn't enter public types, the RPC schema or return values.

## Return fields

InstallBundleOptions.enabled is whether this install requests activation, not the final inventory state. ChangeResult.enabled keeps the optional boolean field originally recorded with the install request; other operations during the update can change the final selection, so it isn't the final inventory state. The final enabled state should be read from listBundles. The official Web's update flow re-reads the inventory; this round didn't change Web or the app, and doesn't claim to fix other update paths in the app's market.

The existing application/restart-required, packageResult, error and rollback semantics are kept. Version-check concurrency and HMR remove/install/restore races are outside this scope; the HMR source path is unchanged and not dynamically verified.

## Verification

runtime/tests/plugin-update-selection.test.mjs verifies six cases through the public manager, real pnpm, its own localhost registry and an ordinary response gate: initial on/off unchanged, a successful disable during checking, a successful enable during checking, and a new version for an unsupported platform still being rejected when enabled while still installable without activating when disabled. No private method replacement, sleep scheduling or real accounts. The initial install directory is a valid bundle prepared by the test, and the upgrade is performed by real pnpm; the empty bundle patch only verifies the persisted selection and doesn't prove the plugin's actual loading effect.

Changes runtimeVersion. Not compiled for Android. Formal enable/disable on the device, the selection after restart and HMR are still to be verified locally.
