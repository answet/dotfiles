#!/bin/bash

INPUT="$HOME/.cache/wal/colors-hyprland.conf"
OUTPUT="$HOME/.config/hypr/colors.lua"
TMP="$OUTPUT.tmp"

echo "return {" > "$TMP"

while IFS='=' read -r key value; do
    key=$(echo "$key" | tr -d ' $')
    value=$(echo "$value" | xargs)

    [ -z "$key" ] && continue

    key="${key#\$}"

    echo "    $key = \"$value\"," >> "$TMP"
done < "$INPUT"

sed -i '$ s/,$//' "$TMP"

echo "}" >> "$TMP"

mv "$TMP" "$OUTPUT"
