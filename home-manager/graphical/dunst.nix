{ pkgs, ... }: {
  services.dunst = {
    enable = true;
    iconTheme.package = pkgs.gnome.adwaita-icon-theme;
    iconTheme.name = "Adwaita";
    settings = {
      global = {
        format = ''<b>%s</b>\n%b'';
        max_icon_size = 64;
        origin = "top-right";
        offset = "22x22";
        frame_width = 2;
        separate_color = "frame";
        font = "MesloLGS NF 12";
        corner_radius = 7;
        background = "#11111B";
        foreground = "#CDD6F4";
      };
    };
  };
}
