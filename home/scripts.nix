{ writeShellScriptBin, writers }:

let
  switch = writeShellScriptBin ":switch" (builtins.readFile ./bin/switch.sh);

  ide = writeShellScriptBin "ide" ''
    tmux split-window -v -l 20%
    tmux split-window -h -l 50%
    tmux select-pane -l
  '';

  popup =
    {
      name,
      title,
      exec,
    }:
    writeShellScriptBin name ''
      tmux popup \
          -E \
          -d "#{pane_current_path}" \
          -w "80%" \
          -h "80%" \
          -b rounded \
          -S fg="blue" \
          -T ${title} \
          ${exec}
    '';

  popgit = popup {
    name = "popgit";
    title = "LazyGit";
    exec = "lazygit";
  };

  monitor = popup {
    name = "monitor";
    title = "Bottom";
    exec = "btm";
  };

  zlib = writers.writePython3Bin "zlib" { } (builtins.readFile ./bin/zlib_util.py);
in

[
  ide
  monitor
  popgit
  switch
  zlib
]
