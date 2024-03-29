{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font.name = "MesloLGS NF";
    font.size = 16.0;
    font.package = pkgs.meslo-lgs-nf;
    settings = {
      linux_display_server = "auto";
      shell_integration = "disabled";

      wayland_titlebar_color = "background";
      draw_minimal_borders = "no";
      hide_window_decorations = "no";
      window_padding_width = 4;

      allow_remote_control = "yes";
      dynamic_background_opacity = "yes";

      background_blur = 0;

      focus_follows_mouse = "yes";
      mouse_hide_wait = "-1";

      tab_bar_min_tabs = "2";
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      powerline_style = "slanted";

      include = "/home/jankasi/.config/kitty/current-theme.conf";
    };
    extraConfig = ''
    '';
  };
}
