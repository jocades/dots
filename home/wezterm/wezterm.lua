local wezterm = require("wezterm")
local act = wezterm.action

local function font(name)
  if name == "Monaspace" then
    return wezterm.font({
      -- family = "Monaspace Neon NF",
      -- weight = "Bold",
      family = "Monaspace Neon NF SemiBold",
      harfbuzz_features = {
        "calt",
        "ss01",
        "ss02",
        "ss03",
        "ss04",
        "ss05",
        "ss06",
        "ss07",
        "ss08",
        "ss09",
        "ss10",
        "liga",
      },
    })
  end
  return wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
end

return {
  color_scheme = "Catppuccin Mocha",
  font = font("Monaspace"),
  font_size = 12, -- 18 for recording
  cursor_blink_rate = 750,
  audible_bell = "Disabled",

  enable_tab_bar = false,
  use_fancy_tab_bar = false,

  window_decorations = "RESIZE",
  window_close_confirmation = "NeverPrompt",
  max_fps = 144,

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
