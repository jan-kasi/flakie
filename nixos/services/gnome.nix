{ pkgs, ... }: {
  services.gnome = {
    gnome-browser-connector.enable = true;
  };
  # environment.gnome.excludePackages = with pkgs; [
  #   gnome.cheese
  #   gnome.eog
  #   gnome.epiphany
  #   gnome.evince
  #   gnome.geary
  #   gnome.gnome-characters
  #   gnome.gnome-contacts
  #   gnome.gnome-maps
  #   gnome.gnome-music
  #   gnome.gnome-weather
  #   gnome.yelp
  #   gnome.totem
  #   gnome.geary
  #   gnome-tour
  # ];
}
