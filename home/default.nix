{ config, pkgs, ... }: {

    imports = [ ./zsh.nix ];

    home = {
      username = "j0rdi";
      homeDirectory = "/Users/j0rdi";
      stateVersion = "24.05";

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      packages = with pkgs; [
        cowsay
        direnv
        fastfetch
        tokei
      # fd
      # ripgrep
      ];

      file = {
        # ".zshrc".source = ~/dotfiles/home/shell/.zshrc;
        ".tmux.conf".source = ~/dotfiles/home/tmux/.tmux.conf;
        ".config/wezterm".source = ~/dotfiles/home/wezterm;
      };

    };

    programs.home-manager.enable = true;
}
