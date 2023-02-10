#!/usr/bin/env bash
set -euo pipefail
export IFS=$'\n\t'

# require yq
command -v yq >/dev/null 2>&1 || {
  echo >&2 'yq (https://github.com/mikefarah/yq) is not installed. Aborting.'
  exit 1
}

if [[ "${3:-}" == supports ]]; then
  exit
fi

export FIND="$1" REPLACE="$2"
yq -o json '.[1] | (.. | select(key == "content")) |= sub(strenv(FIND), strenv(REPLACE))' -
