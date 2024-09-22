{ config, pkgs, ... }:
{
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
      fnm
      go
      rustup
    ];

    file = {
      ".tmux.conf".source = ./tmux/tmux.conf;
      ".wezterm.lua".source = ./wezterm/wezterm.lua;
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

    pyenv = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  programs.home-manager = {
    enable = true;
    path = [ "${config.home.homeDirectory}/.local/bin" ];
  };
}
