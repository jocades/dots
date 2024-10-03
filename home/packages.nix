{ pkgs }:

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
  qemu # machine emulator and virtualizer
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
  fnm # node version manager
  go
  uv # python packaging
  rustup # rust toolchain

  # Misc
  ide
  popgit
  gshow
]
++ pkgs.callPackage import ./scripts.nix { }
