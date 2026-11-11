# Manual CLI gate for the ordinary custom Responses route

This gate supplements the ordinary custom `openai-responses` route not previously covered in W17-K / ADD4. It uses the real headless CLI, Agent, pi-ai provider and native `todo_write`, with the model service being synthetic responses from its own loopback HTTP. It is a test delivery; it doesn't fix a known product bug and doesn't change runtime version inputs.

## Running

```sh
DSH_PREFIX=/absolute/prepared-prefix \
DSH_EVIDENCE_DIR=/absolute/own-evidence \
node runtime/tests/piai-responses-cli-live.mjs
```

It needs a prepared DSH 0.2.2-rc.1 runtime, Node, a writable temporary directory and an ordinary loopback listener. No new dependencies. `DSH_EVIDENCE_DIR` can be omitted; when omitted, requests and output are written to this run's temporary directory and cleared along with the temporary HOME/cwd at the end. When set, evidence is kept in the specified directory; use an exclusive empty directory to avoid overwriting existing files with the same names. The script doesn't write to the source directory or the runtime prefix.

## What it checks

The first legal Responses SSE returns one function call, with arguments split into two chunks. After the real tool runs, the `function_call` item ID, call ID, name and JSON arguments in the second actual request must each be equal, `function_call_output` must be associated with the same call ID, and the output contains completed. The second response completes normally, the CLI's final text is strictly equal, reason is completed, there is only one tool result, and after the process closes, code is 0, signal is null and stderr is empty.

This doesn't claim deep equality of all fields of the tool output, and doesn't cover multiple tools, cancellation, abnormal streams or history migration. The original real run already passed; there is no product first red. It uses the installed pi-ai's normal Responses added/delta/done/completed contract; it doesn't use a private adapter callback. The custom provider and synthetic fixed key point only to its own service, without using accounts, Codex/Azure or sign-in routes.

The 60-second watchdog only guards against a hung run; the success path doesn't wait for it. finally terminates any remaining own subprocesses, closes its own HTTP service and deletes its own temporary directory. The test is `*-live.mjs` and is not automatically added to the ordinary CI test set.

## Device scope

Not compiled for Android; PRoot/ARM, real remote models and Android actions were not run. The device owner may separately verify tool continuation turns with a real provider after a normal build/install, but must not treat these local synthetic response results as device or external model acceptance.
