{ lib, ... }: {
  programs.starship = {
    enable = false;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$cmd_duration"
        "$line_break"
        "$shlvl"
        "$character"
      ];
      directory = {
        home_symbol = "~";
        style = "blue";
        fish_style_pwd_dir_length = 1;
        truncation_length = 3;
      };
      character = {
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };
      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };
      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "";
        untracked = "";
        modified = "";
        staged = "";
        renamed = "";
        deleted = "";
        ahead = "⇡";
        behind = "⇣";
        stashed = "≡";
      };
      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)\) ";
        style = "bright-black";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };
      shlvl = {
        disabled = false;
        threshold = 2;
        format = "[$shlvl$symbol](bold blue) ";
        symbol = "☃️";
        repeat = false;
      };
    };
  };
}
