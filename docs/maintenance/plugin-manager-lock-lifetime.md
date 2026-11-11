# Plugin manager lock waits and owner lifetime

Base 63e255f. Unloading the manager's owner aborts the lifetime signal; an ordinary mutation waiting on its own profile/package.json file lock should also exit the wait, rather than keep holding the default ref'ed retry timer. Only that lifetime signal is wired into the existing withFileLock options; waitMs, the file lock contents, business operations and public RPC fields are kept. This is not new per-request cancellation.

The original cancellation check after acquiring the lock still exists; normal contention can still acquire the lock and proceed. Wait cancellation propagates AbortError along the existing throw path; the AbortError from timers/promises may carry the original reason via cause, and the identity of the error object is not promised to be unchanged.

Unloading the public Host owner was tested to still leave the native retry timer ref'ed. Without waiting 120 seconds, it can't be claimed that all CLI exits are slowed: the dsh bin's plugin subcommand calls process.exit on the runPlugin result; profile-boot's process shutdown sets exitCode on normal completion, while interrupt goes through forceExit, with a 5-second forced-exit timer while dispose hasn't finished, cleared when a normal dispose completes. An active exit can skip draining the event loop. The product fix's scope is the service owner's lifetime, not changing the CLI exit mechanism.

Not compiled for Android; PRoot/ARM not run. This runtime patch changes build contents, so runtimeVersion must be recorded locally through the existing process; pins are not committed.
