# Borgmatic Backup

This chart deploys [`b3vis/borgmatic`](https://hub.docker.com/r/b3vis/borgmatic/) to a Kubernetes cluster.

## TL;DR

```shell
helm repo add clevyr https://helm.clevyr.cloud
helm install borgmatic clevyr/borgmatic
```

## Installing the Chart
To install the chart with the release name `borgmatic`:

```shell
helm install borgmatic clevyr/borgmatic
```

The command deploys Borgmatic on the Kubernetes cluster in the default configuration.
The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip:** List all releases using `helm list`

## Uninstalling the Chart

To uninstall the `borgmatic` deployment:

```shell
helm uninstall borgmatic
```

The command removes all the Kubernetes components but the PVC's associated with the chart and deletes the release.

To delete the PVC's associated with `borgmatic`:

```shell
kubectl delete pvc -l release=borgmatic
```

> **Note:** Deleting the PVC's will delete backup data as well. Please be cautious before doing it.

## Parameters

### Pod parameters

| Name                         | Description                                                                              | Value             |
| ---------------------------- | ---------------------------------------------------------------------------------------- | ----------------- |
| `image.repository`           | Borgmatic image repository                                                               | `b3vis/borgmatic` |
| `image.pullPolicy`           | Image pull policy                                                                        | `Always`          |
| `image.tag`                  | Image tag (immutable tags are recommended)                                               | `""`              |
| `imagePullSecrets`           | Image pull secrets as an array                                                           | `[]`              |
| `nameOverride`               | String to fully override common.names.fullname template (will maintain the release name) | `""`              |
| `fullnameOverride`           | String to fully override common.names.fullname template                                  | `""`              |
| `serviceAccount.create`      | Specifies whether a service account should be created                                    | `false`           |
| `serviceAccount.annotations` | Annotations to add to the service account                                                | `{}`              |
| `serviceAccount.name`        | The name of the service account to use.                                                  | `""`              |
| `podAnnotations`             | Annotations to add to the pod                                                            | `{}`              |
| `podSecurityContext`         | Pod security context parameters                                                          | `{}`              |
| `securityContext`            | Security context parameters                                                              | `{}`              |
| `resources.limits`           | Pod resource limits                                                                      | `{}`              |
| `resources.requests`         | Pod resource requests                                                                    | `{}`              |
| `nodeSelector`               | Node labels for pod assignment                                                           | `{}`              |
| `tolerations`                | Tolerations for pod assignment                                                           | `[]`              |
| `affinity`                   | Affinity for pod assignment                                                              | `{}`              |
| `strategy.type`              | Deployment strategy type                                                                 | `Recreate`        |


### Persistence parameters

| Name                        | Description                                     | Value               |
| --------------------------- | ----------------------------------------------- | ------------------- |
| `persistence.existingClaim` | Name of an existing PVC to use                  | `""`                |
| `persistence.storageClass`  | PVC Storage Class for data volume               | `""`                |
| `persistence.accessModes`   | PVC Access mode for data volume                 | `["ReadWriteOnce"]` |
| `persistence.size`          | PVS Storage Request for data volume             | `8Gi`               |
| `persistence.annotations`   | Annotations to add to the PVC                   | `{}`                |
| `persistence.selector`      | Selector to match an existing Persistent Volume | `{}`                |
| `persistence.dataSource`    | Custom PVC data source                          | `{}`                |


### Auth parameters

| Name                       | Description                                             | Value   |
| -------------------------- | ------------------------------------------------------- | ------- |
| `auth.ssh.enabled`         | Enable SSH key secret                                   | `false` |
| `auth.ssh.existingSecret`  | Use an existing secret for SSH key                      | `""`    |
| `auth.ssh.type`            | SSH key type. Typically "rsa" or "ed25519"              | `rsa`   |
| `auth.ssh.key`             | SSH key                                                 | `""`    |
| `auth.ssh.annotations`     | Annotations to add to the SSH key secret                | `{}`    |
| `auth.borg.existingSecret` | Use an existing secret for Borg repokey                 | `""`    |
| `auth.borg.length`         | Length of the Borg key to generate during first install | `32`    |
| `auth.borg.annotations`    | Annotations to add to the Borg repokey secret           | `{}`    |


### Backup parameters

| Name                                               | Description                                                       | Value                      |
| -------------------------------------------------- | ----------------------------------------------------------------- | -------------------------- |
| `backup.existingConfigMap`                         | Use an existing configmap for Borgmatic and crontab configuration | `""`                       |
| `backup.crontab.pruneCreate`                       | Cron expression for repo prune and backup creation                | `0 * * * *`                |
| `backup.crontab.check`                             | Cron expression for repo consistency checks                       | `30 8 * * *`               |
| `backup.prefix`                                    | Prefix backups with this string (evaluated as a template)         | `{{ .Release.Namespace }}` |
| `backup.localRepo`                                 | Enable local repo at /mnt/borg-repository                         | `true`                     |
| `backup.repos`                                     | Other repos to add to Borgmatic repositories                      | `[]`                       |
| `backup.claims`                                    | Other PVC's to include in the backup                              | `[]`                       |
| `backup.healthchecks`                              | Healthchecks.io check url                                         | `""`                       |
| `backup.checkLast`                                 | Limit how many backups are checked during consistency checks      | `3`                        |
| `backup.keep.hourly`                               | Number of hourly backups to keep during prune                     | `168`                      |
| `backup.keep.daily`                                | Number of daily backups to keep during prune                      | `31`                       |
| `backup.keep.monthly`                              | Number of monthly backups to keep during prune                    | `24`                       |
| `backup.keep.yearly`                               | Number of yearly backups to keep during prune                     | `10`                       |
| `backup.postgresql.enabled`                        | Enable PostgreSQL backup                                          | `false`                    |
| `backup.postgresql.hostname`                       | PostgreSQL hostname                                               | `""`                       |
| `backup.postgresql.database`                       | PostgreSQL database                                               | `db`                       |
| `backup.postgresql.username`                       | PostgreSQL username                                               | `postgres`                 |
| `backup.postgresql.passwordFrom.secretKeyRef.name` | Secret name to use for PostgreSQL password                        | `postgresql`               |
| `backup.postgresql.passwordFrom.secretKeyRef.key`  | Key on secret to use for PostgreSQL password                      | `postgresql-password`      |
| `backup.postgresql.format`                         | Database dump format                                              | `plain`                    |
| `backup.mariadb.enabled`                           | Enable MariaDB backup                                             | `false`                    |
| `backup.mariadb.hostname`                          | MariaDB hostname                                                  | `""`                       |
| `backup.mariadb.database`                          | MariaDB database                                                  | `db`                       |
| `backup.mariadb.username`                          | MariaDB username                                                  | `mariadb`                  |
| `backup.mariadb.passwordFrom.secretKeyRef.name`    | Secret name to use for MariaDB password                           | `mariadb`                  |
| `backup.mariadb.passwordFrom.secretKeyRef.key`     | Key on secret to use for MariaDB password                         | `mariadb-password`         |


## License

Copyright © 2022 Gabe Cook

Licensed under the GNU General Public License, Version 3 or any later version (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

```
https://www.gnu.org/licenses/gpl-3.0.en.html
```
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
