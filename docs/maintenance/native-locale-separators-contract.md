# Locale separators in plugin copy

Base: `63e255fab5cb9d817af30b631c3643ccce8e9231` (v1.0.11).

This change only fixes separator normalization when exactly matching copy for multi-segment locale tags already accepted by the bridge's `LOCALE`. For example, the manifest's `zh_Hant_TW` and the requested `zh-Hant-TW` should match the same entry. The original implementation replaced only the first underscore, and would fall back to the language or default entry even when the correct entry existed.

The bridge's `parseText` and `resolveText` and the SDK's public `localize` replace all underscores with hyphens, still ignoring case. No language support is added, request or response fields are unchanged, and the fallback order, locale validation, feed identity, registration and lifecycle are unchanged.

Synonymous keys are handled by their respective existing rules: for the same key after bridge parsing, the later entry overrides; the SDK's `localize` keeps the first matching original key. These two existing behaviors are not unified.

## Reachable scope

The bridge's contributions/view reads accept a locale parameter, and the manifest's plugin titles, action labels, static strip copy and panel titles go through this parsing. The SDK's `localize(localeOrCaps, text)` accepts these tags too.

The v1.0.11 app's `nativeLocaleProvider` currently sends only `en` or `zh-CN`. Therefore, this patch doesn't claim the current app offers Traditional Chinese or script/region language settings, nor that this multi-segment locale symptom has been reproduced on a phone. The applicable scope is legal input to the existing public bridge/SDK.

## Generation and verification

The authoritative inputs are `runtime/bridge/dsh-go-bridge/lib/native/util.js` and `sdk/plugin-kit/lib/caps.js`. Following this wave's requirement not to deliver generated files/assets, the patch doesn't include the SDK's bridge copy or the app's skill assets. After applying the source, the merger runs the repository's existing generators:

```sh
node sdk/plugin-kit/scripts/sync-bridge.mjs
node sdk/plugin-kit/scripts/sync-skill.mjs
node sdk/plugin-kit/scripts/sync-bridge.mjs --check
node sdk/plugin-kit/scripts/sync-skill.mjs --check
node --test runtime/tests/native-locale-separators.test.mjs
(cd sdk/plugin-kit && npm test)
```

This round's verification actually ran these generators in an isolated tree. A source patch tree without generation will be reported as stale by the SDK's sync checks; it can't be described as a complete artifact ready to publish.

Refs: W17-B source audit, no linked public issue; no issue number is made up.

Changes runtimeVersion (bridge source is part of the runtime inputs); not compiled for Android. The phone and real engine plugin pages were not accepted.
