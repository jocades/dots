{ pkgs, lib, ... }: {

    imports = [ 
      ./git.nix
      ./prompt.nix
      ./shell.nix
      ./yazi.nix
    ];

    home = {
      username = "j0rdi";
      homeDirectory = "/Users/j0rdi";
      stateVersion = "24.05";

      # Search with: $ nix-env -qaP | grep wget
      packages = with pkgs; [
        # common
        bat
        cargo-binstall
        direnv
        docker-compose
        fastfetch
        fd
        fzf
        hyperfine
        jq
        lsd
        nixfmt-rfc-style
        ripgrep
        stockfish
        tmux
        tokei
        tree
        watchexec
        wget

        # lang
        elixir
        go
        # python312Packages.bpython
      ];

      file = {
        ".config/tmux".source = ./tmux;
        ".config/wezterm".source = ./wezterm;
        ".editorconfig".source = ./.editorconfig;
      };
    };

    programs = {
      atuin = {
        enable = true;
        enableZshIntegration = true;
        flags = [ "--disable-up-arrow" ];
        settings = {
          style = "compact";
          keymap_mode = "auto";
        };
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
}
