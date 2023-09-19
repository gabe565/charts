# Borgmatic

<img src="https://raw.githubusercontent.com/borgmatic-collective/borgmatic/1.6.6/docs/static/borgmatic.svg" align="right" width="92" alt="borgmatic logo">

![Version: 0.9.0](https://img.shields.io/badge/Version-0.9.0-informational?style=flat)
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
![AppVersion: 1.8.2](https://img.shields.io/badge/AppVersion-1.8.2-informational?style=flat)

borgmatic is simple, configuration-driven backup software for servers and workstations. Protect your files with client-side encryption. Backup your databases too. Monitor it all with integrated third-party services.

**Homepage:** <https://charts.gabe565.com/charts/borgmatic/>

**This chart is not maintained by the upstream project and any issues with the chart should be raised
[here](https://github.com/gabe565/charts/issues/new?assignees=gabe565&labels=bug&template=bug_report.yaml&name=borgmatic&version=0.9.0)**

## Source Code

* <https://projects.torsion.org/borgmatic-collective/borgmatic>
* <https://github.com/borgmatic-collective/docker-borgmatic>

## Requirements

Kubernetes: `>=1.21.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| <https://bjw-s.github.io/helm-charts> | common | 1.5.1 |

## Installing the Chart

To install the chart with the release name `borgmatic`

### OCI (Recommended)

```console
helm install borgmatic oci://ghcr.io/gabe565/charts/borgmatic
```

### Traditional

```console
helm repo add gabe565 https://charts.gabe565.com
helm repo update
helm install borgmatic gabe565/borgmatic
```

## Uninstalling the Chart

To uninstall the `borgmatic` deployment

```console
helm uninstall borgmatic
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common/values.yaml) from the [bjw-s common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install borgmatic \
  --set env.TZ="America/New York" \
    gabe565/borgmatic
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install borgmatic gabe565/borgmatic -f values.yaml
```

## Custom configuration

### Deploy as a CronJob

If you prefer to use a CronJob instead of a Deployment, set the following values:
```yaml
controller:
  type: cronjob
  cronjob:
    schedule: 0 1 * * *
```

### First Time Setup

1. After initial chart installation, you will need to initialize the Borg repository:

    ```shell
    kubectl rollout status deployment.apps/borgmatic
    kubectl exec -i deployment.apps/borgmatic -- borgmatic --init --encryption repokey-blake2
    ```

2. Create an initial backup to ensure Borgmatic is configured correctly:

    ```shell
    kubectl exec -it deployment.apps/borgmatic -- borgmatic create --stats
    ```

3. Ensure you have stored the passphrase externally to prevent data loss.

## Values

**Important**: When deploying an application Helm chart you can add more values from the bjw-s common library chart [here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configMaps.config | object | See [values.yaml](./values.yaml) | Configure Borgmatic container under this key. |
| configMaps.config.data."config.yaml" | string | See [values.yaml](./values.yaml) | Borgmatic config. [[ref]](https://torsion.org/borgmatic/docs/reference/configuration) |
| configMaps.config.data."crontab.txt" | string | `"0 1 * * * PATH=$PATH:/usr/bin /usr/local/bin/borgmatic --stats -v 0 2>&1"` | Crontab |
| controller.cronjob.backoffLimit | int | `0` | Only used when `controller.type: cronjob`. Sets the CronJob backoffLimit. |
| controller.cronjob.schedule | string | `"0 * * * *"` | Only used when `controller.type: cronjob`. Sets the backup CronJob time. |
| controller.type | string | `"deployment"` | Set the controller type. Valid options are `deployment` or `cronjob`. |
| env | object | See [values.yaml](./values.yaml) | environment variables. [[ref]](https://borgbackup.readthedocs.io/en/stable/usage/general.html#environment-variables) |
| env.BORG_HOST_ID | string | Deployment namespace | Borg host ID used in archive names |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/borgmatic-collective/borgmatic"` | image repository |
| image.tag | string | `"1.8.2"` | image tag |
| persistence.data | object | See [values.yaml](./values.yaml) | Configure persistence settings for the chart under this key. |
| persistence.ssh | object | See [values.yaml](./values.yaml) | Configure SSH credentials for the chart under this key. |

---
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
