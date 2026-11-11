# Error ownership for cancellation while reading the plugin detail body (658)

Base 63e255fab5cb9d817af30b631c3643ccce8e9231 / v1.0.11, DSH 0.2.2-rc.1. Before implementing, confirm the following existing behavioral boundaries; no protocol fields or error categories are added.

The request-stage catch of the public `fetchBody` already checks the caller signal first, then the service lifetime, and rethrows the original cancellation reason as is. The body stage should use the same order. When a normal call is cancelled before or after the response headers, it should not become `DetailFailure('network')` just because the stage differs.

This fix only adds the same check at the start of the body iteration catch. When neither the caller nor the lifetime is cancelled, real network disconnects, the network classification of the existing request deadline, too-large for an oversized body, and normal byte output are all kept. If both cancellations hold at once, the request stage's caller-first order is reused; no new priority is added.

Cancellation already makes the native fetch close the response; this is not a connection leak fix. The test uses real HTTP and the public fetchBody, observing the public iterator entry of the same Response and returning the original iterator, without reading extra bytes. The deadline control only fires a test-specific AbortSignal and doesn't wait a real 30 seconds; it can't be called natural wall-clock timeout acceptance.

plugin-manager's detail read uses this helper; it turns DetailFailure into detail-unavailable, and the image route maps network to 502. This upper-layer impact is source analysis only; the app display or actual CDN request results were not proven. No URL/permission/authentication, UI or build configuration changes. Not compiled for Android; PRoot/ARM not run.
