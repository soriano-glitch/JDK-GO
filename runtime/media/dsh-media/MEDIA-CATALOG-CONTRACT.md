# MEDIA-CATALOG-CONTRACT · v1 / plugin 0.3.0

This file is the contract for how the app reads the plugin's catalog and configuration; it doesn't modify the frozen tool/result.meta["dsh-go/media"] v1. Status: the plugin 0.3.0 Node tests have passed; for the 0.2.0 real rc.4 headless results see VERIFICATION.md, and headless was not re-run for 0.3.0. The real settings RPC, the app and real devices are still UNRUN. The source locations in §2 and §5 are taken from DSH 0.2.1-rc.2 (git 687f282e8625c6b8d11ff58211a90524be2e4317) and the 2026-10-28 app source, and line numbers may shift later.

## 1. The only catalog location

The catalog sits on the services field itself in the plugin namespace schema:

    schema.fields["services"].meta.extra["dsh-go/media/catalog"]

This is the SchemaNode access location after the app parses it. The raw Schemastery JSON uses a {uid,refs} graph structure, so one must not hardcode a path from the JSON root dict or fixed numeric uids. First parse the graph, then find services. Because this candidate's services is transform(array), the catalog is in the outer services.meta.extra, and one can't read only services.effective.meta.extra; the effective array doesn't necessarily carry the outer metadata.

Catalog shape:

    {
      v: 1,
      revision: "2026-11-01.0.3.0",
      asOf: "2026-11-01",
      contract: "dsh-go/media/catalog",
      capabilities: {tools:["generate_image","edit_image","generate_video","get_media_result","resume_media"],commands:[],image:true,video:true,edit:true},
      limits: {maxN:4,promptUtf8Bytes:4096},
      availability: "...",
      sources: [...],
      models: [...],
      presets: [...]
    }

0.2.0 adds the optional video fields `durations`, `resolutions`, `videoSizes`, `defaultSize`, `requiresRef`, and the edit-only `editOnly`. `profiles` gives the verified native endpoints, queryPath and cancellation capability; these are Host adaptation data, and the app or model may not pass arbitrary API fields. Durations/resolutions not listed must be omitted and defaults must not be guessed. A catalog without prices means price unknown.

models contain id, label, kind, profile, ratios, sizes, aspectSizes, qualities, maxN, maxRefs, edit, extend, upscale, sources. A missing price means no reliable price list was provided. The boolean capabilities and maxN are the subset the plugin opens; it must not be inferred that the provider has no other capabilities.

The optional responseFormats field: when present, it is the allowlist of return formats the model's service configuration must explicitly choose from; when absent, the profile's existing rules still apply, and GPT Image must omit responseFormat. It isn't a tool parameter and doesn't authorize the model to change the service's return format. An empty array of ratios/sizes/qualities and an empty aspectSizes mean the plugin hasn't opened verified values; the app should allow omitting that parameter, not create a default, and not show an empty selector. When the selected model's maxN=1, 2–4 images can't be shown as available based on the catalog's top-level maxN=4.

### presets (new in 0.3.0, optional for the app)

The root node's `presets` is an optional array of ≤16 items providing "new service" templates. Each item's fields:

    {id, label, labelEn?, provider, profile, baseUrl, responseFormat, models, kind, keyGroup}

- `id` and `keyGroup`: `^[a-z][a-z0-9-]{0,31}$`, `id` unique. Image and video presets in the same `keyGroup` are expected to share the same credential.
- `label` is non-empty Chinese ≤80 bytes; `labelEn` is optional non-empty English ≤80 bytes; `provider` is for display only.
- `profile` must belong to the catalog's `profiles` (or the built-in `openai-compatible` / `openai-gpt-image`); `baseUrl`, like a service, accepts only HTTPS, with no credentials, query or fragment, and a native profile must also fall within the host or workspace suffix declared in the catalog.
- `responseFormat` is `"" | "url" | "b64_json"`; anything other than `openai-compatible` must be empty.
- `models` is 1..16 catalog model IDs, which must agree with the preset's `profile` and `kind`. The app should still intersect with the installed catalog and the current service value, and not trust the preset alone.
- `kind` is `image` or `video`.

The app can use a preset to fill in the service ID, protocol, API root address, return format and model list; it still validates per this contract before saving. The 0.2.x catalog doesn't have this field: when `presets` is missing or invalid it should ignore the presets and fall back to the manual flow, rather than make the settings page unusable. Unknown fields are ignored.

### defaults (extended in 0.3.0)

`value.defaults` adds, beyond the old `serviceId` / `modelId`:

    {imageServiceId, imageModelId, videoServiceId, videoModelId}

All four fields are optional strings, and an empty string means unset. `generate_image` / `edit_image` use the image default service and model first, and `generate_video` uses the video default service and model first; when the type default can't be resolved, it falls back to the old `serviceId` / `modelId`, then to the first available candidate. The behavior of configurations that write only the old `serviceId` / `modelId` is unchanged. The app should bind defaults to the Host / namespace / service / model identity at initiation; a missing field is treated as empty, and the old service isn't inferred.

The default bundle's entry ID is dsh-media, but a Host may name the instance differently. The client should discover it among the selected Host's settings namespaces by the metadata contract, keeping the namespace identity; multiple instances must not be merged by the same label.

## 2. What the source chain has confirmed

| Step | Exact location (DSH rc.2; those marked App are app source) | Conclusion supported |
|---|---|---|
| metadata write | vendor/schemastery/src/index.ts:385–388 | extra(key,value) merges into schema.meta; this candidate uses extra('extra', {...}) |
| JSON serialization | same file:311–321 | toJSON serializes with schema attributes and refs, and plain JSON extra is kept |
| volatile projection | packages/settings/settings/src/schema.ts:plainSchema / volatileForm | services itself is volatile, so the whole services schema is cloned, removing only the volatile marker and secret defaults; extra isn't deleted |
| root field filtering | same file:volatileForm | a non-volatile root object is rebuilt, and root metadata may be lost; so the catalog isn't placed on the root |
| actual describe | packages/settings/settings/src/index.ts:302–331 | descriptor.schema=form.toJSON; value/base/user are each projectForm'd, and metadata isn't mixed into these values |
| RPC projection | packages/api/settings-controller/src/index.ts:namespaceView / describe | descriptor.schema is output directly as JSON, without further filtering extra |
| App graph parser | packages/dsh_client/lib/src/engine_settings_api.dart:132–187 | parses uid/refs and builds a SchemaNode |
| App metadata parser | same file:58–80 | unknown meta keys are discarded, but map['extra'] is explicitly kept |
| App namespace | same file:387–402 | the schema is parsed into a SchemaNode; one can't assume the original JSON is still kept |
| lifecycle | vendor/loader/src/index.ts:29–34 | volatile-update notifies the owning instance after the reference is committed |

So "any JS property can be attached" is not the basis for adopting this path; serialization, form filtering, RPC and the app parser have been read layer by layer. The real SettingsForms/describe or Flutter parsing tests have not been run yet, and the conclusion is limited to this fixed-version source chain.

## 3. Requirements for the app-side reading

The app-side implementation is in `app/lib/state/media_catalog.dart`. The existing SchemaMeta.extra already keeps the catalog, and there's no need to modify the handling of unknown meta for this path. The app (M5) reading must satisfy:

1. Take this contract from services.meta.extra, validate v and basic types, and keep the namespace, Host and connection generation.
2. Read the real service configuration value.services, and intersect by enabled, profile and that service's allowed models list; when necessary go through the public credentials.describe to judge whether the keyRef is configured. Don't treat the static catalog's existence as the service being available.
3. Render the parameter header with the same grammar as header.js. Refuse when an explicit parameter is unsupported; 3:4 must not be changed to 2:3, and a same-named model must not default to the first service.
4. Models with the same label are disambiguated with 〈serviceId/modelId〉; the label and the marker must both match. The catalog provides the actual model ID, and display names must not be used to guess IDs.
5. Requests, later display and defaults are all bound to the Host / namespace / service / model identity at initiation, and after waiting must not re-fetch the default target for a new Host.
6. 0.3.0 opens images, editing and video according to the catalog and the currently configured services. video=true can't replace validation of service credentials and model availability; with no usable video service, no executable video choice is shown.
7. Optionally read `presets`, `defaults.image*` / `defaults.video*`: when fields are missing, have the wrong type or the catalog `v` is unknown, ignore them and fall back to manual configuration without blocking old-version reads. Before saving a service, the app still validates the values provided by `presets` per this contract.

When catalog.v is unknown or fields are corrupt, stop the generation-mode selection and keep the ordinary chat tool path. When the catalog is missing, it may show that the current Host provides no catalog, and doesn't guess from the app's built-in old model table. If a new location or structure is needed in future, use a new version and an explicit migration; this draft doesn't treat the old candidate value.catalog as an authoritative fallback.

An old app doesn't need to read this catalog to send ordinary chat; tool results are displayed with the existing Markdown image fallback. The dedicated generation mode and exact tool selection still need end-to-end verification with a real Host.

## 4. Why the catalog isn't a const configuration value

A const+volatile+disabled value.catalog has a real upgrade counterexample: the client explicitly writes C1 into the raw config, the upgrade package's schema changes to const(C2) with C1!=C2; the old explicit value doesn't take the default branch, and the const validation fails. disabled only controls the UI and doesn't provide Host write protection.

This candidate has no catalog configuration field. The catalog exists only in schema metadata, and the ordinary values of services/defaults/limits/budget/credentials contain no catalog. The settings describe's value/base/user, replacement forms and user overrides should not carry the catalog; upgrading replaces only the installed JSON and schema metadata, without migrating persisted catalog values. A regression of "old version wrote an ordinary service configuration → upgrade the catalog → still starts" should be added to real settings integration tests, rather than only asserting a button is disabled.

## 5. Fixed credential slots and rejected designs

### A secret in an array is unusable

The app's schema_fields.dart:kindOf recognizes array<object> as objectList. But field_sheets.dart:_ObjectItemPage._draftField:1539–1596 edits only toggle/choice/text/number, and other types including secret are disabled rows. So the services array holds only ordinary configuration; one can't claim that the secret button in an array works because a SecretFieldTile exists at the top level.

### The variable credential editor was rejected

An earlier candidate used an ordinary keyRef input plus a transform generating a hidden credentialRef, with the secret reading the sibling. On the normal path _AcknowledgedSheet._save waits for the service's acknowledgement before closing; SettingsEditSession._checkSecretTarget also compares the old/current references and rejects an old secret sheet whose target has changed.

But if the user dismisses while the keyRef write is pending, the optimistic keyRef and the server-derived credentialRef may temporarily differ; merely saying "wait for the save to finish" can't remove the window of writing to the old target. This candidate doesn't have that dynamic editor.

### The current four slots

credentials is an ordinary object group; slot1–slot4 each have a fixed const credentialRef, DSH_MEDIA_SLOT_1_API_KEY and so on. The secret is a leaf node, and its target never changes with the services array. A service's keyRef is explicit ordinary configuration, referencing a slot or an existing reference the user knows.

SecretFieldTile (schema_form.dart:404–457) constructs a SettingsEditSession; the controller (engine_settings_state.dart:418–442, 776–815) first checks the source and the target, then writes Host credentials through client.setProviderKey / clearProviderKey. It doesn't save the real key into config.

Writing the secret directly as const('') also has a wrong-echo problem: errors thrown by Schemastery's const resolver contain the got value (657–659). It was changed to a strict empty-string validation with transform(any), where a non-empty value throws only a fixed Chinese error. Wrapping it with intersect is also unusable: the app's schemaSections:555 gives priority to treating intersect as a group. The current transform's effective any is a leaf; kindOf sees the outer secret role first, so the secret button path is kept while all non-empty ordinary configuration writes are rejected.

These are design reasons supported by fixed source; actual button taps, credential persistence, app reconnection and settings reload remain to be run. The Node tests have passed, covering non-empty rejection with the error not containing a fake key, the fixed reference being unchangeable, and secret redaction.

Since 0.3.0, `keyRef` can be any configured env-style credential name (for example `DSH_MEDIA_ARK_API_KEY`); the new app can create that credential per provider before writing the service. The fixed four slots are still kept, and old configurations need no migration. The Host still resolves only by the explicit `keyRef`, and doesn't enumerate other plugins' credential channels.

## 6. Key reuse boundary

A known CredentialRef can be resolved by credentials.resolve against the Host's actual provider, possibly coming from persisted credentials, the environment or a dotenv fallback. M0 doesn't interpret unset as "definitely no key" across the board.

This isn't equivalent to automatically enumerating all identities of llm-pi-ai's currently selected channel. The latter also involves instance, provider, endpoint, authentication method and scoped credential records. M0 allows only users to explicitly fill in known refs, doesn't peek at other plugins' scoped grants, and doesn't silently switch to another key that "looks configured".

## 7. Catalog sources and dates

On 2026-10-28 the following official pages were opened and searched (the V labels in the design documents were not carried over):

- https://developers.openai.com/api/reference/resources/images/methods/generate
- https://developers.openai.com/api/docs/guides/image-generation
- https://developers.openai.com/api/docs/models/gpt-image-2.5-sunburst
- https://developers.openai.com/api/docs/models/gpt-image-2.5-flare
- https://ai.google.dev/gemini-api/docs/openai (read in full; the page is marked Last updated 2026-10-26 UTC, has no fixed version, and isn't treated as a permanent protocol guarantee)

The exact three OpenAI model IDs are listed on this Image API page; the three standard sizes and low/medium/high are the verified subset. GPT Image returns base64 and doesn't accept the old response_format. The pages contain more sizes, qualities and capabilities, which this M0 data hasn't fully opened. Prices and account permissions are unverified, and the catalog doesn't provide them.

The catalog also contains a minimal compatible entry for gemini-2.5-flash-image, with profile=openai-compatible, responseFormats=[b64_json], maxN=1 and empty sets for the other optional parameters. It is based on the request shape of "Generate an image" on the Gemini page above (model, prompt, n=1, response_format=b64_json, reading data[].b64_json), inferring only compatibility with the existing core in documented shape; no real request was sent, nor was account availability proven; no video, upload or extra_body is added.

## 8. Unrun acceptance

| Acceptance item | Current status |
|---|---|
| Actual Config / Schemastery / redactSecrets Node tests | 0.3.0 `npm test` 314/314 passed; for 0.2.0 rc.4 dependency details see VERIFICATION.md |
| Real Loader→SettingsForms→settings/describe graph→extra | Source chain verified, run UNRUN |
| Locating extra after the app SchemaNode is actually decoded | Source verified, Flutter UNRUN |
| Four-slot key write, clear, and rejection of non-empty ordinary settings | Node tests passed; real UI and Host persistence UNRUN |
| When changing a service's keyRef, an old fixed-slot sheet still writes to the original fixed target | Needs a real UI run, UNRUN |
| A catalog update doesn't freeze old values into user overrides | Supported by the source design, integration UNRUN |
| Same-name model markers, Host changes and suppressing old-catalog replies | In app (M5) scope, end-to-end UNRUN |
| The two headless cases, triggered by the actual generation parameter header / by ordinary phrasing | Passed under local mocks (the model is a fixed script and doesn't prove a real model); the event records are not checked in, and no fixtures were forged |

All test commands explicitly use TZ=Asia/Shanghai.
