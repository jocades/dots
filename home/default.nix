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
        bat
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
