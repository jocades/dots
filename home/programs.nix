_: {
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
}
