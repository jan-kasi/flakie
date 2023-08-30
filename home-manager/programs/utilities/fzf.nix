{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    defaultOptions = [
      "--ansi"
      "--preview-window 'right:60%'"
      "--preview 'bat --color=always --style=header,grid --line-randne :200 {};'"
    ];
  };
}
