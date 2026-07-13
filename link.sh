#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"
CONFIG="$HOME/.config"

configs=(
    hypr
    kitty
    waybar
    wofi
)

for dir in "${configs[@]}"; do
    echo "Linkeando $dir"
    ln -sfn "$DOTFILES/$dir" "$CONFIG/$dir"
done

ln -sfn "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

ln -sfn "$DOTFILES/scripts" "$HOME/.local/bin/scripts"
