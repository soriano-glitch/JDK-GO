# @ccch1mneyyy/dsh-media

JDK-Go's host-side media plugin, version `0.3.0`. It provides image generation, editing images with one sentence, and background video generation; service keys stay in Host credentials, and originals are saved to the current workspace. The settings namespace stays `dsh-media`, and media results use the frozen `meta["dsh-go/media"]` v1.

0.3.0 declares compatibility with DSH `0.2.1-rc.4` and `0.2.2-rc.1`; verification uses each version's existing runtime lock and doesn't re-resolve production dependencies. For the actual verification scope and what is unverified, see `VERIFICATION.md`. Model availability, moderation, quotas and the final cost are decided by the provider. The app has built-in settings and media display entries, while the host plugin is still installed separately; this change doesn't publish to npm, preinstall or auto-enable the plugin, and doesn't call real paid services.

## Supported scope

| Service / profile | Images and editing | Video | Cancellation |
|---|---|---|---|
| OpenAI / `openai-gpt-image` | GPT Image 2, 2.5 Sunburst / Flare; single-reference-image editing | None | A synchronous request that stops waiting doesn't mean the provider stops billing |
| Gemini OpenAI-compatible / `openai-compatible` | Gemini 2.5 Flash Image, single image, explicit `b64_json` | None | Same as above |
| Volcano Ark / `ark-image`, `ark-video` | Seedream 5.0 Pro; single-reference-image editing | Seedance 2.5 text-to-video / single first-frame image-to-video | Only queued, with a real DELETE followed by a query to confirm |
| Alibaba Cloud Bailian / `ali-wan-image`, `ali-video` | Wan 2.7 Image; single-reference-image editing | Wan 2.7 text-to-video / single first-frame image-to-video | Only PENDING, with a real cancel request followed by a query to confirm |
| SiliconFlow / `silicon-image`, `silicon-video` | Qwen Image; Qwen Image Edit 2509 single-reference-image editing | Wan 2.2 T2V / I2V | The current official API provides no cancellation; stopping the local wait may keep charging |

The exact model IDs, addresses, parameter allowlists and official sources are in `data/models.json`. This version opens only the documented subset, which doesn't represent the provider's full capabilities. Seedream Lite has stopped new purchases, so the officially listed Pro replacement model is used; Lite's group-image fields that Pro doesn't support are not sent. [Ark deprecation notice](https://docs.volcengine.com/docs/ark/model-deprecation-notice?lang=en)

When no service is enabled with credentials configured, no generation tools or system prompt are registered. `edit_image` appears only when a model supporting editing is configured. Native services accept only the HTTPS hosts and paths verified in the catalog; OpenAI-compatible services can be configured with an HTTPS API root path, and still undergo public-address and download-safety validation.

## Configuration

Three steps to get started:

1. **Add a service**: choose image or video from the provider presets (Volcano Ark, Alibaba Cloud Bailian, SiliconFlow, OpenAI, Gemini). The service ID, request protocol, API root, response format and model ID are filled in from the preset, with no need to spell them by hand. Create one service each for image and video; the image and video of the same provider can share the same credential.
2. **Enter the API key**: the new app automatically generates a credential name for each service (for example, Ark image and video both use `DSH_MEDIA_ARK_API_KEY`, and the same provider reuses the same one), and the key only needs to be saved once in the service details; under "Advanced" you can also change it to any configured env-style credential name to reference an existing key. The legacy four fixed slots `DSH_MEDIA_SLOT_1_API_KEY` through `DSH_MEDIA_SLOT_4_API_KEY` still work but are kept only for compatibility, and the new settings don't need them filled in again.
3. **Enable**: choose the image default service and model and the video default service and model separately, check the cost protection, and enable. `generate_image` / `edit_image` use the image defaults, and `generate_video` uses the video defaults; when a type default can't be resolved, it falls back to the legacy generic `defaults.serviceId` / `defaults.modelId`, then to the first available candidate.

Presets come from `presets[]` in `data/models.json`, and the app reads them through the service's catalog metadata; older apps ignore this field, and existing configurations and legacy generic defaults keep their original behavior.

For example, Ark image and video services (references only, no key):

```yaml
services:
  - id: ark_image
    enabled: true
    provider: ark
    baseUrl: https://ark.cn-beijing.volces.com
    profile: ark-image
    models: doubao-seedream-5-0-pro-260628
    keyRef: DSH_MEDIA_ARK_API_KEY
  - id: ark_video
    enabled: true
    provider: ark
    baseUrl: https://ark.cn-beijing.volces.com
    profile: ark-video
    models: doubao-seedance-2-5-260628
    keyRef: DSH_MEDIA_ARK_API_KEY
defaults:
  imageServiceId: ark_image
  imageModelId: doubao-seedream-5-0-pro-260628
  videoServiceId: ark_video
  videoModelId: doubao-seedance-2-5-260628
budget:
  dailyCny: '20'
  unknownPriceHoldCny: '20'
limits:
  maxImages: 1
```

Both Bailian profiles have the root address `https://dashscope.aliyuncs.com`, and the catalog-declared Beijing workspace address is also supported. SiliconFlow is `https://api.siliconflow.cn`; OpenAI is `https://api.openai.com/v1`. The Gemini-compatible root address is `https://generativelanguage.googleapis.com/v1beta/openai`, with `responseFormat: b64_json`. For other profiles leave `responseFormat` empty; the presets already contain the values above.

## Use and recovery

In ordinary chat you can ask for "draw a blue cat", "use this reference image to change the background to night", "generate a 5-second video". Generation mode reuses the ordinary user-message parameter header, without adding commands or custom session events. The parameters available for video depend on the model; SiliconFlow currently opens only size mapping, and doesn't guess seconds or resolution fields. First-frame image-to-video omits `aspect`.

After `generate_image` / `edit_image` completes, it returns the actual file and v1 metadata. `generate_video` immediately returns a `rid` and a background job: the real `ctx.jobs` tracks queued, running and terminal states, the completion notice wakes the Agent, and `get_media_result(job_id)` is then called to get the final media card. The plugin doesn't call `jobs.wait` and doesn't forge session events itself. v1 has no independent cancelled status; confirmed cancellation uses `status: failed` and `error.code: cancelled`; unconfirmed remote cancellation uses `remote_may_continue`.

After a Host restart, the original session can call `resume_media(rid)` to continue querying the saved provider task ID. Recovery doesn't create a new provider task and doesn't reserve cost again; it accepts only the original session, workspace, service endpoint, credential reference and model identity. A completed local index can be reused directly. This version is **explicit recovery** and doesn't yet rebuild all jobs automatically; when a POST was accepted but the response was lost and there is no task ID, it can't be recovered automatically and creation is never retried.

Image originals are written to `<cwd>/generated/<UTC date>/`, and videos are the original MP4 (limit 300 MiB). Video width/height, duration and codec are read from the file header, not passed off as complete decoding verification. An MP4 codec that passes catalog validation doesn't mean every Android device can hardware-decode it. The Host's private index and budget ledger are at `<DSH_HOME>/media/dsh-media/`, contain prompts and task recovery identity, and should not be put into public diagnostic bundles.

A reference image is limited to an ordinary PNG / JPEG / WebP file within the currently writable workspace, at most one, 10 MiB. Symlinks, named pipes and paths outside the workspace are rejected. Each approval lists the actual path and the target service; the content is read and pinned before approval, and if the file identity changes after approval the submission is rejected and the replaced file is not uploaded.

## What cost protection actually means

Currently there is no sufficiently reliable pricing covering all input billing items, so **every image, edit and video requires explicit one-time consent**, and the card shows no made-up estimate. By default the local budget is ¥20 per day and each unknown-price request reserves ¥20; with the default settings, one day fits only one such reservation. Dates follow the Shanghai time zone.

A reservation is a local bookkeeping guardrail, **not a hard cap on the provider's actual amount**. The actual bill may be higher than the reservation. Lowering the unknown-price reservation lets more requests through and doesn't lower the provider's price. The ledger persists the uncertain state before committing, and failures, timeouts, cancellations or disconnections after acceptance all keep the reservation; this plugin doesn't claim refunds. Only a request clearly not yet submitted releases its reservation. The ledger's internal `basis: estimate` records local reservation settlement and isn't a verified provider quote.

Ark and Bailian may cancel only while queued. A cancel request and a status change may race, and only a later query clearly saying cancelled / CANCELED shows it as cancelled; while running, when the query fails or when the provider doesn't support it, a notice says the server may keep generating and charging. Paid POSTs are not retried automatically.

## Summary

`@ccch1mneyyy/dsh-media` is a Host-side DeepSeek Harness plugin. It keeps credentials on the Host, saves original media in the current workspace and emits JDK-Go media metadata v1. The settings namespace remains `dsh-media`. Node `^22.19.0 || >=24.0.0` and DSH `0.2.1-rc.4` or `0.2.2-rc.1` peers are required; the JDK-Go manifest declares app `1.0.2` or later.

It supports OpenAI / Gemini-compatible images, Ark Seedream / Seedance, Alibaba Wan and SiliconFlow Qwen / Wan. Editing uses one workspace image. Video generation runs as a real background job; `get_media_result` retrieves its media result after the completion notice. `resume_media(rid)` explicitly resumes a saved provider task in its original session without submitting again. Provider cancellation is confirmed only when the API reports it; SiliconFlow cancellation is unavailable.

All currently bundled prices are unknown. Every generation requires explicit one-time approval. The default CNY 20 daily ledger and CNY 20 per-request hold limit local reservations, **not actual provider bills**. Accepted or uncertain submissions retain their hold. Validation uses each supported runtime version’s existing pinned dependency graph; see `VERIFICATION.md` for current evidence. No paid-provider or Android App installation/media-viewer validation is claimed. The package is prepared for publication but this change does not publish or preinstall it.

Version 0.3.0 also publishes provider presets in the plugin catalogue. The App builds a service from a preset, writes any env-style credential name such as `DSH_MEDIA_ARK_API_KEY`, reuses one key for the image and video services of the same provider, and keeps separate image/video defaults. The four fixed slots remain for compatibility only, and a legacy `serviceId`/`modelId` default keeps its exact previous behavior.
