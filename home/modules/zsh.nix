{ ... }: # ~/.zshrc
{
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
      "--" = "cd -";

      g = "git";
      ga = "git add";
      gcm = "git commit -m";
      gcz = "git cz";
      gd = "git diff";
      gs = "git status -sb";
      lg = "lazygit";

      cargow = "cargo watch -qcx";
    };

    sessionVariables = {
      EDITOR = "nvim";
      MAN_PAGER = "nvim +Man!";
      HOMEBREW_AUTO_UPDATE_SECS = 604800; # once a week
    };

    initExtra = # sh
      ''
        [ -n "$TMUX" ] && export TERM=wezterm

        export PATH=~/.local/bin:$PATH # local scripts, bins..
        export PATH=~/.local/share/nvim/mason/bin:$PATH # language servers, formatters, etc
        export PATH=~/.cargo/bin:$PATH # rust binaries `cargo install <pkg>`
        export PATH=~/go/bin:$PATH # go binaries `go install <pkg>`

        bindkey -e
        zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}"

        source ~/dotfiles/home/shell/profile.sh
        source ~/dotfiles/home/shell/plugins/sudo.sh

        eval "$(fnm env --use-on-cd --shell zsh)" # node version manager

        export BUN_INSTALL="$HOME/.bun"
        export PATH="$BUN_INSTALL/bin:$PATH"
        [ -s "/Users/j0rdi/.bun/_bun" ] && source "/Users/j0rdi/.bun/_bun" # bun completions
      '';
  };
}
