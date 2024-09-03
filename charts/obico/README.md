# Obico

<img src="https://raw.githubusercontent.com/gabe565/charts/main/charts/obico/icon.svg" align="right" width="92" alt="obico logo">

![Version: 0.5.0](https://img.shields.io/badge/Version-0.5.0-informational?style=flat)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat)

Obico is a community-built, open-source smart 3D printing platform used by makers, enthusiasts, and tinkerers around the world.

**Homepage:** <https://charts.gabe565.com/charts/obico/>

**This chart is not maintained by the upstream project and any issues with the chart should be raised
[here](https://github.com/gabe565/charts/issues/new?assignees=gabe565&labels=bug&template=bug_report.yaml&name=obico&version=0.5.0)**

## Source Code

* <https://github.com/TheSpaghettiDetective/obico-server>
* <https://github.com/gabe565/docker-obico>

## Requirements

Kubernetes: `>=1.22.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| <https://bjw-s.github.io/helm-charts> | common | 1.5.1 |
| <https://charts.bitnami.com/bitnami> | redis | 18.19.4 |

## Installing the Chart

To install the chart with the release name `obico`

### OCI (Recommended)

```console
helm install obico oci://ghcr.io/gabe565/charts/obico
```

### Traditional

```console
helm repo add gabe565 https://charts.gabe565.com
helm repo update
helm install obico gabe565/obico
```

## Uninstalling the Chart

To uninstall the `obico` deployment

```console
helm uninstall obico
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install obico \
  --set env.TZ="America/New York" \
    gabe565/obico
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install obico gabe565/obico -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ml-api.command | list | See [values.yaml](./values.yaml) | Command to run ML API. |
| ml-api.controller.strategy | string | `"RollingUpdate"` | Set the ML API upgrade strategy |
| ml-api.env.DEBUG | string | `"True"` | Enables debug logging |
| ml-api.image.pullPolicy | string | `"IfNotPresent"` | ML API image pull policy |
| ml-api.image.repository | string | `"ghcr.io/gabe565/obico/ml-api"` | ML API image repository |
| ml-api.image.tag | string | chart.appVersion | ML API image tag |
| ml-api.service | object | See [values.yaml](./values.yaml) | Configures service settings for the ML API. |
| podSecurityContext.fsGroup | int | `65534` | Volume binds will be granted to `nobody` group |
| podSecurityContext.runAsGroup | int | `65534` | Run as `nobody` group |
| podSecurityContext.runAsUser | int | `65534` | Run as `nobody` user |
| redis | object | See [values.yaml](./values.yaml) | Enable and configure redis subchart under this key. [[ref]](https://github.com/bitnami/charts/tree/main/bitnami/redis) |
| server.additionalContainers.tasks.command | list | See [values.yaml](./values.yaml) | Task command. |
| server.command | list | See [values.yaml](./values.yaml) | Command to run Obico server. |
| server.env | string | See [values.yaml](./values.yaml) | Server environment variables. [[ref]](https://github.com/TheSpaghettiDetective/obico-server/blob/master/dotenv.example) |
| server.image.pullPolicy | string | `"IfNotPresent"` | Server image pull policy |
| server.image.repository | string | `"ghcr.io/gabe565/obico/web"` | Server image repository |
| server.image.tag | string | chart.appVersion | Server image tag |
| server.ingress.main | object | See [values.yaml](./values.yaml) | Enable and configure ingress settings for the chart under this key. |
| server.initContainers.collectstatic.command | list | See [values.yaml](./values.yaml) | Static asset generation command. |
| server.initContainers.migrate.command | list | See [values.yaml](./values.yaml) | Database migration command. |
| server.persistence.data | object | See [values.yaml](./values.yaml) | Data persistence config. |
| server.persistence.media | object | See [values.yaml](./values.yaml) | Media persistence config. |
| server.persistence.static | object | See [values.yaml](./values.yaml) | Static asset persistence config. |
| server.service | object | See [values.yaml](./values.yaml) | Configures service settings for the ML API. |

---
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
