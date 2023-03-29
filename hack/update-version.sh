#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# require yq
command -v yq >/dev/null 2>&1 || {
  echo >&2 'yq (https://github.com/mikefarah/yq) is not installed. Aborting.'
  exit 1
}

function _print_usage() {
  echo 'Usage: {major|minor|patch} [chart...]'
  exit "${1:-0}"
}

if [ "$#" -eq 0 ]; then
  _print_usage
fi

UPDATE_TYPE="$(tr '[:upper:]' '[:lower:]' <<<"$1")"
shift
case "$UPDATE_TYPE" in
  major) SCRIPT='[(.0 | @yamld | . + 1), 0, 0]' ;;
  minor) SCRIPT='[.0, (.1 | @yamld | . + 1), 0]' ;;
  patch) SCRIPT='[.0, .1, (.2 | @yamld | . + 1)]' ;;
  *) echo >&2 "Invalid update type: $UPDATE_TYPE"; _print_usage 1 ;;
esac

echo "Performing $UPDATE_TYPE version bump"

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

  current="$(yq '.version' "$meta_file")"
  yq -i '.version |= (split(".") | '"$SCRIPT"' | join("."))' "$meta_file"
  new="$(yq '.version' "$meta_file")"
  echo "Updated $(basename "$chart") from v$current to v$new"
) done
