{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    font.name = "Meslo LGS NF";
    settings = {
      allow_remote_control = "yes";
      dynamic_background_opacity = "yes";
      background_blur = "10";
      focus_follows_mouse = "yes";
      draw_minimal_borders = "yes";
      hide_window_decorations = "yes";
      bell_border_color = "#ff5555";
      mouse_hide_wait = "3";
      inactive_text_alpha = "0.7";
      window_padding_width = "0";
      tab_bar_min_tabs = "2";
      tab_bar_edge = "bottom";
      tab_bar_style = "slant";
      include = "/home/jankasi/.config/kitty/current-theme.conf";
    };
    extraConfig = ''
    '';
  };
}