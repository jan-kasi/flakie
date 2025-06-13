{
  imports = [
    ./emacs.nix
    ./mpd.nix
    ./beets.nix
    ./gpg.nix
    ./autorandr.nix
  ];

  programs.git = {
    userName = "jan-kasi";
    userEmail = "77466026+jan-kasi@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "hx";
      };
    };
  };

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

  programs.bat = {
    enable = true;
    config = { theme = "ansi"; };
  };
}
