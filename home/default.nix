{ config, pkgs, ... }: {

    imports = [ ./zsh.nix ./yazi.nix ];

    home = {
      username = "j0rdi";
      homeDirectory = "/Users/j0rdi";
      stateVersion = "24.05";

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      packages = with pkgs; [
        bat
        cargo-binstall
        direnv
        docker-compose
        elixir
        fastfetch
        fd
        fzf
        gh
        go
        hyperfine
        jq
        lazygit
        lsd
        python312Packages.bpython
        ripgrep
        stockfish
        tmux
        tokei
        tree
        watchexec
        wget
        zoxide
      ];

      file = {
        ".tmux.conf".source = ~/dotfiles/home/tmux/.tmux.conf;
        ".config/wezterm".source = ~/dotfiles/home/wezterm;
      };
    };

    programs.home-manager.enable = true;
}
