# Brand and mascot assets

JDK-Go's source code is released under AGPL-3.0 (see [LICENSE](LICENSE)), but the brand and art assets below are **not covered by the AGPL-3.0 license**. Their copyright belongs to ccch1mneyyy (DSH-TUI), all rights reserved.

You may use them to build, test and run this repository. If you redistribute a modified version or derivative work, please replace them with your own name and assets.

| Asset | Location | Source |
|---|---|---|
| JDK-Go brand mark (robot with arrow) and logo | `app/assets/brand/jdk-go-*.png`; generated from it: `jdk-go-glyph.png`, `jdk-go-tile.png`, the launcher icons `app/android/app/src/main/res/mipmap-*/`, `drawable-*/ic_stat_dsh.png`, `drawable-nodpi/ic_launcher_jdkgo_mono.png` | JDK-Go's own brand graphics |
| Deepy the little whale (pixel whale desktop pet) | Source files `app/tool/pet_src/deepy-whale/`; pet pack `app/assets/pets/deepy-whale/` | DSH-TUI's mascot. The source files are made in the theme-pack format of [Clawd on Desk](https://github.com/rullerzhou-afk/clawd-on-desk), reusing only its format |
| Whale girl (pixel whale-girl expressions) | Source files `app/tool/pet_src/whale-girl/` (`index.html` is the original page at https://dshtui.com/pets/whale-girl-emoji/, containing the event mapping and per-frame durations); pet pack `app/assets/pets/whale-girl/`; the sticker in the star prompt `app/assets/star/star_whale.webp` | DSH-TUI's mascot, originally published on dshtui.com |

Whale tail graphics (`app/assets/whale/`, source files `app/tool/whale_src/`): one of them is DeepSeek's official icon, whose copyright and trademark belong to DeepSeek, used only to indicate that this app connects to DeepSeek services; the others are derivative works based on it. They are likewise not covered by the AGPL-3.0 license. We will replace them if the rights holder asks.

These whale characters are DSH-TUI's own unofficial characters, have nothing to do with DeepSeek, and do not represent DeepSeek.

The go.dshtui.com home page (`site/home/`) was made by community developer ClayGao233 / 采云师烧饼; for the page's own source and terms of use, see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md). The `dist/assets/dsh-go.svg` in it (a copy of `app/assets/brand/tile.svg`), `dist/assets/dsh-go-pop.svg` (a 3D version adapted from the brand graphics), `dist/assets/author/share.png` (a copy of `docs/assets/social-preview.png`), and the brand graphics and whale-girl character in the feature showcase images are subject to the same terms as this page.

The showcase assets used by the repository's home README in `docs/assets/` (hero image, social preview image, desktop pet animations, community QR codes) are also subject to the terms of this page: they may be viewed and reposted with this repository as an introduction, but don't use them in a product you release yourself.

Pet packs are generated from `app/tool/pet_src/` by `app/tool/make_pet_pack.py`, and the brand graphics and launcher icons are generated from `app/assets/brand/jdk-go-mark.png` by `app/tool/make_jdkgo_icons.py`. The tool scripts themselves, like the rest of the source code, are released under AGPL-3.0.

The companion house's Live2D assets are not in this repository or the APK: Cubism Core (Live2D proprietary license), the Cubism Web Framework (Live2D Open Software License) and the character models are packaged as separate asset packs and only put on the phone when used; see [docs/design/companion.md](docs/design/companion.md). The model's author and license are written in the asset pack's `character.json`, and shown verbatim at the bottom of the app menu.

For third-party code, fonts, icons and runtime components, see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
