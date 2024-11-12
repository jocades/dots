local wezterm = require("wezterm")
local act = wezterm.action

return {
  color_scheme = "Catppuccin Mocha",
  font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" }),
  font_size = 12, -- 18 for recording
  cursor_blink_rate = 750,
  audible_bell = "Disabled",

  enable_tab_bar = false,
  use_fancy_tab_bar = false,

  window_decorations = "RESIZE",
  window_close_confirmation = "NeverPrompt",

  -- macos_window_background_blur = 30,
  -- window_background_opacity = 0.95,

  keys = {
    {
      key = "m",
      mods = "CMD",
      action = act.DisableDefaultAssignment,
    },
    {
      key = "Enter",
      mods = "CMD",
      action = act.DisableDefaultAssignment,
    },
    {
      key = "r",
      mods = "CMD|SHIFT",
      action = act.ReloadConfiguration,
    },
  },
}
