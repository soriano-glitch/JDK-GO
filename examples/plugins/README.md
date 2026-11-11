# Example plugins

| Plugin | Shows | Needs the bridge |
|---|---|---|
| [`dsh-go-example-weather`](dsh-go-example-weather/) | A tool card: a tool result drawn as a native weather card (`presentationMeta`) | No, any host |
| [`dsh-go-example-usage`](dsh-go-example-usage/) | Status strip + panel + live data: tokens of this chat / today | Yes |
| [`dsh-go-example-quick`](dsh-go-example-quick/) | Capsules (static and invoked) + reply menu + a deferred result (clipboard translated by the default model) | Yes |
| [`dsh-go-example-readaloud`](dsh-go-example-readaloud/) | v1.2 capabilities: read a reply aloud, stop on speech, a 10-per-second caption, a floating caption | Yes |
| [`dsh-go-example-styles`](dsh-go-example-styles/) | View v2: semantic text, spans, readable colours, cards and proportional columns with v1 text fallbacks | Yes |
| [`dsh-go-example-album`](dsh-go-example-album/) | The chat page's Plugins sheet: a gallery, an empty state, a ring and a trend, in the app's palette | Yes |
| [`dsh-go-example-toolbox`](dsh-go-example-toolbox/) | Newer places: plus panel tools, chat actions, turn notes, a panel on the plugin page, a panel as a sheet | Yes |

Install: `dsh plugin --profile web add /absolute/path/to/<plugin>`. End to end: `e2e/host-e2e.sh` (real DSH + bridge, installs the three the way a person does). MIT © DSH-TUI (ccch1mneyyy).
