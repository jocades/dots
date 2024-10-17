{
  self,
  config,
  lib,
  ...
}:

let
  dots = "/Users/j0rdi/dotfiles";
  mkMutSymLink =
    path: config.lib.file.mkOutOfStoreSymlink (dots + lib.removePrefix (toString self) (toString path));
in

{
  home.file = {
    ".tmux.conf".source = mkMutSymLink ../tmux/tmux.conf;
    ".config/aerospace".source = mkMutSymLink ../aerospace;
    ".config/wezterm".source = mkMutSymLink ../wezterm;
    ".editorconfig".source = ../.editorconfig;
  };
}
