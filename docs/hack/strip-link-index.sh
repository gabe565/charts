#!/usr/bin/env bash
set -euo pipefail
export IFS=$'\n\t'

cd "$(git rev-parse --show-toplevel)"

while IFS= read -r -d '' file; do
   sed 's|/index\.html"|/"|g' <"$file" >"$file.replaced"
   mv "$file.replaced" "$file"
done < <(find docs/book -name '*.html' -print0)
