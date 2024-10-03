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

  gshow =
    pkgs.writeShellScriptBin "gshow" # py
      ''
        #!/usr/bin/env python3
        import sys, zlib 
        print(zlib.decompress(open(sys.argv[1], 'rb').read()))
      '';
in

[
  ide
  popgit
  gshow
]
