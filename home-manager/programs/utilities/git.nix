{
  programs.git = { 
    enable = true;
    userName = "jan-kasi";
    userEmail = "77466026+jan-kasi@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "hx";
      };
    };
  };
}
