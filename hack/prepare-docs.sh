#!/usr/bin/env bash
set -euo pipefail
export IFS=$'\n\t'

repo_path="${1:-https://github.com/gabe565/charts}"

cd "$(git rev-parse --show-toplevel)"

cp README.md docs/README.md
cp .gitignore docs/.gitignore

CHARTS=()

# Copy readmes
while IFS= read -r -d '' f; do
  mkdir -p "docs/$(dirname "$f")"

  sed '/^\*\*Homepage:\*\*/,+1d' "$f" \
    | sed "s|(\./\(.*\.yaml\))|($repo_path/blob/main/$(dirname "$f")/\1)|g" \
    > "docs/$f"

  CHARTS+=("$(basename "$(dirname "$f")")")
done < <(find charts -type f -name '*.md' -not -path './docs/*' -print0)

# Add charts to sidebar
CHARTS="$(printf '%s\n' "${CHARTS[@]}" | sort -h)" yq \
  '(.docs[] | select(.title == "Charts") | .children) = [(strenv(CHARTS) | split("\n") | .[] | {"title": ., "url": "/charts/" + . + "/"})]' \
  docs/_data/navigation_src.yml \
  > docs/_data/navigation.yml
