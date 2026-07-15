#!/usr/bin/env bash

log() {
  echo
  echo "==> $1"
}

install_pacman_packages() {
    local file="$1"

    [ -f "$file" ] || return

    mapfile -t packages < <(grep -vE '^\s*(#|$)' "$file")

    sudo pacman -S --needed --noconfirm "${packages[@]}"
}

install_aur_packages() {
    local file="$1"

    [ -f "$file" ] || return

    mapfile -t packages < <(grep -vE '^\s*(#|$)' "$file")

    yay -S --needed "${packages[@]}"
}

log "Instalando paquetes pacman base..."
install_pacman_packages packages/base/pacman.txt

log "Instalando yay..."
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si --noconfirm
cd -
rm -rf /tmp/yay

log "Instalando paquetes AUR base..."
install_aur_packages packages/base/aur.txt

log "Instalando paquetes pipx base..."
while read -r package; do
    [[ -z "$package" ]] && continue
    pipx install "$package"
done < packages/base/pipx.txt

log "Creando carpeta para wallpapers..."
mkdir -p "$HOME/Pictures/Wallpapers/"

log "Instalando Oh My Zsh..."
# Instalar Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

log "Creando symlinks..."
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
echo "$HOME/dotfiles/hypr/wallpaper.jpg" > "$HOME/.cache/current-wallpaper"

log "Instalación finalizada."
log "Es necesario reiniciar la sesion."
