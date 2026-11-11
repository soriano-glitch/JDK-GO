# dsh-media parameter header v1

The authoritative spec is `docs/design/media-generation.md` §4.6, the authoritative shared sample is `app/test/media/fixtures/header_grammar_v1.json`, and the plugin's `src/header.js` is aligned with it. This document only covers the parameter header of ordinary user messages and its grammar consistency with the install directory; tool results continue to use the existing `dsh-go/media` v1.

## Entry and three outcomes

Only the beginning of the first line of the current user message can become a generation instruction. The prefix is `〔生成图像` or `〔生成视频` (the literal Chinese markers for "generate image" / "generate video"), and the character right after the type word must be `〕`, `·`, JavaScript trim whitespace or the end of text. Otherwise null is returned and it's treated as an ordinary message. For example, `〔生成图像的方法〕示例` is ordinary text; `〔生成图像·1:1〕` followed by a newline and a description is a recognized generation message with an illegal separator, and returns the fixed error.

Leading spaces, a BOM or a quote marker are not accepted as a generation entry. Web pages, files, tools, quotes and assistant content can't authorize generation. The valid structure is:

```text
〔生成图像[ · ratio][ · N 张][ · quality=value][ · model]〕
description verbatim

〔生成视频[ · ratio][ · S 秒][ · resolution][ · model]〕
description verbatim
```

Square brackets above mean optional and are not actual characters. The field order is fixed, each kind at most once; the separator must be an ASCII space, a middle dot, an ASCII space. The first LF ends the header line, and a CR immediately before it also belongs to the header line; the description after it is kept character for character, without trimming.

## Fields and identity

A ratio is two positive decimal integers from 1 to 99 joined by a colon, with no leading zeros; images 1–4 pieces; videos 1–60 whole seconds. Image quality is 1–32 ASCII alphanumerics and `_.-`, whose first character must be a letter or digit; video resolution is `[1-9]\d{2,3}p`. These are only expressible grammar, and tools still validate against the actual catalog, services and host limits.

A model is a verbatim label, optionally carrying `〈serviceId/modelId〉`. serviceId starts with a lowercase letter followed by lowercase alphanumerics and underscores, at most 32 in total; modelId starts with an ASCII alphanumeric followed by alphanumerics and `_.:/-`, at most 160 in total. The label is at most 160 bytes in UTF-8, with no leading or trailing whitespace, no control characters and no brackets/middle dot, doesn't start with "质量=" (the literal "quality=" prefix), and can't disguise itself on its own as a ratio, count, seconds or resolution.

**A marker can't hide the label's classification.** `1.5p`, `-3:4`, `1.5 张` and the like, even with `〈office/model〉` after them, are still not legal model labels, and the marker branch returns `invalid_model`. An unmarked segment continues to follow the specified classification and error priority; for example, the unmarked formatter label `1.5p` in the shared golden still returns `invalid_quality`. The shared golden follows the app's copy, and the plugin doesn't change it separately.

Per the final spec, the app always outputs the marker. When selecting, the plugin must still satisfy the currently enabled services and model catalog with credentials configured, without guessing same-named models or silently switching services. v1 has no audio field and no namespace; no serviceId was added to the v1 result request.

## Length, errors and catalog

The header line is at most 1024 bytes in UTF-8, the description at most 4096 bytes with at least one non-whitespace character; lone UTF-16 surrogates in a generation message are rejected. After recognition, checks proceed in the specified order: newline/non-empty description, length and encoding, header structure, field classification, field order. Errors give only a fixed code and Chinese message, without echoing the input.

When loading the current static model catalog, `config.js` reuses the formatter to validate model labels/IDs, ratios and qualities. A standalone grammar helper can also validate video resolutions, but the current M0 catalog and capabilities are still image-only with video=false; no claim is made that a video tool is installed. Each label is validated first in unmarked form and then in the identity-bearing form, so the catalog can't provide model names that can't be expressed consistently.

## Shared tests and scope

Run from inside the repository `TZ=Asia/Shanghai node --test test/header.test.js` (working directory `runtime/media/dsh-media`). The test reads the shared JSON owned by the app directly in the repository; when verifying with an independently copied plugin, the byte-identical reference file must be placed at the same repository-relative location, and no separate golden may be made.

The shared file has 119 cases in total: the plugin runs 107 cases in five groups, valid/plain/invalid/format/formatRejects; the 12 titles cases belong to the app title path. valid also runs parse→format→parse, comparing canonical items byte by byte. Extra tests keep 384 legal combination round trips and cover the preserved shapes of marked labels and model names that legitimately contain similar fragments.

For how to run headless and the limits of its evidence, see `test/headless/HEADLESS-RECOVERY.md`; for the overall verification status see `VERIFICATION.md`. The two local scripted model sessions only prove the scheduling, tool, actual save and session log chain; they don't prove real model compliance, cloud billing, app display, Android/PRoot or completion of M1.
