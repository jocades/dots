{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./git.nix
    ./prompt.nix
    ./yazi.nix
    ./zsh.nix
  ];

  home = {
    username = "j0rdi";
    homeDirectory = "/Users/j0rdi";
    stateVersion = "24.05";

    # Search with: $ nix-env -qaP | grep wget
    packages = with pkgs; [
      # Common
      bat # better `cat`
      bottom # better `top`
      cargo-binstall
      docker-compose
      dogdns # better `dig`
      du-dust # better `du`
      duf # better `df`
      fastfetch
      fd # better `find`
      fzf
      hyperfine
      jq
      lsd
      nixfmt-rfc-style
      procs # better `ps`
      ripgrep # better `grep`
      stockfish
      tealdeer # better `tldr`
      tmux
      tokei # count code, quickly
      tree
      watchexec # cargo watch
      wget

      # Lang
      elixir
      fnm
      go
      rustup
    ];

    file = {
      ".tmux.conf".source = ./tmux/tmux.conf;
      ".editorconfig".source = ./.editorconfig;
      ".config/wezterm".source = config.lib.file.mkOutOfStoreSymlink ./wezterm;
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

    direnv = {
      enable = true;
      enableZshIntegration = true;
      # nix-direnv.enable = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    pyenv = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
