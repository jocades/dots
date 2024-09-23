local wezterm = require("wezterm")

return {
  color_scheme = "Catppuccin Mocha",
  font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" }),
  font_size = 12.5, -- 18 for recording
  cursor_blink_rate = 750,
  audible_bell = "Disabled",
  enable_tab_bar = false,
  window_decorations = "RESIZE",
  window_close_confirmation = "NeverPrompt",
  -- macos_window_background_blur = 30,
  -- window_background_opacity = 0.95,
  -- disable_default_key_bindings = true,
  -- default_prog = { "zsh", "-l", "-c", "tmux", "a" },
  keys = {
    {
      key = "m",
      mods = "CMD",
      action = wezterm.action.DisableDefaultAssignment,
    },
    {
      key = "Enter",
      mods = "CMD",
      action = wezterm.action.DisableDefaultAssignment,
    },
    {
      key = "r",
      mods = "CMD|SHIFT",
      action = wezterm.action.ReloadConfiguration,
    },
  },
}
