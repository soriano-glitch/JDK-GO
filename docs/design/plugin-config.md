# The native plugin configuration page (PLUGIN-CONFIG)

> 2026-10-29. The app side is done and wired to the dsh-go bridge's `/dsh-go/v1/plugin-config` (interface in §2). The bridge route is implemented by the backend, and the app side is tested against a fake server.

## 0. Conclusion

- **DSH 0.2.1-rc.4 itself has no interface that can write non-volatile fields**, and can't even read them: `settings/describe` projects only `.volatile()` fields, and a plugin with no volatile field at all isn't returned at all; `settings/mutate` / `update` / `replace` reject any write to a non-volatile path. The web version likewise has only volatile (the backend's agreement §1 was re-checked on a real device).
- The full configuration goes through the **dsh-go bridge's v1 routes**, which internally call the host's existing `ConfigEditor` (validation, writing the profile `cordis.patch.yml` to disk, Loader coordination, failure recovery). DSH core's `settings/*` is not changed.
- The app has two data sources, chosen automatically:
  - **bridge** (`BridgePluginConfigApi`): used when the host provides `/dsh-go/v1/plugin-config`, where both ordinary fields and volatile fields can be changed;
  - **volatile** (`EngineSettingsPluginConfigApi`): used when the route returns 404 (no bridge, or the bridge version is old) or when the bridge can't be reached (relay), which is the earlier behavior: `settings/describe` + `settings/mutate`, all taking effect as soon as changed.
- **Only plugins enter this page (allowlist, deny by default, §7)**. The bridge lists the whole profile, DSH core is in it and all writable; the app lets through only "rows of bundles the user selected" — installed from the market / locally, and enabled official optional plugins — based on the fields of `pluginManager/listBundles`, not a namespace list. The list, state, page and write layer all follow this one rule, and core entries are not displayed, read or written.

## 1. Verification record (rc.4 package, read-only)

| Package | Key code | Conclusion |
|---|---|---|
| `@deepseek-ai/dsh-settings` | `volatileForm(schema)`: keeps only nodes with `meta.volatile`; in `describe()` entries with `form === undefined` are skipped directly; `plainSchema()` removes `meta.volatile`; `write()` first checks `isVolatilePath`, and throws for non-volatile | Read and write both cover only volatile |
| `@deepseek-ai/dsh-api-settings-controller` | Remote: `settings.describe/update/replace/mutate/openSettingsDocument`, `credentials.describe/set/unset` | All delegate to the settings service above, with no other write entry |
| `@deepseek-ai/dsh-config-editor` | `configEditor.edit(entry, change)`: validate → write profile patch → Loader coordination → failure recovery | Fully capable, but only an in-process service; the bridge plan is to wrap it as routes |
| `@deepseek-ai/dsh-client-ui-plugin-manager` | Calls only `pluginManager.*` and `pluginInventory.list`; configuration pages rely on the plugin registering into slots itself | The web version has no general form |
| `@deepseek-ai/schemastery` 3.18.5 | `.volatile()` is `meta.volatile = true`, which `toJSON()` carries out | Keeping it in the full schema lets the client judge per field how it takes effect |

## 2. The interfaces connected (the backend's agreement governs)

Base path `/dsh-go/v1/plugin-config`, reusing the bridge's authentication and route guards (not in openRoutes).

| Route | How the app uses it |
|---|---|
| `GET /dsh-go/v1/plugin-config` | Capability probe and catalog in one: 200 → bridge mode; a **404 without a code** → fall back to volatile. Entries carry `entryId`, `package`, `label`, `state`, `configurable`, `reason`. Ones with `configurable: false` get no entry; when opened directly, the reason is explained by `state` / `reason` (not enabled → "The plugin isn't running"; failed → "The plugin didn't start"; otherwise → "Can't be set here yet") |
| `GET /dsh-go/v1/plugin-config/<entryId>` | Read only when the page opens (one entry at a time, no bulk pulling when in the list). The schema is a `uid/refs` graph, live nodes carry `meta.volatile`; `revision` is an opaque string, sent back as is |
| `POST /dsh-go/v1/plugin-config/<entryId>` | `{revision, ops}`, with ops the same set / unset as `settings/mutate`. Live fields are sent as soon as changed; ordinary fields accumulate until "Save" and go out at once. A successful reply is the new entry (with the new revision), and the reply governs |
| `credentials/describe` · `set` · `unset` | Secrets with a `credentialRef` binding go here, a separate transaction from saving the configuration; after unset, describe again (there may still be an environment variable fallback) |

Error codes and the app's handling:

| Status / code | Meaning | App |
|---|---|---|
| 400 `invalid-operation` | The change is invalid, nothing written | "This change can't be applied", changes kept |
| 404 `entry-unavailable` | The entry is gone | "The plugin is no longer running, refreshed", re-read, and the entry and changes go with it |
| 409 `conflict` | The revision is stale | "Just changed elsewhere, refreshed", re-read, changes kept, can retry (with the new revision) |
| 409 `overridden` | Overridden by a higher layer | "Fixed by a configuration file", changes kept |
| 409 `apply-failed` | Coordination failed after writing, and the old configuration was **restored** | "Didn't take effect · original settings restored", changes kept, can retry / discard |
| 422 `invalid-config` | Validation failed | "Value is invalid", marked on that item when there's a `path` |
| 503 `host-unavailable` | The host is temporarily unavailable, nothing written | "Couldn't reach the engine" |
| 500 `recovery-failed` | Coordination failed, and **restoring also failed** | "Didn't take effect, and the original settings couldn't be restored", re-read; "Restore original settings" (the app computes the inverse from the user layer before saving and sends it with the new revision) or "Retry" is possible |
| Network timeout / disconnect | The result is unknown | "Connection interrupted, re-read"; before retrying, re-read first, **don't resend if it already landed**, resend only if it didn't; no automatic replay |
| Other statuses without a code | — | "The engine didn't accept this value" |

UI copy uses only the app's own words and doesn't display the message returned by the host (agreement §4.3: validation exceptions may carry the input content).

Progress: the agreement has no progress protocol (§4.3 "bounded states"), so in bridge mode the save bar shows only "Saving…", then "Applied" or a failure after the reply; no made-up "Reloading…" is shown. Before saving, the save bar already says "Reloads the plugin after saving".

Capability probe details: the probe happens once on the first catalog read of each connection; after a 404 this connection keeps using volatile, and it probes again after the host restarts (`HostReady`). A catalog read failure (not 404, such as 503) shows a read failure that can be retried, and doesn't silently downgrade.

relay: `/dsh-go/*` are HTTP routes that only the local machine and the SSH tunnel (`DshHttpCarrier`) can reach; the relay forwards only RPCs on its allowlist and can't touch these routes, so they **don't need and can't be registered**, and relay connections use volatile directly.

## 3. The superseded draft

The previous version of this document proposed changing the DSH core: adding `{scope:'all'}` to `settings/describe`, a new `settings/apply`, the error code `settings/apply-failed {rolledBack}`, an optional progress event `settings/apply-progress`, describe returning entries that failed to start (`phase: failed`), and relay allowing `settings/apply`. **None adopted**; replaced by the bridge routes:

| Draft | Now |
|---|---|
| `settings/describe {scope:'all'}` returns all full forms at once | `GET …/plugin-config` gives only the catalog, with forms `GET` per entry |
| Integer `revision` | An opaque string `revision`, bound to the startup generation, entry, schema and raw configuration |
| `settings/apply`, with failures uniformly `apply-failed {rolledBack}` | `POST …/<entryId>`; restore success is 409 `apply-failed`, restore failure 500 `recovery-failed`, plus 400 / 404 / 409 / 422 / 503 |
| Progress events `saved / reloading / settled` | No progress protocol, only "submitting → applied / failed" |
| Entries that failed to start are also editable (`phase: failed`) | v1 builds no schema for entries that didn't load successfully; listed as `state: failed`, not configurable, with the page explaining why |
| Bare `role('secret')` fields written with the configuration | v1 rejects: a bare secret would land in the profile YAML. Only ones with a credential binding are writable; bare secrets show "Set after the plugin is adapted" |
| relay allows `settings/apply` | Not needed (see §2 relay) |

## 4. What the app side did

| Requirement | Approach |
|---|---|
| Every installed plugin has an entry, and only plugins | The plugin details page's "Settings" row, the plugin inventory details, Settings › Engine parameters › the Plugins group, and settings search all list from the same catalog (`pluginConfigEntries`); market, local and enabled official optional plugins are treated alike. Whether something is a plugin is decided by `PluginConfigScope` (§7), and DSH core, rows the app inserted itself and unrecognized entries are all not listed. The non-built-in branch of `settingsPageFor` becomes `PluginConfigPage`, which for non-plugin entries shows only "Can't be set here yet" |
| volatile takes effect as soon as changed | `isLive(path)`: if any node on the path carries `meta.volatile` it's live and written directly |
| Non-volatile takes effect after saving | Edits are staged first ("Unsaved" on the row), and the bottom save bar says "N changes · reloads the plugin after saving"; the form is read-only during saving; collapses after success "Applied" |
| Failures can be rolled back and retried | See the §2 error-code table |
| Secrets are write-only | Only "Set / Not set" is shown, and the value is never echoed; ones with a credential binding go through `credentials/*`; bare secrets are not writable |
| Groups, descriptions, defaults, restore defaults, i18n | Objects nest into groups, `.collapse()` folds as is; descriptions are taken by UI language; the number / text sheets have restore default; "Restore all defaults" at the bottom (executed after confirmation, secrets kept); copy in both Chinese and English |
| `auto: false` with a web settings page | "Set in the web version" at the top, with natively drawable fields still drawn below; the web page is judged separately by slot occupancy. The web version changes the same configuration: while saving (reloading the plugin) or a live write is in progress the entry is grayed out and doesn't go to the web version; with unsaved changes it first asks "Discard changes?" and goes only after discarding, so that saving again on return doesn't overwrite the web version's changes. "Edit this item in the web version" in the form takes the same path, landing on the plugin's own card (the entry id itself matches no card) |
| No empty page when there's no configuration | A plugin with no drawable fields (or a catalog marking it not configurable) gets no entry |
| Easy to find and read | With ≥ 8 fields a search appears (title, Chinese and English descriptions, key names and options are all searchable, including those inside folds); common items first (required, secret, switch, option, live fields); with ≥ 7 fields of which ≥ 3 are "plumbing" fields (timeout, limit, path, address with a default) they're folded into "Advanced"; with ≥ 12 fields and multiple title groups, each group is collapsed. Where the schema itself declared `.collapse()`, the author's layout is respected and nothing extra is collapsed |

Code: `packages/dsh_client/lib/src/plugin_config_api.dart` (wire format and error codes); `app/lib/state/plugin_config/` (interface layer, bridge, volatile fallback, in-memory implementation, controller); `app/lib/ui/plugins/config/` (page, save bar, sorting and collapsing, entry).

## 5. Tests

- `packages/dsh_client/test/plugin_config_api_test.dart`: on a fake bridge (real HTTP): catalog / no route / relay, entry reads, entryId encoding, writes echoing the revision, one case for each of the eight error codes, the 422 path, statuses without a code, bad replies, write timeouts.
- `app/test/plugin_config/plugin_config_bridge_test.dart`: the controller running on the same fake server: 404 falls back to volatile and doesn't re-probe, relay doesn't probe, per-entry reads, live sent immediately, saves sent at once; apply-failed retry uses the new revision, recovery-failed restores the original settings, conflict retries after re-reading, overridden / invalid-operation / host-unavailable write nothing and don't show the host's original text, invalid-config marked on the field, entry-unavailable makes the entry disappear, after a disconnect what has landed isn't resent and only what hasn't landed is resent; bound secrets go through credentials, bare secrets are not writable.
- For pages, sorting, geometry and goldens see `app/test/plugin_config/`.
- `app/test/plugin_config/plugin_config_scope_test.dart`: on the r13 real-device fixture (§7.1), the "Plugins" group has only the voice input suite's three items and the local plugin; the 7 sensitive entries and the other 79 + 1 configurable entries don't appear; an unread plugin inventory, a bundle not enabled / with an error / neither optional nor user-installed, a row id colliding with a core one but with a mismatched package name, and the same id declared by two bundles are all rejected; the write layer rejects the `read` / `apply` of every core entry in the fixture before sending a request (zero POSTs, zero GETs on the fake server). The `scope` group of `plugin_config_bridge_test.dart`: when core entries are mixed into the list the controller and the bridge both send no requests, after a bundle is turned off its rows leave scope, and under the volatile fallback core namespaces are likewise not written.
- `app/test/plugin_config/plugin_config_scope_fresh_test.dart` (CR-a17797b): refresh fails after one success, failure on the first try, a re-read in progress, optimistic open not confirmed, confirmed close, another connection's inventory, not connected: only a confirmed current inventory lets things through, and in all other cases zero GETs and zero POSTs; credentials accept only refs declared by in-scope plugin forms (core refs, unread forms and an invalid inventory are never written), and the volatile fallback likewise. The page and the engine parameters page show the reason and a retry when the inventory read fails (`plugin_config_page_test.dart`).

## 6. Risks

- **The bridge route isn't implemented yet** (agreement §7 awaits the backend). Until it goes live, all hosts use the volatile fallback, and users see as much as before.
- Agreement §2 mentions ConfigEditor's normalization defect for file-path insertion (CR-CONFIG-EDITOR-PATH): for plugins that insert by path, a write may be misreported as 409 `overridden`. The app shows "Fixed by a configuration file" as is and doesn't swallow errors; the fix is on the backend.
- A plugin with bare secrets can only have its ordinary fields changed in the app; the secret requires the plugin to switch to a credential binding.
- Ordinary configuration writes pin the field's current raw value at the profile layer (a known ConfigEditor limitation); "Restore all defaults" can clear it.
- The allowlist relies on the plugin inventory: when the inventory isn't read (loading, plugin-manager turned off in safe mode, RPC failure) the "Plugins" group is empty, and the page shows loading or "Can't be set here yet". This is the intended deny-by-default.

## 7. Scope: only plugins (PLUGIN-CONFIG-ALLOW)

> 2026-10-28. Integration testing on r13 found that the old denylist (excluding `curatedNamespaces` + `internalNamespaces`) put DSH core entries into "Settings › Engine parameters › Plugins" and made them writable. Changed to an allowlist.

### 7.1 Measurements

The r13 runtime (DSH 0.2.1-rc.4 + dsh-go-bridge 0.4.0, taken from r13's x86_64 rootfs) was started with `dsh web` the way the app does: r13's own `dsh-web.patch.yml`, plus four `--patch`es for voice, login (`dsh-app-auth`), message search and phone control. After enabling the official voice input suite via `pluginManager` and installing a third-party plugin from a local path (`local-notes`, package name `dsh-go-fixture-local-notes`), read-only GET:

| | Entries | Configurable |
|---|---|---|
| All | 202 | 84 |
| DSH core (rows of the two layers `dsh-base` and `dsh-web-app`) | — | 79 |
| Inserted by the app itself (`dsh-app-phone`, present only when phone control is on) | — | 1 |
| User plugins | 5 (4 rows of the voice suite + 1 local row) | 4 |

The old rule let 58 core entries through, plus `dsh-app-phone`, all writable, including `webserver`, `connection`, `credentials`, `sandbox-policy`, `fs-sandbox`, `approval` and `system-prompt`. `dsh-app-phone`'s configuration is just the `command` / `args` of a stdio MCP server, and being writable amounts to being able to make the engine run arbitrary commands. (Another integration run's 201 / 82 / 79 used 3 synthetic fixtures in place of the plugins here, with the same 79 core entries.)

Fixtures: `app/test/plugin_config/fixtures/bridge_catalog_r13.json` (the GET text, only re-indented), `plugin_bundles_r13.json` (`pluginManager/listBundles` at the same moment, with the data URL in `meta.icon` replaced by `"<icon>"` and the local path in the local plugin's `source` replaced by `link:/root/plugins/local-notes`).

### 7.2 Fields that can distinguish them

| Source | Fields | Can it distinguish plugins from core |
|---|---|---|
| `GET /dsh-go/v1/plugin-config` | `entryId`, `package`, `label` (which is just `entryId`), `state`, `configurable`, `reason` | **No**. `package` only says which package the module comes from: core, official optional plugins and the app's `dsh-app-phone` (`@deepseek-ai/dsh-mcp-client`) are all `@deepseek-ai/*`; ones loaded by path (the bridge itself, `dsh-app-auth`) are `null`. There are no source, owner or bundle fields |
| `pluginManager/listPlugins` | `entryId` (`include:<id>`), `moduleName`, `enabled`, `fiberPhase`, `patchId`, `readOnlyReason` | **No**. `readOnlyReason: management-required` marks only some core entries (`webserver`, `connection` have it, `sandbox-policy` doesn't) |
| `pluginManager/listBundles` | `name`, `official`, `optional`, `installed`, `availability`, `source`, `enabled`, `error`, `readOnlyReason`, `rows[]` (`rowId`, `moduleName`, `entryId`), `overrides` | **Yes**. Core = the layers shipped with the installation (`dsh-base`, `dsh-web-app`: `official` / `optional` / `installed` all false, `availability: installation`, `management-required`); official optional = `official && optional`; user-installed (market, local, on-demand official packages) = `installed` with a `source` ("profile dependencies not provided by the installation itself") |

So `listBundles` governs, and no list of official plugin names is needed.

### 7.3 Rules (`app/lib/state/plugin_config/plugin_config_scope.dart`)

An entry E is a plugin if and only if there exists a bundle B such that:

```
B.enabled && B.error == null
&& ((B.official && B.optional) || (B.installed && B.source != null))
&& B.rows has a row with rowId == E.entryId, and it is declared only this once across all enabled bundles (the core layers included)
&& (when the bridge gave E.package) packageOf(that row's moduleName) == E.package
&& (when bridge R7 gave them) E.owner ∈ {optional, installed}, E.kind == plugin, E.bundle == B.name
```

- Matching uses `rowId`: `rows[].entryId` is the Loader's `include:<id>`, which is not the same set as the bridge's `entryId`.
- `enabled` is required, and "optional or user-installed" is required: an unselected alternative layer declares rows with core ids (`dsh-sdk-minimal` has `llm-deepseek`, `sandbox`), and looking only at "is a row of some bundle" would let core in.
- `overrides` is not consulted (a bundle that merely changes the configuration of core rows); rows inserted by `--patch` (the app's `dsh-app-*`, the bridge itself) don't belong to any bundle.
- The package-name comparison is an extra gate: a row id colliding with a core entry but whose module isn't the same package is rejected.
- Deny by default: if the plugin inventory isn't read, nothing counts as a plugin; unrecognized entries aren't shown. User-installed is recognized only by `source` (not falling back on the default of `availability`): on a host that doesn't give `source`, self-installed plugins are better not shown.
- Duplicate declarations are counted across all enabled bundles (CR-a17797b): if a qualifying bundle declares an id also declared by a core layer (even with the same package name), that id isn't exclusive to it and doesn't count as a plugin.

**Only the latest inventory confirmed by the host is trusted (CR-a17797b).** `installedPluginsProvider` keeps the old inventory for display: when a refresh fails it's still the original `AsyncData`, and during an optimistic toggle it's a derived value marked `confirmed: false`. The allowlist can't take direct authorization from it. `pluginConfigScopeProvider` looks at the inventory, the refresh record of `readListCache` and the source stamp together:

| Situation | Scope | Page |
|---|---|---|
| The current connection, the current identity, the latest successful read confirmed by the host | `confirmed`, letting through by the rules above | Normal |
| Reading / re-reading, or an optimistic toggle not yet confirmed by the host, or the inventory from another connection, another identity, or without a source stamp | `pending`, letting nothing through | Loading; when a write is refused it says "The plugin inventory is updating, please try again shortly" |
| The latest read failed (the old inventory is still on screen) | `failed`, letting nothing through | "Couldn't read the plugin inventory, try again later" + retry; the Plugins group on the engine parameters page has this row too |
| No plugin management to ask (not connected) | `offline` | Not connected |

After a bundle is disabled or errors, once the host confirms, its rows no longer count as plugins in the new inventory; before confirmation (the optimistic state) nothing is let through either. The cache's change stream emits the same value each time, and a provider listening to it would miss the "refresh failed" occasion, so the scope subscribes directly to the cache's changes and recomputes. The write layer checks the scope once more after showing "Saving" and before actually sending a request.

**Credentials are also by scope (CR-a17797b).** `describeCredentials` / `setCredential` / `clearCredential` accept only refs declared by in-scope plugin entries: in bridge mode these are the bound secrets and `credential-ref` fields in plugin forms that have been read, and in volatile mode those declared by in-scope namespaces; refs not among them are neither queried nor written and are rejected directly. For a plugin whose form hasn't been read, or when the inventory is invalid, even the plugin's own refs aren't written. The remaining boundary: a plugin may bind a secret to a public ref (such as `DEEPSEEK_API_KEY`) in its own schema, and then filling in a value in its settings page writes this ref; this is a binding declared by the plugin that the app can't distinguish, and the server needs to constrain bindings.

Enforced in four places: the list (`hasPluginConfig` / `pluginConfigEntries` / `bundleConfigRows` / settings search); the state (`PluginConfigState[ns]` hands out only plugins' forms, `load` sends no GET for non-plugins, and `set` / `save` / `resetAll` / secrets can't get a form); the write layer (`BridgePluginConfigApi` and `EngineSettingsPluginConfigApi`'s three methods `read` / `apply` / credentials throw `PluginConfigFailure` before sending a request); the page (non-plugins show "Can't be set here yet", and when the inventory state isn't confirmed it's shown per the table above).

Result on the r13 fixture: `speech-to-text`, `speech-to-text-sensevoice`, `api-speech-to-text` (the voice input suite and its provider and interface) and `local-notes` (the local plugin) are shown; `ui-voice-input` is a plugin row but has no configuration, so it gets no entry. The other 80 configurable entries are all not shown.

Unaffected: the curated pages (subagents, agent loop, command execution, web search…) go directly through engine settings, not here. The native seat for the DSH Web settings slot (`SchemaConfigSeat`), when embedded, draws only the volatile fields of `settings/describe`, the same as what DSH Web itself can change; when it appears as a "row" it opens `PluginConfigPage`, and core namespaces now show "Can't be set here yet".

### 7.4 What to suggest the bridge add

1. **Do the allowlist on the server too (most urgent)**. For now the app is only a client-side defense: any client with `/api` credentials (a script in a DSH Web page, another plugin's page) can directly `POST /dsh-go/v1/plugin-config/webserver` to change core configuration, relax `sandbox-policy`, or change `dsh-app-phone`'s `command`. It's suggested that the bridge make every entry not belonging to "a selected official optional bundle or a profile self-installed bundle" `configurable: false` (with a new reason, such as `core`), and have GET details and POST return 404 `entry-unavailable` (or a new code `not-a-plugin`). The judgment can directly reuse the plugin manager's `listBundles` data, consistent with the app's rules.
2. **Let the list carry the source directly**: add `owner` (`core` / `optional` / `installed` / `overlay` / `unknown`) and the owning `bundle` name to each item. `overlay` means rows inserted by `--patch` (the app's `dsh-app-*`, the bridge itself). With it the app needn't cross-reference `listBundles` any more.
3. **Give `label` a real name**: currently `label` is always equal to `entryId`; `rows[].meta.title` of `listBundles` already has Chinese and English titles, and it's suggested to carry them directly.
4. **Unify ids**: the `entryId` of `listBundles` / `listPlugins` is `include:<id>`, and plugin-config's `entryId` is `<id>`, so the two sides can only be matched by `rowId`; it's suggested to state this in the agreement or unify them.
5. **Entries pinned by `--patch`**: the app's voice overlay replaces the config of `speech-to-text-sensevoice` as a whole row (`SpeechGuest.kt`), and per the bridge's implementation writes to such entries will most likely return 409 `overridden` (only GET was done this time, not verified). Voice providers are now among the few items in the "Plugins" group, and it's suggested the bridge mark in the list or details the fields / entries covered by an overlay, so the app can mark "Fixed by a configuration file" ahead of time rather than reporting an error only after saving.

### 7.5 After bridge R7 (runtime r14) landed

1, 2 and 5 are implemented by R7: the server denies by default per `listBundles` (GET / POST for non-plugin entries return 403 `entry-unavailable`); each list item gains `owner` (`core` / `optional` / `installed` / `overlay`), `bundle`, `kind`, `source` and `writable`; qualifying plugins that are overridden have `configurable: true, writable: false, reason: overridden`. 3 wasn't done as suggested: `label` is the owning bundle's top-level `meta.title`, and entries of the same bundle share the same name.

App side (fixtures `bridge_catalog_r14.json` / `plugin_bundles_r14.json` / `bridge_entry_r14_sensevoice.json`, from a real r14 Host with local paths removed):

- **Scope**: still governed by 7.3 (including "only the latest inventory confirmed by the host"), and the R7 fields only narrow, not widen — `owner` being `core` / `overlay` or an unknown value, `kind` not being `plugin`, or `bundle` not being the bundle carrying that row are all rejected; the two sides take the intersection, and rejection by either side rejects, with the credential scope judged the same way. Old bridges without these fields behave unchanged.
- **Read-only**: entries with `writable: false` in the list have their subtitle marked "Fixed by a configuration file" (or "Read-only" for `host-unavailable`) in Settings › Engine parameters › Plugins, plugin details and the plugin inventory, and the top of the page says the same; old bridges don't mark it.
- **Names** (`plugin_config_entries.dart`): when a bundle has only one configurable entry, the bundle title is used; with several, "bundle title · entry name". The entry name is taken in order from the row's own `meta.title`, the schema's `meta.title` (after the form is read), the app's name table (official entries, in Chinese and English), and a readable form of the entryId; titles that merely repeat the package name or duplicate the bundle title or another entry in the same group yield to the entryId. When a bundle has no title of its own only the entry name is used. Settings search uses the same names, searchable in both Chinese and English.
