#!/usr/bin/env bash
set -euo pipefail

# require yq
command -v yq >/dev/null 2>&1 || {
  echo >&2 'yq (https://github.com/mikefarah/yq) is not installed. Aborting.'
  exit 1
}

# Absolute path of repository
repository="$(git rev-parse --show-toplevel)"
charts_folder="$repository/charts"
charts_summary_file="$repository/README.md"
charts_header='## Chart Overview'

# Gather all charts
stable_charts="$(find "$charts_folder" -name "Chart.yaml" | sort)"

sed -i '' '/^'"$charts_header"'$/,$d' "$charts_summary_file"

{
  echo "$charts_header"
  echo
  echo "| Chart | Description |"
  echo "| ----- | ----------- |"
  for chart_yaml in ${stable_charts[@]}; do
    IFS=$'\t' read -r chart_name chart_description < <(yq eval -o=tsv '[.name, .description]' "$chart_yaml")
    echo "| [$chart_name](charts/$chart_name) | $chart_description |"
  done
} >> "$charts_summary_file"
