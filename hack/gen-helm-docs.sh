#!/usr/bin/env bash
set -euo pipefail

# Generate helm-docs for Helm charts
# Usage ./gen-helm-docs.sh [chart]

# require helm-docs
command -v helm-docs >/dev/null 2>&1 || {
  echo >&2 'helm-docs (https://github.com/norwoodj/helm-docs) is not installed. Aborting.'
  exit 1
}

# require yq
command -v yq >/dev/null 2>&1 || {
  echo >&2 'yq (https://github.com/mikefarah/yq) is not installed. Aborting.'
  exit 1
}

# Absolute path of repository
repository="$(git rev-parse --show-toplevel)"
charts_folder="$repository/charts"

# Templates to copy into each chart directory
template_dir="$repository/hack/templates"
readme_config_template="$template_dir/README_CONFIG.md.gotmpl"
icon_template=$(<"$template_dir/icon.gotmpl")

# Gather all charts using the common library, excluding common-test
charts="$(find "$charts_folder" -name Chart.yaml)"

# Allow for a specific chart to be passed in as a argument
if [ $# -ge 1 ] && [ -n "$1" ]; then
  root="$(find "$charts_folder" -name "$1")"
  charts="$root/Chart.yaml"
  if [ ! -f "$charts" ]; then
    echo "Chart $1 does not exist."
    exit 1
  fi
else
  root="$charts_folder"
fi

for chart in $charts; do (
  chart_directory="$(dirname "$chart")"
  icon="$(yq eval '.icon // ""' "$chart" 2>/dev/null)"

  # Copy CONFIG template to each Chart directory, do not overwrite if exists
  cp -n "$readme_config_template" "$chart_directory" || true

  # Run helm-docs for charts
  helm-docs \
    --log-level=warning \
    --template-files="$template_dir/README.md.gotmpl" \
    --template-files=<(echo "${icon_template/\$ICON/$icon}") \
    --template-files="$(basename "$readme_config_template")" \
    --badge-style=flat \
    --chart-search-root="$root" \
    --chart-to-generate="$chart_directory"
) done
