{ pkgs, ... }: {

  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = true;
    config = {
      layout = "bsp";
      window_placement = "second_child";
      mouse_follows_focus = "on";
      focus_follows_mouse = "autofocus";
      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouser_action2 = "resize";
      mouse_drop_action = "swap";
    };
    extraConfig = ''
      yabai -m rule --add app="^System Settings$" manage=off
      yabai -m rule --add app="^Finder$" manage=off
      yabai -m rule --add app="^Calculator$" manage=off
      yabai -m rule --add app="^QuickTime Player$" manage=off
      yabai -m rule --add app="^Activity Monitor$" manage=off
      yabai -m rule --add app="^Slack$" manage=off
      yabai -m rule --add app="^Discord$" manage=off
      yabai -m rule --add app="^Spotify$" manage=off
      yabai -m rule --add app="^Raycast$" manage=off
      yabai -m rule --add app="^MongoDB Compass$" manage=off
      yabai -m rule --add app="^About This Mac$" manage=off
      yabai -m rule --add app="^Postman$" manage=off
      yabai -m rule --add app="Docker Desktop$" manage=off
      yabai -m rule --add app="Preview$" manage=off
      yabai -m rule --add app="^App Store$" manage=off
      yabai -m rule --add app="^Messages$" manage=off
      yabai -m rule --add app="^escacs$" manage=on
      yabai -m rule --add label="Dictionary" app="^Dictionary$" manage=off
      yabai -m rule --add label="Software Update" title="Software Update" manage=off
      yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
    '';
    };
}
