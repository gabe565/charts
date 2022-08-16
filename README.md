# Charts

A collection of Helm charts, based on the
[k8s-at-home library chart](https://github.com/k8s-at-home/library-charts).

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```shell
helm repo add gabe565 https://charts.gabe565.com
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
gabe565` to see the charts.

To install the <chart-name> chart:

```shell
helm install my-<chart-name> gabe565/<chart-name>
```

To uninstall the chart:

```shell
helm delete my-<chart-name>
```
