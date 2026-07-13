# Dotfiles

Mi configuración de Arch Linux + Hyprland.

## Contenido

- Hyprland
- Waybar
- Wofi
- Kitty
- Zsh
- Scripts personales

## Instalación

En desarrollo.

## Instalar paquetes oficiales

```bash
sudo pacman -S --needed - < packages/official.txt
```

## Instalar paquetes de AUR

```bash
yay -S --needed - < packages/aur.txt
```

## Instalar aplicaciones de pipx

```bash
while read pkg; do
    pipx install "$pkg"
done < packages/pipx.txt
```
