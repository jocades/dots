{ lib, ... }:
let
  shellAliases = {
    l = "lsd --group-dirs first";
    ls = "lsd --group-dirs first";
    ll = "lsd -l --group-dirs first";
    la = "lsd -a --group-dirs first";
    lla = "lsd -la --group-dirs first";
    cat = "bat";
    cl = "clear";
    grep = "rg";
    find = "fd";
    v = "nvim";
    vim = "nvim";
    py = "python3";
    bpy = "bpython";
    code = "code-insiders";
    ".." = "cd ..";

    g = "git";
    lg = "lazygit";
  };

  sessionVariables = {
    EDITOR = "nvim";
    MAN_PAGER = "nvim +Man!";
    PATH = "~/go/bin:$PATH";
  };
in
{
  # ~/.zshrc
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
    };

    inherit shellAliases;
    inherit sessionVariables;

    initExtra = ''
      source ~/dotfiles/home/shell/zshrc
      source ~/dotfiles/home/shell/profile.sh
    '';
  };
}
