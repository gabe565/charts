# scanservjs

<img src="https://raw.githubusercontent.com/sbs20/scanservjs/d28627ebec5cec6d30475a43bd101cc9c5e0961a/packages/client/src/icons/android-chrome-192x192.png" align="right" width="92" alt="scanservjs logo">

![Version: 0.5.4](https://img.shields.io/badge/Version-0.5.4-informational?style=flat)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
![AppVersion: release-v2.26.1](https://img.shields.io/badge/AppVersion-release--v2.26.1-informational?style=flat)

scanservjs is a web UI frontend for your scanner. It allows you to share one or more scanners (using SANE) on a network without the need for drivers or complicated installation.

**Homepage:** <https://charts.gabe565.com/charts/scanservjs>

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/gabe565/charts/issues/new)**

## Source Code

* <https://github.com/sbs20/scanservjs>

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
helm install scanservjs gabe565/scanservjs
```

## Installing the Chart

To install the chart with the release name `scanservjs`

```console
helm install scanservjs gabe565/scanservjs
```

## Uninstalling the Chart

To uninstall the `scanservjs` deployment

```console
helm uninstall scanservjs
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install scanservjs \
  --set env.TZ="America/New York" \
    gabe565/scanservjs
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install scanservjs gabe565/scanservjs -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controller.strategy | string | `"RollingUpdate"` | Set the controller upgrade strategy |
| env | object | See [values.yaml](./values.yaml) | environment variables. [[ref]](https://github.com/sbs20/scanservjs/blob/master/docs/docker.md#environment-variables) |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"sbs20/scanservjs"` | image repository |
| image.tag | string | `"release-v2.26.1"` | image tag |
| ingress.main | object | See [values.yaml](./values.yaml) | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See [values.yaml](./values.yaml) | Configure persistence settings for the chart under this key. |
| service | object | See [values.yaml](./values.yaml) | Configures service settings for the chart. |

---
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)