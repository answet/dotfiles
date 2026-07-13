#!/usr/bin/env bash

set -e

echo "==> Instalando paquetes oficiales..."

sudo pacman -Syu --needed - < packages/official.txt

if ! command -v yay >/dev/null 2>&1; then
    echo "==> Instalando yay..."

    sudo pacman -S --needed base-devel git

    git clone https://aur.archlinux.org/yay.git /tmp/yay

    cd /tmp/yay

    makepkg -si --noconfirm

    cd -

    rm -rf /tmp/yay
fi

echo
echo "==> Instalando paquetes AUR..."

yay -S --needed - < packages/aur.txt

echo
echo "==> Instalando paquetes pipx..."

while read -r package; do
    [[ -z "$package" ]] && continue
    pipx install "$package"
done < packages/pipx.txt

echo
echo "✔ Instalación finalizada."
