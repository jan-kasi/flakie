{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "MesloLGS NF:size=14";
        dpi-aware = "no";
      };
      colors = {
        # catppuccin-frappe
        alpha = "0.7";
        foreground = "c6d0f5"; # Text
        background = "303446"; # Base
        regular0 = "51576d"; # Surface 1
        regular1 = "e78284"; # red
        regular2 = "a6d189"; # green
        regular3 = "e5c890"; # yellow
        regular4 = "8caaee"; # blue
        regular5 = "f4b8e4"; # pink
        regular6 = "81c8be"; # teal
        regular7 = "b5bfe2"; # Subtext 1
        bright0 = "626880"; # Surface 2
        bright1 = "e78284"; # red
        bright2 = "a6d189"; # green
        bright3 = "e5c890"; # yellow
        bright4 = "8caaee"; # blue
        bright5 = "f4b8e4"; # pink
        bright6 = "81c8be"; # teal
        bright7 = "a5adce"; # Subtext 0
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
