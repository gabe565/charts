# Charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/gabe565)](https://artifacthub.io/packages/search?repo=gabe565&sort=relevance)
[![Release Charts](https://github.com/gabe565/charts/actions/workflows/release.yaml/badge.svg)](https://github.com/gabe565/charts/actions/workflows/release.yaml)
[![Renovate](https://img.shields.io/badge/Renovate-enabled-brightgreen?logo=renovatebot&logoColor=1DDEDD)](https://renovatebot.com)
[![Pre-Commit](https://img.shields.io/badge/Pre--Commit-enabled-brightgreen?logo=pre-commit)](https://pre-commit.com)

A collection of Helm charts, based on the
[bjw-s common library chart](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Also available on [ArtifactHub](https://artifacthub.io/packages/search?repo=gabe565&sort=relevance).

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```shell
helm repo add gabe565 https://charts.gabe565.com
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
gabe565` to see the charts.

To install the <chart-name> chart:

```shell
helm install my-<chart-name> gabe565/<chart-name>
```

To uninstall the chart:

```shell
helm delete my-<chart-name>
```

## Chart Overview

| Chart | Description |
| ----- | ----------- |
| [AdGuard Home <img src='https://raw.githubusercontent.com/gabe565/charts/main/charts/adguard-home/icon.svg' alt='adguard-home icon' width='18px' align='right' loading='lazy'>](charts/adguard-home/) | Free and open source, powerful network-wide ads & trackers blocking DNS server. |
| [ASCII Movie <img src='https://raw.githubusercontent.com/gabe565/ascii-movie/a1fd5c9df2fb3a177949c9511b62407c83aedefe/assets/icon.svg' alt='ascii-movie icon' width='18px' align='right' loading='lazy'>](charts/ascii-movie/) | Star Wars movie SSH and Telnet server |
| [Bookstack <img src='https://raw.githubusercontent.com/gabe565/charts/main/charts/bookstack/icon.svg' alt='bookstack icon' width='18px' align='right' loading='lazy'>](charts/bookstack/) | A simple, self-hosted, easy-to-use platform for organising and storing information. |
| [Borgmatic <img src='https://raw.githubusercontent.com/borgmatic-collective/borgmatic/1.6.6/docs/static/borgmatic.svg' alt='borgmatic icon' width='18px' align='right' loading='lazy'>](charts/borgmatic/) | borgmatic is simple, configuration-driven backup software for servers and workstations. Protect your files with client-side encryption. Backup your databases too. Monitor it all with integrated third-party services. |
| [ChangeDetection.io <img src='https://raw.githubusercontent.com/gabe565/charts/main/charts/changedetection-io/icon.png' alt='changedetection-io icon' width='18px' align='right' loading='lazy'>](charts/changedetection-io/) | Live your data-life pro-actively, track website content changes and receive notifications via Discord, Email, Slack, Telegram and 70+ more. |
| [Domain Watch <img src='https://raw.githubusercontent.com/gabe565/domain-watch/ee028db206ea80c2617dd74a87193191a25a0a8a/assets/icon.svg' alt='domain-watch icon' width='18px' align='right' loading='lazy'>](charts/domain-watch/) | Tool to watch whois reports and notify when statuses change or expiration is incoming. |
| [ESPHome <img src='https://raw.githubusercontent.com/esphome/esphome-docs/019178551126f2d6a588a1f9ef50f60453041531/images/logo.svg' alt='esphome icon' width='18px' align='right' loading='lazy'>](charts/esphome/) | ESPHome is a system to control your ESP8266/ESP32 by simple yet powerful configuration files and control them remotely through Home Automation systems. |
| [Flame <img src='https://raw.githubusercontent.com/pawelmalak/flame/4ed29fe276b4282c67415f9788660df2a3a69b5c/client/public/icons/apple-touch-icon-180x180.png' alt='flame icon' width='18px' align='right' loading='lazy'>](charts/flame/) | Flame is self-hosted startpage for your server. Easily manage your apps and bookmarks with built-in editors. |
| [Generic Device Plugin ](charts/generic-device-plugin/) | The generic-device-plugin enables allocating generic Linux devices, such as serial devices, the FUSE device, or video cameras, to Kubernetes Pods |
| [Gotify <img src='https://raw.githubusercontent.com/gabe565/charts/main/charts/gotify/icon.svg' alt='gotify icon' width='18px' align='right' loading='lazy'>](charts/gotify/) | A simple server for sending and receiving messages in real-time per WebSocket. (Includes a sleek web-ui) |
| [Hammond <img src='https://raw.githubusercontent.com/akhilrex/hammond/84cba2c7f26f6d3f81c49b132110b24ac97c7b49/ui/public/touch-icon.png' alt='hammond icon' width='18px' align='right' loading='lazy'>](charts/hammond/) | A self-hosted vehicle expense tracking system with support for multiple users. |
| [Headscale <img src='https://raw.githubusercontent.com/juanfont/headscale/56a7b1e34952c3e0306a134b2be9b4277f5d8d6e/docs/logo/headscale3-dots.svg' alt='headscale icon' width='18px' align='right' loading='lazy'>](charts/headscale/) | An open source, self-hosted implementation of the Tailscale control server. |
| [Healthchecks <img src='https://raw.githubusercontent.com/gabe565/charts/main/charts/healthchecks/icon.svg' alt='healthchecks icon' width='18px' align='right' loading='lazy'>](charts/healthchecks/) | A cron monitoring tool written in Python & Django |
| [Home Assistant <img src='https://raw.githubusercontent.com/home-assistant/assets/9b782fe562cbd4e6139f9be17d8e7befafa5f945/logo/logo-pretty.svg' alt='home-assistant icon' width='18px' align='right' loading='lazy'>](charts/home-assistant/) | Open source home automation that puts local control and privacy first. |
| [Homer <img src='https://raw.githubusercontent.com/bastienwirtz/homer/5609315fe77da5441a9c3dda8d92c0ffe9f1bf17/public/assets/icons/logo.svg' alt='homer icon' width='18px' align='right' loading='lazy'>](charts/homer/) | A dead simple static HOMepage for your servER to keep your services on hand, from a simple yaml configuration file. |
| [Limo ](charts/limo/) | A file upload server. |
| [Matrimony <img src='https://raw.githubusercontent.com/gabe565/matrimony/b13163b384b27273080deb8d57d1222ba11337f9/frontend/public/img/logo.svg' alt='matrimony icon' width='18px' align='right' loading='lazy'>](charts/matrimony/) | Self-hosted wedding site configured via YAML |
| [Memos <img src='https://raw.githubusercontent.com/gabe565/charts/main/charts/memos/icon.png' alt='memos icon' width='18px' align='right' loading='lazy'>](charts/memos/) | A lightweight, self-hosted memo hub. Open Source and Free forever. |
| [Miniflux <img src='https://raw.githubusercontent.com/miniflux/logo/40cb83cc5b190212ad29fb4d5db6b52b335e4dc2/icon.svg' alt='miniflux icon' width='18px' align='right' loading='lazy'>](charts/miniflux/) | Miniflux is a minimalist and opinionated feed reader. |
| [Mnemonic Ninja <img src='https://raw.githubusercontent.com/gabe565/mnemonic-ninja/465602cd7093f62d611c69d7a91e520e4022fab9/src/assets/logo.svg' alt='mnemonic-ninja icon' width='12px' align='right' loading='lazy'>](charts/mnemonic-ninja/) | Mnemonic Ninja is a website to convert between a number and its corresponding word to aid in memorization. |
| [Monica <img src='https://raw.githubusercontent.com/monicahq/monica/main/public/img/monica.svg' alt='monica icon' width='18px' align='right' loading='lazy'>](charts/monica/) | Personal CRM. Remember everything about your friends, family and business relationships. |
| [Nightscout <img src='https://raw.githubusercontent.com/gabe565/charts/main/charts/nightscout/icon.svg' alt='nightscout icon' width='18px' align='right' loading='lazy'>](charts/nightscout/) | Web-based CGM (Continuous Glucose Monitor) to allow multiple caregivers to remotely view a patient's glucose data in real time. |
| [Obico <img src='https://raw.githubusercontent.com/gabe565/charts/main/charts/obico/icon.svg' alt='obico icon' width='18px' align='right' loading='lazy'>](charts/obico/) | Obico is a community-built, open-source smart 3D printing platform used by makers, enthusiasts, and tinkerers around the world. |
| [Paperless-ngx <img src='https://raw.githubusercontent.com/paperless-ngx/paperless-ngx/b948750d558b58018d1d3393db145d162d44fceb/src-ui/src/assets/logo-notext.svg' alt='paperless-ngx icon' width='18px' align='right' loading='lazy'>](charts/paperless-ngx/) | A community-supported supercharged version of paperless: scan, index and archive all your physical documents |
| [PictShare <img src='https://raw.githubusercontent.com/gabe565/charts/main/charts/pictshare/icon.svg' alt='pictshare icon' width='18px' align='right' loading='lazy'>](charts/pictshare/) | PictShare is an open source image, mp4, pastebin hosting service with a simple resizing and upload API that you can host yourself. |
| [Plex <img src='https://raw.githubusercontent.com/gabe565/charts/main/charts/plex/icon.svg' alt='plex icon' width='18px' align='right' loading='lazy'>](charts/plex/) | Plex organizes all of your personal media so you can enjoy it no matter where you are. |
| [Podgrab ](charts/podgrab/) | A self-hosted podcast manager to download episodes as soon as they become live. |
| [qBittorrent <img src='https://raw.githubusercontent.com/qbittorrent/qBittorrent/master/src/icons/qbittorrent-tray.svg' alt='qbittorrent icon' width='18px' align='right' loading='lazy'>](charts/qbittorrent/) | The qBittorrent project aims to provide an open-source software alternative to µTorrent. |
| [Relax Sounds <img src='https://github.com/gabe565/relax-sounds/raw/3e55b07a957f2e20aceeeba1d36226791f2f1569/frontend/src/assets/icon-purple.svg' alt='relax-sounds icon' width='18px' align='right' loading='lazy'>](charts/relax-sounds/) | Relax Sounds is a website that lets you stream relaxing sounds to your browser or over Google Cast. |
| [RSS-Bridge <img src='https://raw.githubusercontent.com/RSS-Bridge/rss-bridge/987f42d6d44cc18e5c33441e742d15ffff6feb72/static/favicon.png' alt='rss-bridge icon' width='18px' align='right' loading='lazy'>](charts/rss-bridge/) | The RSS feed for websites missing it. |
| [RSSHub <img src='https://camo.githubusercontent.com/79f2dcf6fb41b71619186b12eed25495fa55e20d3f21355798a2cb22703c6f8b/68747470733a2f2f692e6c6f6c692e6e65742f323031392f30342f32332f356362656237653431343134632e706e67' alt='rsshub icon' width='18px' align='right' loading='lazy'>](charts/rsshub/) | RSSHub is an open source, easy to use, and extensible RSS feed generator. It's capable of generating RSS feeds from pretty much everything. |
| [Scanservjs <img src='https://raw.githubusercontent.com/gabe565/charts/main/charts/scanservjs/icon.svg' alt='scanservjs icon' width='18px' align='right' loading='lazy'>](charts/scanservjs/) | scanservjs is a web UI frontend for your scanner. It allows you to share one or more scanners (using SANE) on a network without the need for drivers or complicated installation. |
| [Smarter Device Manager <img src='https://gitlab.com/uploads/-/system/group/avatar/6339043/ARM1636_Project_Logo_ST2_RGB_V1.png' alt='smarter-device-manager icon' width='18px' align='right' loading='lazy'>](charts/smarter-device-manager/) | Manage hardware resource allocation without a need for privileged containers. |
| [Tandoor <img src='https://raw.githubusercontent.com/vabene1111/recipes/master/docs/logo_color.svg' alt='tandoor icon' width='18px' align='right' loading='lazy'>](charts/tandoor/) | Application for managing recipes, planning meals, building shopping lists and much much more! |
| [Transsmute <img src='https://raw.githubusercontent.com/gabe565/transsmute/ce624f8c903654ead37489d8d274b97d526d397a/assets/icon.svg' alt='transsmute icon' width='18px' align='right' loading='lazy'>](charts/transsmute/) | Transsmute builds RSS feeds for websites that don't provide them. |
| [Vaultwarden <img src='https://raw.githubusercontent.com/dani-garcia/vaultwarden/d57b69952db6eb12987a9668fea6b72df79cfa41/resources/vaultwarden-icon.svg' alt='vaultwarden icon' width='18px' align='right' loading='lazy'>](charts/vaultwarden/) | Unofficial Bitwarden compatible server written in Rust. |
