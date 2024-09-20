{ _config, pkgs, ... }: {

    imports = [ 
      ./git.nix
      ./zsh.nix
      ./yazi.nix
    ];

    home = {
      username = "j0rdi";
      homeDirectory = "/Users/j0rdi";
      stateVersion = "24.05";

      # Search with: $ nix-env -qaP | grep wget
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
        ".tmux.conf".source = ./tmux/.tmux.conf;
        ".config/wezterm".source = ./wezterm;
        ".editorconfig".source = ./.editorconfig;
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

    programs.home-manager.enable = true;
}
