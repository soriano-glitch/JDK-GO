# Confirmation scope for scheduled tasks

Creating or modifying a task through the assistant tools requires user confirmation; the user's own actions in the interface don't, consistent with upstream (owner, 2026-11-05).

## Official calls

Checked against official npm `0.2.2-rc.1`.

| Entry point | Official source location | Identity entering the service |
| --- | --- | --- |
| Page saves a new task | `dsh-client-ui-schedule/lib/client.js:15836,19377` | `ctx.remote.schedule.create(request)`, no actor |
| Page edit | Same file `15841,19320` | `ctx.remote.schedule.edit(request)`, includes expectedUpdatedAt, no actor |
| Page run now | Same file `19328` | `ctx.remote.schedule.run({id})`, doesn't go through create/edit |
| Remote create | `dsh-schedule/lib/index.js:2216` | `this.create(request, undefined, signal)` |
| Remote edit | Same file `2387` | `this.edit(request, undefined, signal)` |
| Assistant tool create, edit | `dsh-tool-schedule/lib/index.js:548,686` | The real agent.session.id is obtained from exec.agent; subagents are rejected in runForCaller |

## Rules

- **With an actor (assistant tools):** first confirm the complete task, then enter the serialized commit; the write queue is not held while waiting. Rejection, cancellation, timeout, service stop and no confirmation UI all mean nothing is saved. An approval covers only this one change.
- **Without an actor (Remote):** no confirmation, commit directly.
- **Same for both:** at commit time, check deletion admission, the target, a future time and edit version conflicts.

## Why no confirmation without an actor

No actor doesn't prove a human clicked; approved Host plugins and programs that obtained web credentials can call it this way too. But the web credentials are stored in plain text in `~/.dsh/.credentials.yaml`, and a caller able to send such a request can equally answer the confirmation question via `$events/result`, so confirming here can't stop them and would only make the official page fail.

The confirmation card guards the assistant tool path; it can't guard against a shell that can read the credentials file. This is the same limitation as "authorization can't replace system isolation of credentials and tool execution" in the changelog.

## Verification

- `DSH_PREFIX=<prefix> node runtime/tests/schedule-remote-origin-live.mjs`: real `dsh web`, temporary HOME, real HTTP/Cookie/mux, no model calls. Creating and editing through the same RPC as the page are both saved, with no confirmation question.
- `DSH_PREFIX=<prefix> node --test runtime/tests/schedule-authorization.test.mjs`: confirmation, rejection, timeout and cancellation on the assistant path, in-memory seam tests.
- `DSH_PREFIX=<prefix> node runtime/tests/schedule-tool-web-live.mjs`: a real Web prompt calls `schedule_create` through the official mock model and shows the confirmation.

None of them performed browser clicks, and none ran on a real device.
