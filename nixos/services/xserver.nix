{
  services.xserver ={
    layout = "gb";
    xkbVariant = "";
    enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
  };
}
