# Home Assistant

<img src="https://raw.githubusercontent.com/gabe565/charts/main/charts/home-assistant/icon.svg" align="right" width="92" alt="home-assistant logo">

![Version: 0.18.0](https://img.shields.io/badge/Version-0.18.0-informational?style=flat)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat)

Open source home automation that puts local control and privacy first.

**Homepage:** <https://charts.gabe565.com/charts/home-assistant/>

**This chart is not maintained by the upstream project and any issues with the chart should be raised
[here](https://github.com/gabe565/charts/issues/new?assignees=gabe565&labels=bug&template=bug_report.yaml&name=home-assistant&version=0.18.0)**

## Source Code

* <https://github.com/home-assistant/core>

## Requirements

Kubernetes: `>=1.22.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| <https://bjw-s.github.io/helm-charts> | common | 1.5.1 |
| <https://charts.bitnami.com/bitnami> | postgresql | 14.3.3 |

## Installing the Chart

To install the chart with the release name `home-assistant`

### OCI (Recommended)

```console
helm install home-assistant oci://ghcr.io/gabe565/charts/home-assistant
```

### Traditional

```console
helm repo add gabe565 https://charts.gabe565.com
helm repo update
helm install home-assistant gabe565/home-assistant
```

## Uninstalling the Chart

To uninstall the `home-assistant` deployment

```console
helm uninstall home-assistant
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install home-assistant \
  --set env.TZ="America/New York" \
    gabe565/home-assistant
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install home-assistant gabe565/home-assistant -f values.yaml
```

## Custom configuration

### HTTP 400 bad request while accessing from your browser

When configuring Home Assistant behind a reverse proxy make sure you configure the [http](https://www.home-assistant.io/integrations/http) component and set `trusted_proxies` correctly and `use_x_forwarded_for` to `true`.

For example (edit the configuration.yaml in your pod):

```yaml
http:
  server_host: 0.0.0.0
  ip_ban_enabled: true
  login_attempts_threshold: 5
  use_x_forwarded_for: true
  trusted_proxies:
    # Pod CIDR
    - 10.69.0.0/16
    # Node CIDR
    - 192.168.42.0/24
```

### USB Devices

A USB devices can be used with Home Assistant if passed through from the host to the pod.

The USB device could be volume bound directly into the Pod
([documented in the deprecated k8s-at-home/home-assistant chart](https://github.com/k8s-at-home/charts/tree/master/charts/stable/home-assistant#z-wave--zigbee),
but this requires granting privileged access to the Home Assistant pod.

Instead, it is recommended to use [Generic Device Plugin](../generic-device-plugin/) or [Smarter Device Manager](../smarter-device-manager/) to manage USB devices for you.

For example, if your Z-Wave device is at `/dev/ttyACM0`, you could deploy Smarter Device Manager with the following configuration:

```yaml
config: |
  - devicematch: ^ttyACM[0-9]*$
    nummaxdevices: 1
```

Then, add the following resources to your Home Assistant `values.yaml`:

```yaml
resources:
  limits:
    smarter-devices/ttyACM0: 1
  requests:
    smarter-devices/ttyACM0: 1
```

Your Home Assistant Pod would automatically be deployed to the correct server, with the USB device available at `/dev/ttyACM0`.
No extra privileges required!

## Values

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/a081de5/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| addons.codeserver.enabled | bool | `false` | Enable VS Code server addon.    This allows for easy access to configuration.yaml |
| addons.codeserver.ingress | object | See [values.yaml](./values.yaml) | Enable and configure ingress settings for the VS Code server under this key. |
| dnsPolicy | string | `"ClusterFirst"` | When hostNetwork is true set dnsPolicy to `ClusterFirstWithHostNet` |
| env | object | See [values.yaml](./values.yaml) | environment variables. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| hostNetwork | bool | `false` | Enable devices to be discoverable |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/home-assistant/home-assistant"` | image repository |
| image.tag | string | `"latest"` | image tag |
| ingress.main | object | See [values.yaml](./values.yaml) | Enable and configure ingress settings for the chart under this key. |
| persistence.config | object | See [values.yaml](./values.yaml) | Configure persistence settings for the chart under this key. |
| postgresql | object | See [values.yaml](./values.yaml) | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/main/bitnami/postgresql) |
| service | object | See [values.yaml](./values.yaml) | Configures service settings for the chart. |

---
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
