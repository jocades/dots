{ pkgs, ... }:
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
      bat # better cat
      cargo-binstall # install binaries from crates.io
      direnv # environment variable manager
      docker-compose
      fastfetch # better neofetch
      fd # better find
      fzf # fuzzy finder
      hyperfine # benchmarking tool
      jq # json processor
      lsd # better ls
      nixfmt-rfc-style # nix formatter
      ripgrep # better grep
      stockfish # chess engine
      tmux # terminal multiplexer
      tokei # code statistics
      tree # directory tree
      watchexec # watch files (cargo watch)
      wget # download files

      # lang
      elixir
      fnm # node version manager
      go
      rustup # rust toolchain
    ];

    file = {
      # ".config/tmux".source = ./tmux;
      ".tmux.conf".source = ./tmux/tmux.conf;
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
