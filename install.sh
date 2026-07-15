#!/usr/bin/env bash

install_pacman_packages() {
    local file="$1"

    [ -f "$file" ] || return

    sudo pacman -S --needed --noconfirm $(grep -vE '^\s*(#|$)' "$file")
}

install_aur_packages() {
    local file="$1"

    [ -f "$file" ] || return

    yay -S --needed --noconfirm $(grep -vE '^\s*(#|$)' "$file")
}


echo "==> Instalando paquetes pacman base..."
install_pacman_packages packages/base/pacman.txt

echo "==> Instalando yay..."
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si --noconfirm
cd -
rm -rf /tmp/yay

echo
echo "==> Instalando paquetes AUR base..."
install_aur_packages packages/base/aur.txt

echo
echo "==> Instalando paquetes pipx base..."
while read -r package; do
    [[ -z "$package" ]] && continue
    pipx install "$package"
done < packages/base/pipx.txt

echo
echo "==> Creando carpeta para wallpapers..."
mkdir -p "$HOME/Pictures/Wallpapers/"

echo
echo "==> Instalando Oh My Zsh..."
# Instalar Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo
echo "==> Creando symlinks..."
./link.sh

read -rp "¿Querés instalar los paquetes opcionales? [y/N]: " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "Instalando paquetes opcionales..."
    install_pacman_packages packages/optional/pacman.txt
    install_aur_packages packages/optional/aur.txt
else
    echo "Omitiendo paquetes opcionales."
fi

mkdir -p "$HOME/.cache/"
echo "$HOME/dotfiles/hypr/wallpaper.jpg" > $HOME/.cache/current-wallpaper

echo
echo "✔ Instalación finalizada."
