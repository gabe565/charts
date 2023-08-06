# Generic Device Plugin

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat)

The generic-device-plugin enables allocating generic Linux devices, such as serial devices, the FUSE device, or video cameras, to Kubernetes Pods

**Homepage:** <https://charts.gabe565.com/charts/generic-device-plugin/>

**This chart is not maintained by the upstream project and any issues with the chart should be raised
[here](https://github.com/gabe565/charts/issues/new?assignees=gabe565&labels=bug&template=bug_report.yaml&name=generic-device-plugin&version=0.1.1)**

## Source Code

* <https://github.com/squat/generic-device-plugin>

## Requirements

Kubernetes: `>=1.22.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| <https://bjw-s.github.io/helm-charts> | common | 1.5.1 |

## TL;DR

```console
helm repo add gabe565 https://charts.gabe565.com
helm repo update
helm install generic-device-plugin gabe565/generic-device-plugin
```

## Installing the Chart

To install the chart with the release name `generic-device-plugin`

```console
helm install generic-device-plugin gabe565/generic-device-plugin
```

## Uninstalling the Chart

To uninstall the `generic-device-plugin` deployment

```console
helm uninstall generic-device-plugin
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install generic-device-plugin \
  --set env.TZ="America/New York" \
    gabe565/generic-device-plugin
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install generic-device-plugin gabe565/generic-device-plugin -f values.yaml
```

## Custom configuration

### Configuring Devices
Generic Device Plugin will only expose whitelisted devices.
To add a device with this Helm chart, add it to `config.data` in the following format:

```yaml
config:
  data: |
    devices:
      - <device specs>
```

#### Device Spec
- Multiple paths can be given for each type. Paths can be globs.
- Should be provided in the form:
  ```yaml
  name: <name>
  groups:
    - <device definitions>
  count: <count>
  ```

#### Device Definition
- The device definition can be either a path to a device file or a USB device. You cannot define both in the same group.
- For device files, use something like:
  ```yaml
  paths:
    - path: <path-1>
      mountPath: <mount-path-1>
    - path: <path-2>
      mountPath: <mount-path-2>
  ```
  - For example, to expose serial devices with different names:
    ```yaml
    name: serial
    groups:
      - paths:
          - path: /dev/ttyUSB*
      - paths:
          - path: /dev/ttyACM*
    ```
  - For USB devices, use something like:
    ```yaml
    usb:
      - vendor: "1209"
        product: "000F"
    ```
  - For example, to expose a CH340 serial converter:
    ```yaml
    name: ch340
    groups:
      - usb:
          - vendor: "1a86"
            product: "7523"
    ```
- The device flag can specify lists of devices that should be grouped and mounted into a container together as one single meta-device.
  - For example, to allocate and mount an audio capture device:
    ```yaml
    name: capture
    groups:
      - paths:
          - path: /dev/snd/pcmC0D0c
          - path: /dev/snd/controlC0
    ```
- A "count" can be specified to allow a discovered device group to be scheduled multiple times.
  - For example, to permit allocation of the FUSE device 10 times:
    ```yaml
    name: fuse
    groups:
      - count: 10
        paths:
          - path: /dev/fuse
    ```
  - Note: if omitted, "count" is assumed to be 1

See [values.yaml](./values.yaml) for an example configuration file.

## Values

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.data | string | See [values.yaml](./values.yaml) | generic-device-plugin config file [[ref]](https://github.com/squat/generic-device-plugin#usage) |
| config.enabled | bool | `true` | Enables the config file ConfigMap |
| controller.type | string | `"daemonset"` | Sets the controller type |
| env | object | See [values.yaml](./values.yaml) | Environment variables [[ref]](https://github.com/squat/generic-device-plugin#usage) |
| env.DOMAIN | string | `"squat.ai"` | The domain to use when declaring devices |
| image.pullPolicy | string | `"Always"` | Image pull policy |
| image.repository | string | `"ghcr.io/squat/generic-device-plugin"` | Image repository |
| image.tag | string | `"latest"` | Image tag |
| persistence.dev | object | See [values.yaml](./values.yaml) | Host path volume bind to the dev dir |
| persistence.device-plugins | object | See [values.yaml](./values.yaml) | Host path volume bind to the Kubelet plugin directory |
| probes.liveness | object | `{"path":"/health","type":"HTTP"}` | Configures liveness probe |
| probes.readiness | object | `{"path":"/health","type":"HTTP"}` | Configures readiness probe |
| probes.startup | object | `{"path":"/health","type":"HTTP"}` | Configures startup probe |
| securityContext.privileged | bool | `true` | Privileged mode is required to access devices |
| service.main | object | See [values.yaml](./values.yaml) | Configures health/metrics service settings for the chart. |
| serviceMonitor.main.enabled | bool | `false` | Enables or disables the serviceMonitor. |
| serviceMonitor.main.endpoints | list | See [values.yaml](./values.yaml) | Configures the endpoints for the serviceMonitor. |

---
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
