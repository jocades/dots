{ pkgs, ... }:
{
  services.skhd = {
    enable = false;
    package = pkgs.skhd;
    skhdConfig = ''
      # workspaces
      alt - l : yabai -m space --focus next
      alt - h : yabai -m space --focus prev
      ctrl - right : yabai -m space --focus next
      ctrl - left : yabai -m space --focus prev

      # window focus
      alt - j : yabai -m window --focus west
      alt - k : yabai -m window --focus east

      # window move
      alt + shift - h : yabai -m window --swap west
      alt + shift - j : yabai -m window --swap south
      alt + shift - k : yabai -m window --swap north
      alt + shift - l : yabai -m window --swap east

      # move window to workspace
      alt + shift - p : yabai -m window --space prev
      alt + shift - n : yabai -m window --space next

      # move window to workspace and follow 
      alt + shift - 1 : yabai -m window --space 1; yabai -m space --focus 1
      alt + shift - 2 : yabai -m window --space 2; yabai -m space --focus 2
      alt + shift - 3 : yabai -m window --space 3; yabai -m space --focus 3
      alt + shift - 4 : yabai -m window --space 4; yabai -m space --focus 4
      alt + shift - 5 : yabai -m window --space 5; yabai -m space --focus 5
      alt + shift - 6 : yabai -m window --space 6; yabai -m space --focus 6
      alt + shift - 7 : yabai -m window --space 7; yabai -m space --focus 7
      alt + shift - 8 : yabai -m window --space 8; yabai -m space --focus 8
      alt + shift - 9 : yabai -m window --space 9; yabai -m space --focus 9

      # window resize
      alt + ctrl - h : yabai -m window --resize left:10:0
      alt + ctrl - j : yabai -m window --resize bottom:0:10
      alt + ctrl - k : yabai -m window --resize top:0:10
      alt + ctrl - l : yabai -m window --resize right:10:0

      # balance window sizes
      alt + ctrl - space : yabai -m space --balance

      # monitor focus
      alt - w : yabai -m display --focus next
      alt - e : yabai -m display --focus prev

      # monitor move and follow
      alt + shift - w : yabai -m window --display west; yabai -m display --focus west
      alt + shift - e : yabai -m window --display east; yabai -m display --focus east

      # toggle
      alt - m : yabai -m window --toggle zoom-fullscreen
      alt + shift - space : yabai -m window --toggle float --resize abs:1920:1080

      # apps
      alt - return : open -a Wezterm
      alt - n : open /Applications/Obsidian.app

      # quit/reload services
      alt + ctrl - q : pkill skhd;\
                       pkill yabai
    '';
  };
}
