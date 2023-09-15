{
  programs.fzf = {
    enable = true;
    enableFishIntegration = false;
    defaultOptions = [
      "--ansi"
      "--border"
      "--layout=reverse"
      "--cycle"
      "--height=90%"
      "--marker=\"*\""
      "--preview-window=wrap"
      "--color=fg:white,bg:black,hl:red,fg+:white,hl+:red,info:yellow,prompt:blue,pointer:magenta,marker:magenta,spinner:green,header:blue,border:white"
    ];
  };
}
