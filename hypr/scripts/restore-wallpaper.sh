#!/bin/bash

CACHE="$HOME/.cache/current-wallpaper"

# ¿Existe el archivo de cache?
[ -f "$CACHE" ] || exit 0

wallpaper=$(<"$CACHE")

# ¿Está vacío?
[ -n "$wallpaper" ] || exit 0

# ¿Sigue existiendo el wallpaper?
if [ ! -f "$wallpaper" ]; then
  rm -f "$CACHE"
  exit 0
fi

hyprctl hyprpaper preload "$wallpaper"
hyprctl hyprpaper wallpaper ",$wallpaper"
hyprctl hyprpaper unload unused
