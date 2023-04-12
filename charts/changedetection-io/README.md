# changedetection-io

<img src="https://raw.githubusercontent.com/gabe565/charts/main/charts/changedetection-io/icon.png" align="right" width="92" alt="changedetection-io logo">

![Version: 0.5.3](https://img.shields.io/badge/Version-0.5.3-informational?style=flat)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
![AppVersion: 0.41](https://img.shields.io/badge/AppVersion-0.41-informational?style=flat)

Live your data-life pro-actively, track website content changes and receive notifications via Discord, Email, Slack, Telegram and 70+ more.

**Homepage:** <https://charts.gabe565.com/charts/changedetection-io>

**This chart is not maintained by the upstream project and any issues with the chart should be raised
[here](https://github.com/gabe565/charts/issues/new?assignees=gabe565&labels=bug&template=bug_report.yaml&name=changedetection-io&version=0.5.3)**

## Source Code

* <https://github.com/dgtlmoon/changedetection.io>

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
helm install changedetection-io gabe565/changedetection-io
```

## Installing the Chart

To install the chart with the release name `changedetection-io`

```console
helm install changedetection-io gabe565/changedetection-io
```

## Uninstalling the Chart

To uninstall the `changedetection-io` deployment

```console
helm uninstall changedetection-io
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install changedetection-io \
  --set env.TZ="America/New York" \
    gabe565/changedetection-io
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install changedetection-io gabe565/changedetection-io -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| browserless.enabled | bool | `true` | Enable Browserless sidecar |
| browserless.env | object | See [values.yaml](./values.yaml) | Browserless environment variables. [[ref]](https://docs.browserless.io/docs/docker.html) |
| browserless.image.pullPolicy | string | `"Always"` | Browserless image pull policy |
| browserless.image.repository | string | `"browserless/chrome"` | Browserless image repository |
| browserless.image.tag | string | `"latest"` | Browserless image tag |
| env | object | See [values.yaml](./values.yaml) | environment variables. [[ref]](https://github.com/dgtlmoon/changedetection.io/blob/master/docker-compose.yml) |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/dgtlmoon/changedetection.io"` | image repository |
| image.tag | float | `0.41` | image tag |
| ingress.main | object | See [values.yaml](./values.yaml) | Enable and configure ingress settings for the chart under this key. |
| persistence.data | object | See [values.yaml](./values.yaml) | Configure persistence settings for the chart under this key. |
| service.main | object | See [values.yaml](./values.yaml) | Configures service settings for the chart. |

---
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)