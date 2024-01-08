{ pkgs, ... }: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      ignore-empty-password = true;
      disable-caps-lock-text = false;
      image = "$HOME/Pictures/Wallpapers/calvin_and_hobbes.png";
      font = "Calvin and Hobbes";

      text-ver-color = "00000000";
      text-wrong-color = "00000000";
      text-clear-color = "00000000";
      inside-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";
      inside-clear-color = "00000000";
      inside-caps-lock-color = "00000000";
      ring-color = "00000000";
      ring-ver-color = "00000000";
      ring-wrong-color = "ed8796";
      ring-clear-color = "00000000";
      line-color = "00000000";
      line-clear-color = "00000000";
      line-ver-color = "00000000";
      key-hl-color = "c5c9c6";
      bs-hl-color = "ed8796";
      caps-lock-bs-hl-color = "ed8796";
      caps-lock-key-hl-color = "fe640b";
      separator-color = "00000000";

      scaling = "fill";
      indicator = true;
      clock = true;
      timestr = "%I:%M %p";
      datestr = "%A, %d %B";
      indicator-x-position = "1400";
      indicator-y-position = "700";
      indicator-radius = "200";
      font-size = "200";
      text-color = "2e3440";

    };
  };
}
