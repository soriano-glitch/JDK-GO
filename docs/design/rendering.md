# Reply rendering (Markdown): trade-off record

> 2026-10-24. The code is in `app/lib/ui/chat/render/`, with the entry `markdown_body.dart`. Copying and sharing always use the original text; the handling below only affects display.

## Pipeline

`original → normalizeMath → boldTableHeaders → (when streaming) repairStreamingMarkdown + cursor → gpt_markdown (custom builders)`

| Step | File | What it does |
|---|---|---|
| Formula delimiters | `math_syntax.dart` | `$…$` → `\(…\)`, `$$…$$` → `\[…\]`; prices aren't formulas; code is left alone; an unclosed `$$` / `\[` while streaming becomes a "pending formula" block |
| Bold table headers | `table_syntax.dart` | Wraps header cells in `**…**` |
| Streaming repair | `stream_repair.dart` | Repairs only the last block, see below |
| Rendering | `markdown_math.dart` `markdown_image.dart` `markdown_blocks.dart` `code_block.dart` | Formulas, images, lists and `<details>`, code blocks |

## What was referenced, what was adopted

| Reference | Adopted | Not adopted / why |
|---|---|---|
| Vercel Streamdown (`remend`) | Repair only the unfinished tail: unclosed `**` `*` `~~` `` ` `` are closed on its behalf first (text has its final style from the first character, with no marker showing first and then jumping); a half link is shown as a link first (target `#`, tapping doesn't open it); half images, half HTML tags, lines with only a marker (`#`, `-`, `1.`, `==`, a ```` ``` ```` still typing its language name) aren't shown yet; tables and the like appear only once the separator row is complete | Streamdown completes an unclosed `$$` into a formula; here it is changed to **show the source until it closes**, since a half matrix rendered would jump repeatedly |
| remark-math / Pandoc `tex_math_dollars` | `$` followed by a non-whitespace, the closing `$` preceded by a non-whitespace and not followed by a digit, on the same line; `$$` may span lines; code isn't processed; `\$` is a literal. So `$5 and $10`, `$5-$10`, `5$ and 10$` are all body text | One more rule: "starts with a digit, has a space, and has no formula symbols at all" like `$5 and 10$` also counts as a price |
| KaTeX | Formula font size 1.2em (Latin Modern's x-height is smaller than the body sans-serif, and KaTeX uses 1.21em for the same reason); inline uses text style (small fractions, sub/superscripts beside), not stretching line height; block formulas are centered, and when too wide scroll horizontally from the left (not using the formula engine's own full-width block layout, which relies on `LayoutBuilder` and errors inside table cells); on parse failure show gray monospace source, no red text | gpt_markdown by default uses display style inline too, and `∑` stretches the whole line |
| gpt_markdown 1.4 | Keep using it: its streaming segment cache is its strength; only the builders and styles are swapped (`inline/blockLatexBuilder`, `imageBuilder`, the list builder, `htmlTags`, `AlertStyle`, `TableStyle`). The formula engine is its own `val_latex_flutter`, merely declared as a direct dependency (the version in the lock is unchanged) | Not switching to flutter_markdown_plus / markdown_widget: changing the parser costs a lot, and there's no streaming performance advantage |
| ChatGPT / Claude tables | Column widths follow content, a single column at most 260 wide (long text wraps inside the column), a table that doesn't fit scrolls horizontally; thin grid + header background + bold header | No zebra striping: row lines already exist, and zebra on top would be too busy. Header bolding is done at the source level because gpt_markdown's header style gets overridden by the body's explicit font weight |
| GitHub | The five alert kinds (`> [!NOTE]` etc.) become light-background bar cards with titles: Note / Tip / Important / Warning / Caution; the outer margin is merged into paragraph spacing. `<details>` becomes a collapsible block (collapsed by default, expanded with the `open` attribute) | — |

## Other decisions

- **Lists**: the text of all list items starts from the same column (1.375em, bullets and numbers in the same column, each nesting level indented by one more column). Numbers are right-aligned against the text, and from `10.` on hang leftward into the page margin instead of pushing that item's text askew. The bullet size and position are as before, and the layout of bullet lists is unchanged.
- **HTML**: turn on gpt_markdown's HTML table — `<br>`, `<sub>` / `<sup>`, `<kbd>`, `<u>`, `<mark>`, `<img>` render by meaning, unknown tags are shown as is, and things like `<script>` are hidden.
- **Code blocks**: language name + copy; replies get an extra "word wrap" switch; ```` ```diff ```` colors whole lines (the same diff colors as the change card); highlighted languages expanded from 26 to 56 (including common aliases).
- **Mermaid**: Flutter has no lightweight native renderer, and embedding a WebView in the message list is too heavy. So the code block shows the source as usual, the title says "Mermaid chart", and "Preview" opens a full-screen WebView where Mermaid draws it itself (loaded from a CDN, npmmirror first, reachable in China; `securityLevel: strict`; the chart source doesn't leave the phone). The cost: the preview needs the network. For offline, `mermaid.min.js` (about 2.7 MB) can be bundled into assets.
- **Images**: `![](test-image.jpg)` is usually a file the agent just generated in the workspace. Relative paths resolve against the session working directory (against the file's directory when previewing a `.md` file), and reading reuses the artifact card's `ArtifactFiles` (read directly locally; for a remote host, downloaded into the cache and not re-downloaded if the file hasn't changed); results are remembered by (session, path), so scrolling back doesn't re-read. Width doesn't exceed the body column, proportions are kept, max height 480; while loading it's a quiet 4:3 placeholder (an image already seen uses its own ratio, so scrolling back doesn't jump); on failure it is "small icon + filename + reason · tap to retry" (e.g. "Image not found · tap to retry"). Tapping opens the artifact preview page; web and `data:` images use the same full-screen viewer.
- **Streaming cursor**: follows the last line of text; after a closed code fence and block formulas it starts on a new line; in a table it goes into the last cell, without adding a column.

## Known limitations

- Task list items keep their bullets (gpt_markdown's list builder doesn't get the information that "this item is a task").
- Footnotes render as a numbered list at the end.
- The first layout of a very long reply is one-shot (gpt_markdown doesn't do lazy layout): a 3000-line test reply takes about 2 seconds for the first layout in the debug test engine, after which each token only re-lays out the tail, about 60–120 ms (of which source preprocessing is about 10 ms); release is usually several times faster, not measured on a real device.
