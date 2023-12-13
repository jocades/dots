local wezterm = require('wezterm')

return {
  color_scheme = 'Catppuccin Mocha',
  font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold' }),
  font_size = 12.0, -- 18 for recording
  enable_tab_bar = false,
  cursor_blink_rate = 750,
  macos_window_background_blur = 30,
  window_background_opacity = 0.95,
  window_decorations = 'RESIZE',
  audible_bell = 'Disabled',
}
