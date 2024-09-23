{ config, pkgs, ... }:
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

    packages = import ./packages.nix { inherit pkgs; };

    file = {
      ".tmux.conf".source = ./tmux/tmux.conf;
      ".editorconfig".source = ./.editorconfig;
      # ".config/wezterm".source = config.lib.file.mkOutOfStoreSymlink ./wezterm;
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
