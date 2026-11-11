# go.dshtui.com home page

The showcase site at `https://go.dshtui.com/`. The page was made by community developer **ClayGao233 / 采云师烧饼** ([GitHub](https://github.com/ClayGao233), [Bilibili](https://space.bilibili.com/28879571)), delivered by the author for go.dshtui.com; the delivery package came with no license statement, so this part is not covered by this repository's AGPL-3.0 license; see [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md). The "Web development" credit at the bottom of the page is kept.

Plain HTML, CSS and JavaScript, with no third-party dependencies, and nothing is loaded from other sites.

## How it goes live

`services/share-worker/scripts/build-site.mjs` copies `dist/` into the root of the Worker's static assets `public/`; `/` returns `index.html` (visiting `/index.html` directly is a 404), and relative paths in the page (`/app.js`, `/assets/…`) are served at their original paths, none passing through the Worker; each file's security headers are written in the generated `public/_headers`. Deployment is as before: `CF_TOKEN_FILE=… services/share-worker/scripts/provision.sh deploy`. For routes, security headers and caching, see [share-links.md](../../docs/design/share-links.md) §2.

- **CSP**: written in the `<meta>` of `dist/index.html`; when the Worker builds, it extracts it as a response header (adding `frame-ancestors 'none'`). Scripts can only be this site's files, with no inline scripts or event attributes; stylesheets can only be this site's files, and inline `style` attributes are allowed (the opening animation uses CSS variables such as `style="--order:…"`); images can only be this site's; `connect-src` is only this site (the star count). So avatars and QR codes must be put in `dist/assets/author/` and can't use external links.
- **Star count**: the page asks this site's `GET /api/github/stars` for the number (`services/share-worker/src/github.ts`); the Worker asks GitHub and caches for 10 minutes, and visitors' browsers don't connect to GitHub. When the number can't be obtained, the bubble still shows, just without a number. The Worker always queries `ccch1mneyyy/dsh-go`.
- **Search engines**: the home page and its files can be indexed (`robots.txt` allows only these, and other pages stay `noindex`).
- **Caching**: HTML `no-cache`, other files one hour. To change an image, change the filename (e.g. `download-qr-v3.png`); don't overwrite under the same name.

## Changing the content

1. All fillable items are in `dist/site-config.js`: the author's avatar / ID / bio, the download entries (QR code, download page, GitHub Releases), platform notes, repository, contributors, and share metadata.
2. After changing `metadata`, run `npm run prepare:publish` to write the title, description, canonical and Open Graph into `dist/index.html`.
3. Run `npm run check` (syntax), `npm run check:content` (required items, links, local images), `npm test` (regression cases for the publishing tool), then run `npm test` in `services/share-worker`.

All of the above commands use only Node, need no network and no `npm install`. `npm run dev` previews locally at http://127.0.0.1:4173/ (without the star count).

The download QR code `dist/assets/author/download-qr-v2.png` has the same content as `download.url`, with error correction level M, 10 pixels per module and a 4-module quiet zone (`qrencode -t PNG -l M -s 10 -m 4` or an equivalent tool). After changing `download.url`, regenerate it and verify by scanning.

The share cover `dist/assets/author/share.png` is a copy of `docs/assets/social-preview.png`.

## Still to be confirmed by the author

What's currently filled in is provisional: the author ID `ccch1mneyyy`, the brand icon as the avatar, and the repository's social preview image as the share cover. After confirming or replacing them, re-check following the steps above.
