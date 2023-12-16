# Paperless-ngx

<img src="https://raw.githubusercontent.com/paperless-ngx/paperless-ngx/b948750d558b58018d1d3393db145d162d44fceb/src-ui/src/assets/logo-notext.svg" align="right" width="92" alt="paperless-ngx logo">

![Version: 0.9.2](https://img.shields.io/badge/Version-0.9.2-informational?style=flat)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
![AppVersion: 2.1.3](https://img.shields.io/badge/AppVersion-2.1.3-informational?style=flat)

A community-supported supercharged version of paperless: scan, index and archive all your physical documents

**Homepage:** <https://charts.gabe565.com/charts/paperless-ngx/>

**This chart is not maintained by the upstream project and any issues with the chart should be raised
[here](https://github.com/gabe565/charts/issues/new?assignees=gabe565&labels=bug&template=bug_report.yaml&name=paperless-ngx&version=0.9.2)**

## Source Code

* <https://github.com/paperless-ngx/paperless-ngx>

## Requirements

Kubernetes: `>=1.22.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| <https://bjw-s.github.io/helm-charts> | common | 1.5.1 |
| <https://charts.bitnami.com/bitnami> | mariadb | 11.5.7 |
| <https://charts.bitnami.com/bitnami> | postgresql | 12.12.10 |
| <https://charts.bitnami.com/bitnami> | redis | 18.4.0 |

## Installing the Chart

To install the chart with the release name `paperless-ngx`

### OCI (Recommended)

```console
helm install paperless-ngx oci://ghcr.io/gabe565/charts/paperless-ngx
```

### Traditional

```console
helm repo add gabe565 https://charts.gabe565.com
helm repo update
helm install paperless-ngx gabe565/paperless-ngx
```

## Uninstalling the Chart

To uninstall the `paperless-ngx` deployment

```console
helm uninstall paperless-ngx
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install paperless-ngx \
  --set env.TZ="America/New York" \
    gabe565/paperless-ngx
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install paperless-ngx gabe565/paperless-ngx -f values.yaml
```

## Custom configuration

### Database Installation

Paperless-ngx supports PostgreSQL and MariaDB.
This chart can install PostgreSQL or MariaDB and configure Paperless-ngx automatically.
See each database section in [`values.yaml`](./values.yaml) for configuration examples.

## Values

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See [values.yaml](./values.yaml) | Environment variables [[ref]](https://docs.paperless-ngx.com/configuration/) |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"ghcr.io/paperless-ngx/paperless-ngx"` | Image repository |
| image.tag | string | `"2.1.3"` | Image tag |
| ingress.main | object | See [values.yaml](./values.yaml) | Enable and configure ingress settings for the chart under this key. |
| mariadb | object | See [values.yaml](./values.yaml) | Enable and configure mariadb database subchart under this key.    If enabled, the app's db envs will be set for you.    [[ref]](https://github.com/bitnami/charts/tree/main/bitnami/mariadb) |
| persistence.consume | object | See [values.yaml](./values.yaml) | Configure consume volume settings for the chart under this key. |
| persistence.data | object | See [values.yaml](./values.yaml) | Configure data volume settings for the chart under this key. |
| persistence.export | object | See [values.yaml](./values.yaml) | Configure export volume settings for the chart under this key. |
| persistence.media | object | See [values.yaml](./values.yaml) | Configure media volume settings for the chart under this key. |
| postgresql | object | See [values.yaml](./values.yaml) | Enable and configure postgresql database subchart under this key.    If enabled, the app's db envs will be set for you.    [[ref]](https://github.com/bitnami/charts/tree/main/bitnami/postgresql) |
| redis | object | See [values.yaml](./values.yaml) | Enable and configure redis subchart under this key.    If enabled, the app's Redis env will be set for you.    [[ref]](https://github.com/bitnami/charts/tree/main/bitnami/redis) |
| service.main | object | See [values.yaml](./values.yaml) | Configures service settings for the chart. |

---
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
