# Headscale

<img src="https://raw.githubusercontent.com/juanfont/headscale/56a7b1e/docs/logo/headscale3-dots.svg" align="right" width="92" alt="headscale logo">

![Version: 0.15.0](https://img.shields.io/badge/Version-0.15.0-informational?style=flat)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
![AppVersion: v0.23.0](https://img.shields.io/badge/AppVersion-v0.23.0-informational?style=flat)

An open source, self-hosted implementation of the Tailscale control server.

**Homepage:** <https://charts.gabe565.com/charts/headscale/>

**This chart is not maintained by the upstream project and any issues with the chart should be raised
[here](https://github.com/gabe565/charts/issues/new?assignees=gabe565&labels=bug&template=bug_report.yaml&name=headscale&version=0.15.0)**

## Source Code

* <https://github.com/juanfont/headscale>

## Requirements

Kubernetes: `>=1.22.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| <https://bjw-s.github.io/helm-charts> | common | 1.5.1 |
| <https://charts.bitnami.com/bitnami> | postgresql | 14.3.3 |

## Installing the Chart

To install the chart with the release name `headscale`

### OCI (Recommended)

```console
helm install headscale oci://ghcr.io/gabe565/charts/headscale
```

### Traditional

```console
helm repo add gabe565 https://charts.gabe565.com
helm repo update
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
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common).

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

To keep config simple, this Helm chart suggests using environment variables.
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
sidecars:
  ui:
    image: ghcr.io/gurucomputing/headscale-ui:latest
    ports:
      - name: http
        containerPort: 80

service:
  main:
    ports:
      ui:
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

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| args | list | `["serve"]` | Container args |
| configMaps.acl.data.policy | string | `nil` | ACL policy JSON [[ref]](https://tailscale.com/kb/1018/acls/) |
| configMaps.acl.enabled | bool | `false` | Enables ACL policy |
| env | object | See [values.yaml](./values.yaml) | Environment variables. [[ref]](https://github.com/juanfont/headscale/blob/main/config-example.yaml) |
| env.HEADSCALE_DNS_BASE_DOMAIN | string | `"example.com"` | Defines the base domain to create the hostnames for MagicDNS. This domain _must_ be different from the server_url domain. |
| env.HEADSCALE_DNS_MAGIC_DNS | string | `"true"` | Whether to use [MagicDNS](https://tailscale.com/kb/1081/magicdns/). |
| env.HEADSCALE_DNS_NAMESERVERS_GLOBAL | string | `"1.1.1.1 1.0.0.1"` | List of DNS servers to expose to clients. |
| env.HEADSCALE_PREFIXES_V4 | string | `"100.64.0.0/10"` | Node IPv4 prefixes |
| env.HEADSCALE_PREFIXES_V6 | string | `"fd7a:115c:a1e0::/48"` | Node IPv6 prefixes |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/juanfont/headscale"` | image repository |
| image.tag | string | `"v0.23.0"` | image tag |
| ingress.main | object | See [values.yaml](./values.yaml) | Enable and configure ingress settings for the chart under this key. |
| persistence.config | object | See [values.yaml](./values.yaml) | Configure persistence settings for the chart under this key. |
| postgresql | object | See [values.yaml](./values.yaml) | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/main/bitnami/postgresql) |
| service.main | object | See [values.yaml](./values.yaml) | Configures service settings for the chart. |
| serviceMonitor.main.enabled | bool | `false` | Enables or disables the serviceMonitor. |
| serviceMonitor.main.endpoints | list | See [values.yaml](./values.yaml) | Configures the endpoints for the serviceMonitor. |

---
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
