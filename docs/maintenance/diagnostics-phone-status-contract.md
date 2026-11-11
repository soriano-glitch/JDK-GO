# Phone control diagnostic status

Refs #570. The diagnostic bundle and the diagnostic Markdown inside the engine sample using the existing read-only `status` call of `dsh/phone`; they don't use the UI cache that may not be subscribed, don't turn on phone control, don't request permissions, don't read the screen, don't trigger root/Sui operations, and don't add platform methods.

`summary.json.phone` is a fixed set of fields: `available` means this native status read was available; when available, it also records `enabled`, `bridgeListening`, `a11y.enabled` and `a11y.serviceConnected`. Unavailable, exceptions or timeouts record only `available:false`, and whole-call unavailability is not written as accessibility being off. The read uses the diagnostics collection's existing 5-second limit and degradation logic and must not block other diagnostic content. This sequential read adds at most one more 5-second wait; a Dart timeout doesn't cancel the underlying status query, and a late return value won't rewrite a snapshot already formed.

It depends on the complete field contract of the current 63e native `PhoneControl.status()` and the existing `PhoneStatus` decoding; its boolean default rules are unchanged, and it can't claim to detect missing fields in arbitrary old/incomplete Maps. `a11y.enabled` is the enabled state in system settings, and `serviceConnected` is the fact that this process has a registered main-screen driver connected; it doesn't prove gestures will succeed.

Only these five booleans are exported; task descriptions, app names, the screen, the clipboard, interjections and native error text are not. The Markdown uses the same sample result. The status is a local snapshot taken while generating the report, not a record taken at the same time as a failed tap, and doesn't describe the accessibility state of a remote host; the generation time reuses that of the whole diagnostic snapshot, and the sources are not guaranteed to be sampled atomically.

This item adds observability; it cannot be used to claim #570 is fixed. Does not change runtimeVersion; not compiled for Android.
