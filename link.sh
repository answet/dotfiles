#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"
CONFIG="$HOME/.config"

mkdir -p "$CONFIG"
mkdir -p "$HOME/.local/bin"

configs=(
    hypr
    kitty
    waybar
    wofi
    nsxiv
    yazi
)

for dir in "${configs[@]}"; do
    echo "Linkeando $dir"
    ln -sfn "$DOTFILES/$dir" "$CONFIG/$dir"
done

ln -sfn "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

ln -sfn "$DOTFILES/scripts" "$HOME/.local/bin/scripts"

ln -sfn "$HOME/.cache/wal/colors-waybar.css" "$CONFIG/waybar/colors.css"
ln -sfn "$HOME/.cache/wal/colors-waybar.css" "$CONFIG/wofi/colors.css"
