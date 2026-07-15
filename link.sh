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
    nvim
)

for dir in "${configs[@]}"; do
    echo "Linkeando $dir"
    ln -sfn "$DOTFILES/$dir" "$CONFIG/$dir"
done

echo "Linkeando zsh"
ln -sfn "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

echo "Linkeando scripts"
ln -sfn "$DOTFILES/scripts" "$HOME/.local/bin/scripts"

echo "Linkeando colors"
ln -sfn "$HOME/.cache/wal/colors-waybar.css" "$CONFIG/waybar/colors.css"
ln -sfn "$HOME/.cache/wal/colors-waybar.css" "$CONFIG/wofi/colors.css"
ln -sfn "$HOME/.cache/wal/colors-kitty.conf" "$CONFIG/kitty/colors.conf"
