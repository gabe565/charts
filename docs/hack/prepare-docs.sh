#!/usr/bin/env bash
set -euo pipefail
export IFS=$'\n\t'

repo_path="${1:-https://github.com/gabe565/charts}"

cd "$(git rev-parse --show-toplevel)"

mkdir -p docs/docs
tail -n+2 README.md \
  | cat <(echo '# Introduction') - \
  | sed 's/\(## Chart Overview\)/\1 { data-search-exclude }/' \
  >docs/docs/README.md

# Copy readmes
while IFS= read -r -d '' f; do
  mkdir -p "docs/docs/$(dirname "$(dirname "$f")")"

  sed \
    -e "s|(\./\(.*\.yaml\))|($repo_path/blob/main/$(dirname "$f")/\1)|g" \
    -e '/^\*\*Homepage:\*\*/,+1d' \
    "$f" \
    > "docs/docs/charts/$(basename "$(dirname "$f")").md"
done < <(find charts -type f -name '*.md' -not -path './docs/*' -print0)
