#!/usr/bin/env bash
set -euo pipefail

SRC="_migration/oregonmotorcyclerental.com/wp-content/uploads"
DEST="public/images"

find "$SRC" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.gif" -o -name "*.webp" \) | while read -r file; do
  rel="${file#$SRC/}"
  dest_file="$DEST/$rel"
  mkdir -p "$(dirname "$dest_file")"
  cp "$file" "$dest_file"
done

echo "Done. Images copied to $DEST"
