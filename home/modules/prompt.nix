{ lib, ... }: # ~/.config/starship.toml

let
  readTOML = path: builtins.fromTOML (builtins.readFile path);
  nerdIcons = readTOML ../shell/prompts/nerd.toml;
in

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = nerdIcons // {
      add_newline = true;
      palette = "catppuccin_mocha";
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$jobs"
        "$cmd_duration"
        "$fill"
        "$all"
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
      jobs = {
        symbol = " ";
        style = "red";
        number_threshold = 1;
        format = "[$symbol]($style)";
      };
    };
  };
}
