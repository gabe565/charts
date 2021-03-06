# ascii-telnet-rust

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

Star Wars telnet server written in Rust

## Source Code

* <https://github.com/gabe565/ascii-telnet-rust>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.4.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controller.strategy | string | `"RollingUpdate"` | Set the controller upgrade strategy |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"ghcr.io/gabe565/ascii-telnet-rust"` | image repository |
| image.tag | string | `"latest"` | image tag |
| resources.limits.cpu | string | `"50m"` | CPU limit |
| resources.limits.memory | string | `"50Mi"` | Memory limit |
| resources.requests.cpu | string | `"1m"` | CPU requests |
| resources.requests.memory | string | `"1Mi"` | Memory requests |
| service | object | See values.yaml | Configures service settings for the chart. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.10.0](https://github.com/norwoodj/helm-docs/releases/v1.10.0)
