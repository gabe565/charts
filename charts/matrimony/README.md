# matrimony

<img src="https://raw.githubusercontent.com/gabe565/matrimony/b13163b384b27273080deb8d57d1222ba11337f9/frontend/public/img/logo.svg" align="right" width="92" alt="matrimony logo">

![Version: 0.4.2](https://img.shields.io/badge/Version-0.4.2-informational?style=flat)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat)

Self-hosted wedding site configured via YAML

**Homepage:** <https://charts.gabe565.com/charts/matrimony>

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/gabe565/charts/issues/new)**

## Source Code

* <https://github.com/gabe565/matrimony>

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
helm install matrimony gabe565/matrimony
```

## Installing the Chart

To install the chart with the release name `matrimony`

```console
helm install matrimony gabe565/matrimony
```

## Uninstalling the Chart

To uninstall the `matrimony` deployment

```console
helm uninstall matrimony
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install matrimony \
  --set env.TZ="America/New York" \
    gabe565/matrimony
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install matrimony gabe565/matrimony -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controller.strategy | string | `"RollingUpdate"` | Set the controller upgrade strategy |
| env | object | See [values.yaml](./values.yaml) | environment variables. |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"ghcr.io/gabe565/matrimony"` | image repository |
| image.tag | string | `"latest"` | image tag |
| ingress.main | object | See [values.yaml](./values.yaml) | Enable and configure ingress settings for the chart under this key. |
| persistence.data | object | See [values.yaml](./values.yaml) | Configure persistence settings for the chart under this key. |
| podSecurityContext.fsGroup | int | `1000` | Volume group permissions |
| service | object | See [values.yaml](./values.yaml) | Configures service settings for the chart. |

---
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)