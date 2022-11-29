# headscale

![Version: 0.1.15](https://img.shields.io/badge/Version-0.1.15-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.17.0](https://img.shields.io/badge/AppVersion-0.17.0-informational?style=flat-square)

An open source, self-hosted implementation of the Tailscale control server.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/gabe565/charts/issues/new)**

## Source Code

* <https://github.com/juanfont/headscale>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s.github.io/helm-charts | common | 0.2.0 |
| https://charts.bitnami.com/bitnami | postgresql | 11.9.1 |

## TL;DR

```console
helm repo add gabe565 https://charts.gabe565.com
helm repo update
helm install headscale gabe565/headscale
```

## Installing the Chart

To install the chart with the release name `headscale`

```console
helm install headscale gabe565/headscale
```

## Uninstalling the Chart

To uninstall the `headscale` deployment

```console
helm uninstall headscale
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install headscale \
  --set env.TZ="America/New York" \
    gabe565/headscale
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install headscale gabe565/headscale -f values.yaml
```

## Custom configuration

Headscale runs in a distroless Docker container, which does not have any of the
expected command line utilities. This keeps the container small and minimizes the possibility of CVEs,
but it makes working with a config file in Kubernetes more difficult.

To keep config simple, this Helm chart opts to use environment variables.
All of the Headscale config variables are supported as envs, but official documentation is lacking.

To configure Headscale:
1. See the [Headscale example config](https://github.com/juanfont/headscale/blob/main/config-example.yaml) for available variables.
2. For any that you want to set: flatten object keys using `_`, then prefix with `HEADSCALE_`.
    - For example, the following config:
      ```yaml
      disable_check_updates: true
      log:
        level: warn
      ```
      would be set with the following Helm values:
      ```yaml
      env:
        HEADSCALE_DISABLE_CHECK_UPDATES: "true"
        HEADSCALE_LOG_LEVEL: "warn"
      ```

Also, note that this chart sets some defaults based on your values.
See [`templates/common.yaml`](./templates/common.yaml) for a list.

### Headscale UI

You can deploy [gurucomputing/headscale-ui](https://github.com/gurucomputing/headscale-ui)
as a sidecar container by adding the following values:

```yaml
additionalContainers:
  ui:
    image: ghcr.io/gurucomputing/headscale-ui:latest
    ports:
      - name: http
        containerPort: 80

service:
  main:
    ports:
      ui:
        enabled: true
        port: 80

ingress:
  ui:
    enabled: true
    hosts:
      - host: example.com
        paths:
          - path: /web
            service:
              port: 80
    tls:
      - ...
```

Once deployed, the UI will be available at `/web`.

## Values

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See values.yaml | Environment variables. [[ref]](https://github.com/juanfont/headscale/blob/main/config-example.yaml) |
| env.HEADSCALE_DNS_CONFIG_BASE_DOMAIN | string | `"example.com"` | Defines the base domain to create the hostnames for MagicDNS. `base_domain` must be a FQDNs, without the trailing dot. The FQDN of the hosts will be `hostname.namespace.base_domain` (e.g., _myhost.mynamespace.example.com_). |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"headscale/headscale"` | image repository |
| image.tag | string | `""` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence.config | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql | object | See values.yaml | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) |
| secret | object | See values.yaml | Secret environment variables. |
| service.main | object | See values.yaml | Configures service settings for the chart. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
