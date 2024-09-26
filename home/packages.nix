{ pkgs }:

let
  ide = pkgs.writeShellScriptBin "ide" ''
    tmux split-window -v -l 20%
    tmux split-window -h -l 50%
    tmux select-pane -l
  '';

  popgit = pkgs.writeShellScriptBin "popgit" ''
    tmux popup \
        -E \
        -d "#{pane_current_path}" \
        -w "80%" \
        -h "80%" \
        -b rounded \
        -S fg="blue" \
        -T "LazyGit" \
        lazygit
  '';
in

with pkgs;
[
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

  # Misc
  ide
  popgit
]
