{ lib, ... }: {

  # ~/.config/starship.toml
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$line_break"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$jobs"
        "$cmd_duration"
        "$fill"
        "$lua"
        "$python"
        "$nodejs"
        "$golang"
        "$rust"
        "$package"
        "$docker_context"
        "$line_break"
        "$character"
      ];
      fill.symbol = " ";
      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };
      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](bright-black)( $ahead_behind$stashed)]($style) ";
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };
      git_state = {
        format = "([$state( $progress_current/$progress_total)]($style) )";
        style = "bright-black";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };
    };
  };
}
