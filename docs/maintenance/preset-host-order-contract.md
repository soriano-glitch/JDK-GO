# The SDK keeps the Host's Agent preset order

Refs W17-B; no corresponding public issue number. Base 63e255fab5cb9d817af30b631c3643ccce8e9231.

The official agent-preset's order is an optional number. registry.list sorts by order (default Infinity), and by id on ties; agentPresets/list returns the authoritative order and isDefault. The public contract of the SDK's listAgentPresets is also the Host order, and it should not re-sort based on a narrower display DTO.

Only the SDK's secondary sort is removed. The DTO order stays int?: legal decimals are still not represented as integers, but no longer affect the returned order; no new protocol, and no changes to the default selection, diagnostics, names or other fields. The Host's decimals, larger explicit orders, id tie-breaks for equal orders and the order of omitted values are all kept as is.

Ordinary tests use the existing public DshClient/FakeDsh test facilities to lock the consumer contract; the real manual live test uses the official WebHost, its own declarative presets, actual RPC and DshClient, without faking the Host ordering. The two unsorted fake rows in the original features_api_test are changed to the real Host order, and the original expectations and other behavior are kept. The ordinary empty-roster control doesn't need to delete the Host's built-in presets.

Does not change runtimeVersion; not compiled for Android. No remote model, real account or device acceptance; the live test's long-running Host is wound down by SIGTERM in finally and can't be said to exit naturally on its own. This change only fixes the client's returned order and doesn't claim the order DTO supports every JavaScript number.
