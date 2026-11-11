# Self-hosting a dsh-go forum (optional)

> 2026-10-24. A template for self-hosting a forum with Discourse; the configuration files are all in `infra/forum/`. If you don't self-host a forum, the app works as usual.
> All values you need to fill in are marked `<<FILL: …>>`, with a summary table at the end.

## 0. File overview

| File | Purpose |
|---|---|
| `infra/forum/containers/app.yml` | Container config · standalone mode: Discourse takes 80/443 itself and signs certificates automatically (3A) |
| `infra/forum/containers/app.reverse-proxy.yml` | Container config · reverse-proxy mode: the server already has nginx / Caddy or similar holding 80/443 (3B) |
| `infra/forum/settings/site_settings.yml` | Site settings: the app login callback, trust levels, anti-spam, login method endpoints, backups |
| `infra/forum/settings/community.yml` | Categories (Announcements, Plugins, Config sharing, How-tos, Help, Feedback), tags, login button text |
| `infra/forum/settings/secrets.example.yml` | OAuth / S3 secrets template; copy to `secrets.yml` and fill in (not in the repository) |
| `infra/forum/scripts/apply.sh` | Writes the three settings above into the forum; can be run repeatedly |
| `infra/forum/scripts/install_theme.sh` | Installs / updates the share-code card theme component |
| `infra/forum/theme-dshgo/` | Theme component: dsh-go share links in posts are displayed as install cards |

## 1. Where to put the server

> What follows is my understanding of the relevant regulations at the time of writing, not legal advice. Regulations and enforcement practice change; please verify against the latest requirements of your region, your access provider and the competent authorities.

**Mainland servers**
- The website must first complete ICP filing. A forum is an interactive service, and filing as an individual generally can't be done; a company entity is needed (subject to the requirements of the access provider and the provincial communications administration).
- The Provisions on the Administration of Internet Forum Community Services require posting users to be "real-name on the back end, voluntary on the front end", i.e. real-name authentication such as a phone number must be completed before posting, which Discourse doesn't have by default.
- The Provisions on the Security Assessment of Internet Information Services with Public Opinion Attributes or Social Mobilization Capability require a security assessment before a forum goes live, reported to the cyberspace and public security authorities; within 30 days after going live, public security networking filing must also be done.

**Overseas servers**
- No ICP filing needed.
- Access speed and stability from China are not guaranteed. Machines in Hong Kong, Japan, Singapore and similar regions with optimized routes such as CN2 GIA give a better experience but cost more.
- Legal responsibility for post content still lies with the operator.

This set of configuration is written for overseas servers.

## 2. Preparation

- [ ] **VPS**: Ubuntu 22.04 / 24.04 LTS, 64-bit; memory from 2 GB (4 GB is more comfortable), 2 cores, 40 GB disk. Open ports 22, 80, 443.
- [ ] **Choose a mode**: 80/443 free → standalone mode (3A); already a reverse proxy and other websites → reverse-proxy mode (3B).
- [ ] **Domain**: use a subdomain, such as `forum.example.com`. `<<FILL: forum domain>>`
- [ ] **DNS**: add an A record `forum → <<FILL: server IPv4>>`. If the server has usable IPv6, add an AAAA record too.
  - If using Cloudflare: first set it to the gray cloud (DNS only), and consider turning on the proxy after the certificate is signed. After turning on the proxy, set SSL mode to Full (strict), and uncomment the `cloudflare.template.yml` line in `app.yml`.
- [ ] **Mail service** (registration verification and notifications depend on it; VPSes generally block port 25, so use 587 or 465):

| Service | Suited for | Notes |
|---|---|---|
| Amazon SES | Overseas, cheap at volume | New accounts must first apply to leave the sandbox |
| Brevo / Mailgun / Postmark / Resend | Overseas, simple setup | Free quotas or low-priced plans |
| Alibaba Cloud Direct Mail / Tencent Cloud Direct Mail | Recipients mainly on QQ and 163 mailboxes | Needs a real-name cloud account; usable even with the server overseas |

  Complete SPF and DKIM verification for the sending domain at the provider (adding the DNS records the provider gives), and add a DMARC record.
  You need: `<<FILL: SMTP server>>`, `<<FILL: SMTP port>>`, `<<FILL: SMTP username>>`, `<<FILL: SMTP password>>`, `<<FILL: sender address>>`.

## 3. Installation

Run as root on the server. 3.1–3.2 are common to both modes.

```bash
# 3.1 With 2 GB of memory add 2 GB of swap (skip with 4 GB or more)
fallocate -l 2G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile
echo '/swapfile swap swap auto 0 0' >> /etc/fstab
sysctl -w vm.swappiness=10 && echo 'vm.swappiness = 10' > /etc/sysctl.d/30-discourse-swap.conf

# 3.2 Docker (skip if installed), the official Discourse launcher, and this repository's forum configuration
curl -fsSL https://get.docker.com | sh
git clone https://github.com/discourse/discourse_docker.git /var/discourse
git clone <<FILL: dsh-app repository address>> /opt/dsh-app
```

In both modes copy the configuration to `/var/discourse/containers/app.yml`. The file name decides the container name, and the scripts under `scripts/` look for a container named `app` by default; if you use another name, set `DISCOURSE_CONTAINER=<name>` before running the scripts.

### 3A Standalone mode (Discourse takes 80/443 itself)

```bash
cp /opt/dsh-app/infra/forum/containers/app.yml /var/discourse/containers/app.yml
chmod 600 /var/discourse/containers/app.yml
nano /var/discourse/containers/app.yml    # Replace all <<FILL: …>>
cd /var/discourse && ./launcher rebuild app   # About 10 minutes; the HTTPS certificate is issued automatically in this step
```

### 3B Reverse-proxy mode (the server already has a proxy holding 80/443)

Discourse provides HTTP only on the local machine; the certificate, HTTPS and the 80→443 redirect are all left to the existing proxy. Differences from standalone mode:

| Item | Standalone `app.yml` | Reverse-proxy `app.reverse-proxy.yml` |
|---|---|---|
| Templates | `web.ssl` + `web.letsencrypt.ssl` | Remove these two, add `web.socketed` (or use a port instead) |
| `expose` | `80:80`, `443:443` | None (socket); in port mode `127.0.0.1:8080:80` |
| HTTPS flag | Set by the letsencrypt template | Set `DISCOURSE_FORCE_HTTPS: true` manually |
| `volumes` | Same: `/var/discourse/shared/standalone` → `/shared` | Same |

`DISCOURSE_FORCE_HTTPS` corresponds to the site setting `force_https` (default `false`). It decides whether the links Discourse generates, links in emails and the OAuth callback address (`OmniAuth.config.full_host` takes `Discourse.base_url`) use https, and adds Secure to the login cookie. When TLS is terminated outside it must be set to `true`, otherwise third-party login will call back to an http address and fail.

```bash
cp /opt/dsh-app/infra/forum/containers/app.reverse-proxy.yml /var/discourse/containers/app.yml
chmod 600 /var/discourse/containers/app.yml
nano /var/discourse/containers/app.yml    # Replace all <<FILL: …>>; tune db_shared_buffers / UNICORN_WORKERS to memory
cd /var/discourse && ./launcher rebuild app
ls -l /var/discourse/shared/standalone/nginx.http.sock   # Socket mode: this file appearing means ready
```

**Two ways to connect**

| Way | The existing proxy forwards to | When to use |
|---|---|---|
| unix socket (default, officially recommended) | `/var/discourse/shared/standalone/nginx.http.sock` | The proxy runs directly on the host (nginx, Caddy) |
| Local port | `http://127.0.0.1:8080` | The proxy can't reach a unix socket (e.g. Traefik), or the proxy is in another container |

To switch to a port: delete the `web.socketed` template line in `app.yml`, uncomment the two `expose` lines, and rebuild. When the proxy runs in a container, `127.0.0.1` refers to the proxy container itself: either mount `/var/discourse/shared/standalone` into the proxy container and use the socket, or let the proxy container reach the host's port (e.g. `host.docker.internal` / the host bridge IP).

**What the existing proxy must do**
- Forward `Host`, with `X-Forwarded-For`, `X-Forwarded-Proto: https`, and `X-Real-IP: <visitor IP>`. The nginx in the container uses `X-Real-IP` to restore the real IP (socket mode trusts `unix:`, port mode trusts Docker private ranges, see the `run` at the end of `app.reverse-proxy.yml`). Without this header, all visitors are treated as the same IP and rate-limited together.
- Request body limit ≥ the `upload_size` in the container (default 10m). The examples below give 20m; to restore by uploading a backup file on the admin web page, raise both sides.
- Timeout ≥ 60 seconds. Discourse's live updates use HTTP long polling (about every 25 seconds), not WebSocket; turn off proxy buffering so messages arrive instantly.
- Redirect port 80 to https; the certificate is issued and renewed by the proxy itself.

**nginx (host)**: `/etc/nginx/sites-available/forum.conf`, then `ln -s` into `sites-enabled`, and `nginx -t && systemctl reload nginx`.

```nginx
server {
    listen 80;
    listen [::]:80;
    server_name <<FILL: forum domain>>;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;          # nginx ≥ 1.25.1 can change to listen 443 ssl; + http2 on;
    listen [::]:443 ssl http2;
    server_name <<FILL: forum domain>>;

    ssl_certificate     /etc/letsencrypt/live/<<FILL: forum domain>>/fullchain.pem;   # If issued with certbot --nginx
    ssl_certificate_key /etc/letsencrypt/live/<<FILL: forum domain>>/privkey.pem;

    client_max_body_size 20m;

    location / {
        proxy_pass http://unix:/var/discourse/shared/standalone/nginx.http.sock:;
        # Port mode: proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host $http_host;
        proxy_http_version 1.1;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto https;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_buffering off;
        proxy_read_timeout 90s;
        proxy_send_timeout 90s;
    }
}
```

For the certificate you can first enable only the port 80 server, sign it with `certbot --nginx -d <forum domain>`, and then add the 443 section.

**Caddy (host)**: add a block to the Caddyfile and `systemctl reload caddy`. Caddy signs certificates and does the 80→443 redirect automatically, already carries `X-Forwarded-For` / `X-Forwarded-Proto` / `X-Forwarded-Host` by default, and doesn't limit the request body size by default.

```caddy
<<FILL: forum domain>> {
    reverse_proxy unix//var/discourse/shared/standalone/nginx.http.sock {
        # Port mode: reverse_proxy 127.0.0.1:8080 {
        header_up X-Real-IP {remote_host}
        flush_interval -1
    }
}
```

**Traefik and other proxies**: use port mode (`127.0.0.1:8080`, or attach the Discourse container to the Docker network Traefik is on) and route to that service; turn on HTTP→HTTPS redirect at the entry point, and use the proxy's own ACME for certificates; Traefik carries `X-Forwarded-*` and `X-Real-Ip` by default. For other proxies, configure per the points under "What the existing proxy must do".

For example, a temporary domain can use `forum.<IP joined with hyphens>.sslip.io` (such as `forum.38-58-58-219.sslip.io`), which resolves directly to that IP without changing DNS. Before switching to an official domain, see §10 "Changing the domain".

### Checks after installation

- [ ] Open `https://<forum domain>` in a browser: the page is visible, the certificate is valid, and `http://` redirects to `https://`.
- [ ] In reverse-proxy mode confirm the https flag took effect: `docker exec app rails runner 'puts SiteSetting.force_https'` prints `true` (settings locked by environment variables don't appear in the admin settings page).
- [ ] When it won't open: `cd /var/discourse && ./launcher logs app`; in reverse-proxy mode also look at the proxy's own error log (such as `/var/log/nginx/error.log`). A 502 is generally because the socket hasn't been created yet or the path is wrong.

## 4. The first administrator

- [ ] Register on the web with the email in `DISCOURSE_DEVELOPER_EMAILS` and click the verification email; the account automatically becomes an administrator.
- [ ] When you can't receive email (SMTP not yet configured, or misconfigured), create one on the command line. This command is interactive and needs a person at the terminal:

```bash
cd /var/discourse && ./launcher enter app
rake admin:create     # Enter the email and password as prompted, and finally choose Y to grant administrator
exit
```

- [ ] After login a site wizard appears, which can simply be skipped: the script in step 5 writes the same settings.

## 5. Third-party login: register OAuth apps

All three are optional; a login button isn't shown for one that isn't filled in. Replace `<forum domain>` in the callback addresses with your forum domain.

**GitHub**
1. GitHub → Settings → Developer settings → OAuth Apps → New OAuth App.
2. Homepage URL: `https://<forum domain>`.
3. Authorization callback URL: `https://<forum domain>/auth/github/callback`.
4. After creating, generate a Client Secret. Note `<<FILL: GitHub Client ID>>` and `<<FILL: GitHub Client Secret>>`.

**LINUX DO** (via OpenID Connect)
1. Log in to `https://connect.linux.do` with a LINUX DO account and create an app to connect (the entry name is as the page shows).
2. Callback address: `https://<forum domain>/auth/oidc/callback`.
3. Note `<<FILL: LINUX DO Client ID>>` and `<<FILL: LINUX DO Client Secret>>`.

**Gitee**
1. Gitee → Settings → Third-party applications (`https://gitee.com/oauth/applications`) → Create application.
2. Application callback address: `https://<forum domain>/auth/oauth2_basic/callback`.
3. Tick only the `user_info` permission.
4. Note `<<FILL: Gitee Client ID>>` and `<<FILL: Gitee Client Secret>>`.

## 6. Write the site settings, categories and tags

```bash
cd /opt/dsh-app/infra/forum/settings
cp secrets.example.yml secrets.yml && chmod 600 secrets.yml
nano secrets.yml          # Fill in the Client ID / Secret from step 5
nano site_settings.yml    # Replace title, site_description and other <<FILL: …>>
sudo /opt/dsh-app/infra/forum/scripts/apply.sh
```

It can be run first even without `secrets.yml` or with placeholders still in `site_settings.yml`: items with placeholders and login methods without credentials are skipped and printed with `!`, while the rest are written as usual; run again after filling them in.

- [ ] There are no lines starting with `!` in the output (if there are, fix the files as prompted and run again).
- [ ] The login page shows the GitHub / LINUX DO / Gitee buttons; try logging in with each once.
- [ ] The categories page shows Announcements, Plugins, Config sharing, How-tos, Help, Feedback. The new site's built-in "Site Feedback" is renamed "Feedback"; if the "General" category isn't needed, delete it in the admin.
- [ ] When third-party login fails: Admin → Logs → Error logs. For LINUX DO you can temporarily set `openid_connect_verbose_logging` to `true`, and for Gitee `oauth2_debug_auth`, then retry.

These settings write:
- App login: `allowed_user_api_auth_redirects` gets `dshgo://forum/auth`; authorization scope `read,write,notifications,session_info`; level-0 new users can also log in from the app.
- `dshgo://` links in posts stay tappable (`allowed_href_schemes` gets `dshgo`).
- Default language Chinese, with Chinese word-segmented search. Defaults such as the minimum title / body / search term lengths for Chinese must be written explicitly: when the language is locked by an environment variable, Discourse still computes these defaults as en (measured on 2026.10), and the "Chinese defaults" section of `site_settings.yml` lists them item by item.
- The "About" posts of new categories are generated in the site language; after writing categories the category cache is cleared (otherwise anonymous `/site.json` shows the old categories for about 30 minutes).
- Trust levels and anti-spam settings for a new community, and daily backups. Each item is commented in `site_settings.yml`.

## 7. The share-code card theme component

```bash
sudo /opt/dsh-app/infra/forum/scripts/install_theme.sh
```

- [ ] Admin → Appearance → Themes → Components → "dsh-go share-code card" → Settings:
  - `download_url`: `<<FILL: dsh-go download page, starting with https>>` (leave empty to not show the "Download dsh-go" button);
  - `landing_urls`: the share-code landing page addresses, default `https://go.dshtui.com/share/|https://ccch1mneyyy.github.io/dsh-go/share/` (new domain first, the old github.io address kept, so old links are still recognized). It must agree with `shareLandingUrl` in `app/lib/share_code/share_link.dart` in the app, and when changing domains change both together.
- [ ] Post a test post with a share link and confirm it displays as a card and "Install with dsh-go" can launch the app.
- [ ] After changing the component later, just run the script above again to update.

## 8. App side

- [ ] The constant for the forum address in dsh-go is `https://<forum domain>` (`forumDefaultBaseUrl` in `app/lib/forum/forum_config.dart`, currently `https://forum.dshtui.com`; "Forum settings" in the app can also change it temporarily).
- [ ] Walk through it in the app: browse → log in (opens the browser authorization page, and returns to the app after confirming) → post → log out.

## 9. Backups

- [ ] By default one automatic backup per day, keeping 7, at `/var/discourse/shared/standalone/backups/default/`.
- [ ] Choose one of two for off-site backup:
  - Object storage: fill in the S3 items in `secrets.yml`, set `backup_location: "s3"` in `site_settings.yml`, then run `apply.sh`;
  - Sync the directory above regularly to another machine (e.g. cron + rsync).
- [ ] Restore (after installing the same version of Discourse on a new server, put the backup file into the directory above):

```bash
cd /var/discourse && ./launcher enter app
discourse enable_restore
discourse restore <backup file name>.tar.gz
exit
```

## 10. Upgrades and routine operations

- [ ] Upgrade Discourse: open `https://<forum domain>/admin/upgrade` in a browser and click upgrade; or on the command line `cd /var/discourse && git pull && ./launcher rebuild app` (a few minutes of downtime).
- [ ] System updates: `apt update && apt upgrade`, and turn on `unattended-upgrades`.
- [ ] After changing `app.yml` run `./launcher rebuild app`; after changing files under `settings/` just run `apply.sh` again.
- [ ] When facing a wave of spam: change `approve_unless_allowed_groups` in `site_settings.yml` to `"1|2|11"` (posts by level-0 users are reviewed first) and run `apply.sh`.
- [ ] When many users report 429 (too many requests): many users on mainland mobile networks share an exit IP, so you can raise `reqs_per_minute` / `burst_per_minute` of the `web.ratelimited` template in `params` of `app.yml`, and then rebuild. In reverse-proxy mode first confirm the proxy passes `X-Real-IP` (§3B), otherwise everyone shares one rate-limit quota.

### Changing the domain (e.g. from a temporary sslip.io to an official domain)

1. Point the new domain's DNS at the server; in reverse-proxy mode, add the new domain to the existing proxy and sign the certificate.
2. Change `DISCOURSE_HOSTNAME` in `app.yml` (and the sender address too), then `cd /var/discourse && ./launcher rebuild app`.
3. Replace the old address in existing content on the site:

```bash
cd /var/discourse && ./launcher enter app
discourse remap <old domain> <new domain>
rake posts:rebake
exit
```

4. Change the callback addresses of the three OAuth apps (GitHub / LINUX DO / Gitee) to the new domain.
5. Change the forum address constant in the app (`forumDefaultBaseUrl` in `app/lib/forum/forum_config.dart`) to the new domain.

## 11. Known risks

- **LINUX DO login hasn't been tested live**: the endpoints and authorization scopes come from `connect.linux.do`'s OIDC discovery document. Discourse's OIDC plugin checks that the `sub` returned by the userinfo interface (`/api/user`) agrees with the ID Token, which can't be verified before credentials are obtained. If login reports `sub mismatch`, use the alternative below.
- **Alternative**: connect LINUX DO with oauth2-basic. This way the same site can no longer connect Gitee, because oauth2-basic can configure only one service per site. Replace the Gitee section in `site_settings.yml` with:

```yaml
oauth2_authorize_url: "https://connect.linux.do/oauth2/authorize"
oauth2_token_url: "https://connect.linux.do/oauth2/token"
oauth2_user_json_url: "https://connect.linux.do/api/user"
oauth2_json_user_id_path: "id"
oauth2_json_username_path: "username"
oauth2_json_name_path: "name"
oauth2_json_avatar_path: "avatar_url"   # Not verified
oauth2_json_email_path: "email"         # Not verified
oauth2_send_auth_header: true            # Use only the Basic header, consistent with the known-working integration
oauth2_send_auth_body: false
oauth2_scope: ""
oauth2_button_title: "LINUX DO"
```

  Change the callback address correspondingly to `/auth/oauth2_basic/callback`, fill the `oauth2_*` entries in `secrets.yml` with LINUX DO's credentials, and leave `openid_connect_*` empty.
- **Gitee email**: Gitee returns only emails the user has made public, which are mostly empty. When empty, Discourse has the user enter and verify an email themselves, so SMTP must be working.

## 12. Values you need to provide

| Value | Where to fill it in |
|---|---|
| Forum domain | `app.yml` `DISCOURSE_HOSTNAME`; the app's forum address constant; the three OAuth callback addresses |
| Server IP | DNS A record |
| Administrator email | `app.yml` `DISCOURSE_DEVELOPER_EMAILS` (`LETSENCRYPT_ACCOUNT_EMAIL` can be filled the same) |
| SMTP server / port / username / password | `app.yml` `DISCOURSE_SMTP_*` |
| Sender address (SPF / DKIM done) | `app.yml` `DISCOURSE_NOTIFICATION_EMAIL` |
| Forum name, one-line introduction, short introduction, contact email | `site_settings.yml` `title` / `site_description` / `short_site_description` / `contact_email` |
| GitHub Client ID / Secret | `secrets.yml` |
| LINUX DO Client ID / Secret | `secrets.yml` |
| Gitee Client ID / Secret | `secrets.yml` |
| dsh-app repository address (for pulling the configuration on the server) | Step 3.2 |
| dsh-go download page address | Theme component setting `download_url` |
| Share-code landing page address (if changed) | Theme component setting `landing_urls`, consistent with the app's `shareLandingUrl` |
| Optional: S3 access key, region, bucket name, endpoint | `secrets.yml` + `site_settings.yml` `backup_location` |
| Optional: MaxMind account ID / License Key | `app.yml` |
| Optional: entity name, governing law and dispute jurisdiction in the terms of service | `site_settings.yml` `company_name` / `governing_law` / `city_for_disputes` |

## 13. Steps that must be done by hand

Everything a script can do is in `scripts/`; the following need an account or human judgment, and in an automated deployment must be handed to the site owner:

| Step | Reason |
|---|---|
| Register an SMTP service, add SPF / DKIM / DMARC in DNS | Needs the site owner's account and domain control; without SMTP, registration verification emails can't be sent |
| Register OAuth apps at GitHub, LINUX DO and Gitee (§5), and fill the credentials into `secrets.yml` | Needs the site owner's own accounts |
| Fill in `site_settings.yml`'s forum name, introduction and contact email | The wording is up to the site owner |
| The first administrator (§4) | Either receive the verification email, or run `rake admin:create` interactively in a terminal |
| The theme component's `download_url` (§7) | The download page address is up to the site owner; fill it in on the admin settings page |
| Reverse-proxy mode: the existing proxy's site configuration and certificate (§3B) | Depends on the type and configuration method of the proxy already on the server |
| Switching from a temporary domain to an official domain (§10) | Needs an official domain |
