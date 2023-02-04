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
| [ascii-telnet](charts/ascii-telnet) | Star Wars telnet server |
| [bookstack](charts/bookstack) | A simple, self-hosted, easy-to-use platform for organising and storing information. |
| [borgmatic](charts/borgmatic) | borgmatic is simple, configuration-driven backup software for servers and workstations. Protect your files with client-side encryption. Backup your databases too. Monitor it all with integrated third-party services. |
| [changedetection-io](charts/changedetection-io) | Live your data-life pro-actively, track website content changes and receive notifications via Discord, Email, Slack, Telegram and 70+ more. |
| [domain-watch](charts/domain-watch) | Tool to watch whois reports and notify when statuses change or expiration is incoming. |
| [flame](charts/flame) | Flame is self-hosted startpage for your server. Easily manage your apps and bookmarks with built-in editors. |
| [hammond](charts/hammond) | A self-hosted vehicle expense tracking system with support for multiple users. |
| [headscale](charts/headscale) | An open source, self-hosted implementation of the Tailscale control server. |
| [homer](charts/homer) | A dead simple static HOMepage for your servER to keep your services on hand, from a simple yaml configuration file. |
| [limo](charts/limo) | A file upload server. |
| [matrimony](charts/matrimony) | Self-hosted wedding site configured via YAML |
| [miniflux](charts/miniflux) | Miniflux is a minimalist and opinionated feed reader. |
| [mnemonic-ninja](charts/mnemonic-ninja) | Mnemonic Ninja is a website to convert between a number and its corresponding word to aid in memorization. |
| [monica](charts/monica) | Personal CRM. Remember everything about your friends, family and business relationships. |
| [nightscout](charts/nightscout) | Web-based CGM (Continuous Glucose Monitor) to allow multiple caregivers to remotely view a patient's glucose data in real time. |
| [pictshare](charts/pictshare) | PictShare is an open source image, mp4, pastebin hosting service with a simple resizing and upload API that you can host yourself. |
| [podgrab](charts/podgrab) | A self-hosted podcast manager to download episodes as soon as they become live. |
| [portfolio](charts/portfolio) | My personal portfolio website |
| [relax-sounds](charts/relax-sounds) | Relax Sounds is a website that lets you stream relaxing sounds to your browser or over Google Cast. |
| [rss-bridge](charts/rss-bridge) | The RSS feed for websites missing it. |
| [rsshub](charts/rsshub) | RSSHub is an open source, easy to use, and extensible RSS feed generator. It's capable of generating RSS feeds from pretty much everything. |
| [scanservjs](charts/scanservjs) | scanservjs is a web UI frontend for your scanner. It allows you to share one or more scanners (using SANE) on a network without the need for drivers or complicated installation. |
| [smarter-device-manager](charts/smarter-device-manager) | Manage hardware resource allocation without a need for privileged containers. |
| [tandoor](charts/tandoor) | Application for managing recipes, planning meals, building shopping lists and much much more! |
| [transsmute](charts/transsmute) | Transsmute builds RSS feeds for websites that don't provide them. |
| [vaultwarden](charts/vaultwarden) | Unofficial Bitwarden compatible server written in Rust. |
