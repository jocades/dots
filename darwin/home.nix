{ config, pkgs, ... }:

{
  home = {
    username = "j0rdi";
    homeDirectory = "/Users/j0rdi";
  };

  home.file = {
    ".zshrc".source = ~/dotfiles/shell/.zshrc;
    ".tmux.conf".source = ~/dotfiles/tmux/.tmux.conf;
    ".config/wezterm".source = ~/dotfiles/wezterm;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
