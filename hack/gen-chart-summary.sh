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
    if ! git ls-files --error-unmatch "$chart_yaml" &>/dev/null; then continue; fi
    IFS=$'\t' read -r chart_name chart_description chart_icon < <(yq eval -o=tsv '[.name, .description, .icon // ""]' "$chart_yaml")
    if [[ -n "$chart_icon" ]]; then
      width=18
      if [[ "$chart_name" == mnemonic-ninja ]]; then
        width=12
      fi
      chart_icon="<img src='$chart_icon' alt='$chart_name icon' width='${width}px' align='right' loading='lazy'>"
    fi
    pretty_name="$(head -n1 "$(dirname "$chart_yaml")/README.md" | sed 's/^# //')"
    echo "| [$pretty_name $chart_icon](charts/$chart_name/) | $chart_description |"
  done
} >> "$charts_summary_file"
