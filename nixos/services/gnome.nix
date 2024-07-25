{ pkgs, ... }: {
  services.gnome = {
    gnome-browser-connector.enable = true;
    sushi.enable = true;
  };

  services.xserver.displayManager.gdm.autoSuspend = false;

  # EXCLUDE
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    eog
    epiphany
    totem
    gnome.gnome-software
  ];
}
