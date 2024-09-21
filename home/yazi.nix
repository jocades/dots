{ pkgs, ... }:

# ~/.config/yazi/yazi.toml
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "b6597919540731691158831bf1ff36ed38c1964e";
    sha256 = "07dm70s48mas4d38zhnrfw9p3sgk83ki70xi1jb2d191ya7a2p3j";
  };
in
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "e";
    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };
    plugins = {
      chmod = "${yazi-plugins}/chmod.yazi";
      max-preview = "${yazi-plugins}/max-preview.yazi";
    };
    keymap = {
      manager.prepend_keymap = [
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
        {
          on = "T";
          run = "plugin --sync max-preview";
          desc = "Maximize or restore the preview pane";
        }
      ];
    };
  };
}
