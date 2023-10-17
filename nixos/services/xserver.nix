{
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;


    # displayManager.sddm.enable = true;
    # For some reason theme is ROKEN, doesn't let me log in
    # (setting user as "", maybe that's the problem?)
    # displayManager.sddm.theme = "where_is_my_sddm_theme"; 
  };
}
