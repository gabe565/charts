#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# require yq
command -v yq >/dev/null 2>&1 || {
  echo >&2 'yq (https://github.com/mikefarah/yq) is not installed. Aborting.'
  exit 1
}

if [ "$#" -eq 0 ]; then
    echo 'Usage: changelog [chart...]'
    exit
fi

changelog="$(yq -P <<<"$1")"
export changelog
shift

CHARTS=()
if [ "$#" -gt 0 ]; then
  # Get changed dirs from params
  for file in "$@"; do
    CHARTS+=( "$(dirname "$file")" )
  done
else
  # Get changed dirs from uncommitted changes
  for file in $(git status --porcelain charts | grep '^M' | cut -c4-); do
    CHARTS+=( "$(dirname "$file")" )
  done
fi
CHARTS=( $(sort -u <<<"${CHARTS[*]}") )

for chart in "${CHARTS[@]}"; do (
  meta_file="$chart/Chart.yaml"
  if [ ! -f "$meta_file" ]; then echo >&2 "Invalid file: $meta_file"; exit; fi

  yq -i '.annotations."artifacthub.io/changes" = (strenv(changelog) | @yamld style="literal" | @yaml)' "$meta_file"
  echo "Updated $(basename "$chart") changelog"
) done
