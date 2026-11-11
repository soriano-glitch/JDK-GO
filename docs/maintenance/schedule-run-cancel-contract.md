# 639: pre-delivery cancellation for manual schedule.run

Prior agreement and implementation boundaries, base d935432d18cd83c951a87823b791b66c18426a64 / DSH 0.2.2-rc.1.

The current official run/request signal documentation promises a cancellation check after entering the transaction and before delivery. The runNow entry point already has a check, but then awaits recoverOutstandingExecution/resolveTarget and, after returning, calls send without checking again; send's first actual business action is the synchronous agent.followup(message). When a normal call is cancelled during target recovery, the original still adds this delivery and history, as reproduced through the real Host public entry point.

Minimal change: call signal?.throwIfAborted() again after await resolveTarget(task) and before send. The original reason identity is kept. No new signal parameter, message protocol, timer or subscription is added.

Boundaries:
- It only prevents this manual run from starting a new send after cancellation has been observed. The existing task is not deleted, and the schedule is unchanged.
- recoverOutstandingExecution may recover an earlier already-persisted delivery, which is not undone by this cancellation.
- new/new_once target resolution may already have reserved an identity, created a session, associated a workspace or named it; zero writes are not promised, and these preparation results are not deleted automatically.
- After send's synchronous followup, delivery has started; a later signal cancellation doesn't require rolling back already-queued messages/persisted history.
- ADD3's actor-less Remote create/edit behavior is unchanged, and the tools' independent authorization is unchanged.

Real evidence: first the Host prints ready, then SessionController.create an ordinary session, sessions.flush, remoteCreate a future task, and run succeeds normally (normal-run.log); then the same path with only a public schedule/resolve-agent async hook gate added, aborting inside the gate, and the original still had history 1 (cancel-red.log). ScheduleRuntime private methods were not called directly.

The test only advances, in preload, the 20 ms lock retry delay explicitly coming from dsh-go-deletion.mjs, passing other timers through; actual lock operations, signal, delivery and results are unchanged. The earliest probe that called agents.create directly during plugin activation hit a lock conflict; it is kept as PREPARATION material, not a valid cancellation red, and not treated as the root cause of the fault.

Acceptance: on the actual Host, cancellation with an existing session target → rejected with the same reason/history 0; a later normal run still succeeds/history 1, and a repeated run is still pending; the task schedule is kept. Preparation side effects of new targets, real SSH/Android/external models are not claimed as verified. The new runtime diff will affect runtimeVersion; pins are recorded by the formal build environment through the established process and are not changed in this task.
