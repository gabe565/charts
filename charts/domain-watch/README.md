# domain-watch

<img src="https://raw.githubusercontent.com/gabe565/domain-watch/ee028db206ea80c2617dd74a87193191a25a0a8a/assets/icon.svg" align="right" width="92" alt="domain-watch logo">

![Version: 0.3.4](https://img.shields.io/badge/Version-0.3.4-informational?style=flat)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat)

Tool to watch whois reports and notify when statuses change or expiration is incoming.

**Homepage:** <https://charts.gabe565.com/charts/domain-watch>

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/gabe565/charts/issues/new)**

## Source Code

* <https://github.com/gabe565/domain-watch>

## Requirements

Kubernetes: `>=1.22.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| <https://bjw-s.github.io/helm-charts> | common | 1.3.2 |

## TL;DR

```console
helm repo add gabe565 https://charts.gabe565.com
helm repo update
helm install domain-watch gabe565/domain-watch
```

## Installing the Chart

To install the chart with the release name `domain-watch`

```console
helm install domain-watch gabe565/domain-watch
```

## Uninstalling the Chart

To uninstall the `domain-watch` deployment

```console
helm uninstall domain-watch
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install domain-watch \
  --set env.TZ="America/New York" \
    gabe565/domain-watch
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install domain-watch gabe565/domain-watch -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controller.strategy | string | `"RollingUpdate"` | Set the controller upgrade strategy |
| env.WATCH_DOMAINS | string | `"example.com example.org"` | Whitespace-separated list of domains to watch. See [values.yaml](./values.yaml) for example. |
| env.WATCH_EVERY | string | `"6h"` | Domain check interval |
| env.WATCH_LOG_FORMAT | string | `"text"` | Log format. Valid options are text, json. |
| env.WATCH_LOG_LEVEL | string | `"info"` | Log level. Valid options are trace, debug, info, warn, error, fatal, panic. |
| env.WATCH_SLEEP | string | `"3s"` | Sleep interval between domain checks to avoid rate limits |
| env.WATCH_TELEGRAM_CHAT | string | `""` | Telegram chat ID |
| env.WATCH_TELEGRAM_TOKEN | string | `""` | Telegram token [[ref]](https://core.telegram.org/bots#6-botfather) |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"ghcr.io/gabe565/domain-watch"` | image repository |
| image.tag | string | `"latest"` | image tag |

---
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)