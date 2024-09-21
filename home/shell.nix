{ ... }: {

  # .zshenv
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

    shellAliases = {
      l = "lsd --color=auto";
      ls = "lsd --color=auto";
      ll = "lsd -l --color=auto";
      la = "lsd -a --color=auto";
      lla = "lsd -la --color=auto";
      cat="bat";
      cl = "clear";
      grep = "rg";
      v = "nvim";
      vim = "nvim";
      py = "python3";
      bpy = "bpython";
      code = "code-insiders";
      ".." = "cd ..";
      g = "git";
      gst = "git status -sb";
      lg = "lazygit";
    };

    sessionVariables = {
      MY_VAR_FROM_ZSH = 123;
    };

    initExtra = ''
      source ~/dotfiles/home/shell/zshrc
      source ~/dotfiles/home/shell/profile.sh

      # Ok, if Nix doesn't work, try this:
      # export PATH="/run/current-system/sw/bin:$PATH"
      # And enable this
      # if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      #   . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      # fi
      '';
  };
}
