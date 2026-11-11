# HMR updates capture the selection at actual removal

Refs W17-B, base 63e255fab5cb9d817af30b631c3643ccce8e9231. An enable/disable selection successfully saved during the public updateBundle's registry checking should be kept in this HMR update's target installation and failure recovery.

The original implementation captured enabled before checking; HMR then first removed (which deselects), and then installed/restored with the old value. This fix only writes the current bundle.enabled into this update's private short-lived holder inside removeBundle's existing change/configure locks, after the removability check and right before the actual deselect. After remove returns, update uses that value for the target installation or old-version recovery. An ordinary remove has no holder, and the original behavior is unchanged. No new RPC schema, public types, return fields or user settings.

The original platform/compatibility/selectBundle checks are kept; no unchecked forced activation is used. It only guarantees that a selection successfully made during checking is kept; the remove, install and restore stages each still hold their original locks, and the whole update is not claimed to be atomic. It doesn't resolve other operations between stages or concurrent version/deletion races, and doesn't cover non-HMR 660 or the version precondition 661.

The tests use the real dsh web CLI, the official timer/HMR/PluginManager/appReady/PluginPackages, the public management API, its own localhost registry response gate and real pnpm. No fake HMR/private fiber/callback. Empty bundles only verify management and persisted state, not actual Android tools. First the original four cases were 2 red, 2 green; then a control was added for old-version recovery after a real bad target bundle failed to install.

Changes runtimeVersion. Not compiled for Android. The actual business functions of the final HMR plugin and device installation are to be verified locally.
