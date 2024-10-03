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

  gshow =
    pkgs.writers.writePython3Bin "gshow" { } # py
      ''
        import sys
        import zlib
        print(zlib.decompress(open(sys.argv[1], 'rb').read()))
      '';
in

[
  ide
  popgit
  gshow
]
