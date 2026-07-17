
hl.on("hyprland.start", function()
  hl.exec_cmd("hyprpaper & waybar")
  hl.exec_cmd("~/.config/hypr/scripts/restore.sh")
end)
