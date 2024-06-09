{ pkgs, ... }: {
  services.gnome = {
    gnome-browser-connector.enable = true;
    sushi.enable = true;
  };

  # EXCLUDE
  environment.gnome.excludePackages = (with pkgs; [
    # for packages that are <pkgs.***>
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    # for packages that are <pkgs.gnome.***>
    eog
    epiphany
    gnome-music
    totem
    gnome-software
  ]);
}
