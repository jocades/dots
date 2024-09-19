{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
        # pkgs.skhd
        pkgs.cowsay
      ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;
      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToEscape = true;


      security.pam.enableSudoTouchIdAuth = true;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      system.defaults = {
          # AppleShowAllExtensions = true;
        finder.AppleShowAllExtensions = true;
        loginwindow.LoginwindowText = "calap";
      };

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

      services.skhd = {
        enable = true;
        package = pkgs.skhd;
        skhdConfig = ''
          # window focus
          alt - j : yabai -m window --focus west
          alt - k : yabai -m window --focus east
          # alt - k : yabai -m window --focus south
          # alt - k : yabai -m window --focus north
          
          # window move
          alt + shift - h : yabai -m window --swap west
          alt + shift - j : yabai -m window --swap south
          alt + shift - k : yabai -m window --swap north
          alt + shift - l : yabai -m window --swap east
          
          # move window to workspace and follow 
          alt + shift - p : yabai -m window --space prev
          alt + shift - n : yabai -m window --space next
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
          alt + ctrl - h : yabai -m window --resize left:5:0
          alt + ctrl - j : yabai -m window --resize bottom:0:5
          alt + ctrl - k : yabai -m window --resize top:0:5
          alt + ctrl - l : yabai -m window --resize right:5:0
          
          # balance window sizes
          alt + ctrl - space : yabai -m space --balance
          
          # monitor focus
          alt - w : yabai -m display --focus next
          alt - e : yabai -m display --focus prev
          
          # monitor move and follow
          alt + shift - w : yabai -m window --display west; yabai -m display --focus west
          alt + shift - e : yabai -m window --display east; yabai -m display --focus east
          
          # toggle fullscreen
          alt - m : yabai -m window --toggle zoom-fullscreen
          # toggle floating
          alt + shift - space : yabai -m window --toggle float --grid 4:4:1:1:2:2
          
          # workspaces
          alt - l : yabai -m space --focus next
          alt - h : yabai -m space --focus prev
          ctrl - right : yabai -m space --focus next
          ctrl - left : yabai -m space --focus prev
        '';
      };

    };

  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Jordis-MacBook-Pro
    darwinConfigurations."Jordis-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Jordis-MacBook-Pro".pkgs;
  };
}
