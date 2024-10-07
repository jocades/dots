{ writeShellScriptBin, pkgs }:

let
  ide = writeShellScriptBin "ide" ''
    tmux split-window -v -l 20%
    tmux split-window -h -l 50%
    tmux select-pane -l
  '';

  popgit = writeShellScriptBin "popgit" ''
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

  zlib = pkgs.writers.writePython3Bin "zlib" { } (builtins.readFile ./bin/zlib_util.py);
in

[
  ide
  popgit
  zlib
]
