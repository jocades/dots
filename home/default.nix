{ config, pkgs, ... }: {

    imports = [ 
      ./zsh.nix
      ./git.nix
      ./yazi.nix
    ];

    home = {
      username = "j0rdi";
      homeDirectory = "/Users/j0rdi";
      stateVersion = "24.05";

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      packages = with pkgs; [
        cargo-binstall
        direnv
        docker-compose
        elixir
        fastfetch
        fd
        fzf
        go
        hyperfine
        jq
        lsd
        # python312Packages.bpython
        ripgrep
        stockfish
        tmux
        tokei
        tree
        watchexec
        wget
      ];

      file = {
        ".tmux.conf".source = ~/dotfiles/home/tmux/.tmux.conf;
        ".config/wezterm".source = ~/dotfiles/home/wezterm;
      };
    };

    programs = {
      # starship = {
      #   enable = true;
      #   enableZshIntegration = true;
      # };

      atuin = {
        enable = true;
        enableZshIntegration = true;
        flags = [ "--disable-up-arrow" ];
        settings = {
          style = "compact";
          keymap_mode = "auto";
        };
      };

      bat = {
        enable = true;
        # config.theme = "TwoDark";
      };

      fzf = {
        enable = true;
        enableZshIntegration = true;
      };

      zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
    };

    xdg.enable = true;
    programs.home-manager.enable = true;
}
