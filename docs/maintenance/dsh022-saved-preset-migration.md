# Complete presets saved under 0.2.1-rc.4: upgrading to 0.2.2-rc.1

Scope: complete presets copied from the official rc4 `standard` or `ptc` and saved in a custom bundle or a profile's `config.plugins`. Configurations that only reference a built-in preset without overriding the whole `plugins` array use the new official declaration and don't need to be rewritten per this document.

## Why the original copy can't start directly

In rc1, the main `@deepseek-ai/dsh-tool-subagent-control` plugin registers `list_agents` directly and no longer exports the old `/list-agents` subpath. Old complete copies contain both of these plugin lines, and loading the old subpath causes `agent-preset/invalid`.

At the same time, the subagent model configuration changed from `modelSelectionSettings` to `modelSelection` and `modelDiscovery`. Fixing only the load error isn't enough to keep the model selection/discovery entry points. The old `mode: ptc` of `dsh-agent-tool-presentation` still has official compatibility support, and this path keeps it.

## Automatic compatibility without changing the original file

When registering presets, the app runtime can accommodate the old official standard/PTC **complete, unmodified delegation subtree**: containing the original six declaration lines, the main control, the old list-agents, the old true configuration, and the official group/isolate fields. The two PTC workflow lines with disabled:true must also keep the official shape. Matching compares the whole subtree, including fields, array order and values; adding fields, changing to false, adding new model fields, adding or removing sublines or adjusting scope all prevent it from applying.

Compatibility only creates an in-memory copy, removing the redundant old declaration and mapping the two model fields; the original profile/bundle file is not written, and the persona and other custom configuration outside the group are kept. The preset's "View configuration" reads the compatible declaration in effect for this run, while the original on disk keeps the old form; reverting the patch restores the old loading behavior. It doesn't rewrite sessions, migrate arbitrary plugins, or turn unknown load errors into retries.

`runtime/tests/preset-legacy-delegation-live.py` uses the locked official rc4 inputs and an actual rc1 Host to verify the two old complete presets, a new official positive control, six unmatched shapes continuing to fail, the original file bytes unchanged, native/PTC executors, model parameters and read-only subagent tools. Model generation and Android were not verified. Other configurations are still judged item by item per the manual steps below; the plugins array can't be overwritten wholesale.

## Minimal manual modification

First back up the file that actually owns the preset. Confirm no other program is editing it, and check the following preconditions:

- The same `delegation` composition already has the main `@deepseek-ai/dsh-tool-subagent-control` plugin enabled.
- The old `tool-subagent-list-agents` line has only the `id` and `name` below, with no custom configuration, injection, isolation or disable condition.
- The old field of `tool-subagent` is explicitly `modelSelectionSettings: true`, and there are no existing new `modelSelection` / `modelDiscovery` fields.

When the preconditions are met, remove only this redundant declaration:

```yaml
- id: tool-subagent-list-agents
  name: '@deepseek-ai/dsh-tool-subagent-control/list-agents'
```

In the original `tool-subagent`'s `config`, change:

```yaml
modelSelectionSettings: true
```

to:

```yaml
modelSelection: true
modelDiscovery: true
```

Keep everything else, including tool order, persona, provider, limits, user-defined fields, disabled expressions and the old PTC selector. Don't overwrite the user's array with the whole new official `plugins` array, and don't add a second executor in the same scope.

If the old value is `false`, the new fields already exist, the main control is missing, the old line has custom fields or is in a different scope, stop applying this path and evaluate the configuration separately. This document hasn't verified those cases and provides no general automatic migrator.

## Verification and actual coverage

The test `runtime/tests/preset-manual-migration-live.py` uses the actual official rc4 standard/PTC files, adds a custom persona in a temporary copy, then makes only the two mappings above, verifying that other bytes and order are unchanged. Real rc1 Host verification:

- Both presets can be created through the real `session/create`.
- The scoped executors are native and PTC respectively; the old PTC selector is kept.
- `list_agents`, `subagent` and `list_subagent_models` are visible in that Agent scope.
- The public schema of `subagent` keeps the `provider`, `model` and `reasoning_effort` parameters.
- The real registered read-only list tools are called directly: `list_agents` returns an empty subagent list, and `list_subagent_models` returns the providers allowed by the parent session. No tool results were faked.

```bash
python3 runtime/tests/preset-manual-migration-live.py \
  --prefix /absolute/patched-rc1-prefix \
  --old-prefix /absolute/rc4-prefix \
  --out /absolute/disposable-evidence-directory \
  --port 39422
```

The test doesn't touch user profiles and doesn't start real model subtasks; actual subagent model generation, full PTC program transport and the Android UI were not verified. Don't widen the passing scope to claim arbitrary third-party presets can be migrated. The raw logs of the newly created Host contain a temporary token and should not be shared; share only `result.json` and the security audit summary.

## Rollback

Restoring the original preset file rolls back only this configuration change; it doesn't roll back data the engine has already upgraded. In particular, the schedule domain writes v2 after the first rc1 update, and rc4 rejects that version. When rolling back the engine, use configuration and data backups from a consistent point in time before the upgrade; don't just replace the executable, and don't overwrite configuration changes the user made after the upgrade.
