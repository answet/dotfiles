local colors = require("colors")

hl.config({

  general = {
    gaps_in = 2,
    gaps_out = 10,

    border_size = 2,

    col = {
      active_border = colors.color2,
      inactive_border = colors.color0,
    },

    resize_on_border = false,

    allow_tearing = false,
  },

  decoration = {
    rounding = 10,
    rounding_power = 2,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    blur = {
      enabled = false,
      size = 4,
      passes = 1,
      noise = 0.1,
    },
  },

  animations = {
    enabled = true,
  },

  input = {
    kb_layout  = "us",
    kb_variant = "",
    kb_model   = "",
    kb_options = "",
    kb_rules   = "",

    follow_mouse = 1,

    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

    accel_profile = "flat",
  },

  misc = {
    disable_hyprland_logo = true,
    force_default_wallpaper = 0,
  },
})
