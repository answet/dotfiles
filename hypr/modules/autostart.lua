
hl.on("hyprland.start", function()
  hl.exec_cmd("waybar & hyprpaper")
  hl.exec_cmd("~/.config/hypr/scripts/restore-wallpaper.sh")
--  h1.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
end)
