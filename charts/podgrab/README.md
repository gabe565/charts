# podgrab

![Version: 0.3.5](https://img.shields.io/badge/Version-0.3.5-informational?style=flat)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat)

A self-hosted podcast manager to download episodes as soon as they become live.

**Homepage:** <https://charts.gabe565.com/charts/podgrab>

**This chart is not maintained by the upstream project and any issues with the chart should be raised
[here](https://github.com/gabe565/charts/issues/new?assignees=gabe565&labels=bug&template=bug_report.yaml&name=podgrab&version=0.3.5)**

## Source Code

* <https://github.com/akhilrex/podgrab>

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
helm install podgrab gabe565/podgrab
```

## Installing the Chart

To install the chart with the release name `podgrab`

```console
helm install podgrab gabe565/podgrab
```

## Uninstalling the Chart

To uninstall the `podgrab` deployment

```console
helm uninstall podgrab
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install podgrab \
  --set env.TZ="America/New York" \
    gabe565/podgrab
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install podgrab gabe565/podgrab -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See [values.yaml](./values.yaml) | environment variables. [[ref]](https://github.com/akhilrex/podgrab#environment-variables) |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/akhilrex/podgrab"` | image repository |
| image.tag | string | `"1.0.0"` | image tag |
| ingress.main | object | See [values.yaml](./values.yaml) | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See [values.yaml](./values.yaml) | Configure persistence settings for the chart under this key. |
| service | object | See [values.yaml](./values.yaml) | Configures service settings for the chart. |

---
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)