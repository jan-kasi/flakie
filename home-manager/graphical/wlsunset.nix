{
  services.wlsunset = {
    enable = true;
    latitude = "56.3";
    longitude = "-2.7";
  };
  systemd.user.services.wlsunset.Install = { WantedBy = [ "graphical-session.target" ]; };
}
