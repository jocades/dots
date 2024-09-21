local wezterm = require("wezterm")

return {
  color_scheme = "Catppuccin Mocha",
  font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" }),
  font_size = 12.5, -- 18 for recording
  cursor_blink_rate = 750,
  audible_bell = "Disabled",
  enable_tab_bar = false,
  macos_window_background_blur = 30,
  window_background_opacity = 0.95,
  window_decorations = "RESIZE",
  window_close_confirmation = "NeverPrompt",

  keys = {
    {
      key = "m",
      mods = "CMD",
      action = wezterm.action.DisableDefaultAssignment,
    },
  },
}
