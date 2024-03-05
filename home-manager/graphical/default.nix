{ pkgs, ... }: {
  imports = [
    # desktop environment
    ./dunst.nix
    ./rofi
    ./waybar.nix
    ./wlsunset.nix
    ./swaylock.nix

    # apps
    ./kitty.nix
    # ./foot.nix
    ./firefox.nix
    ./nautilus.nix
    ./zathura.nix
  ];

  programs = {
    imv.enable = true;
    mpv.enable = true;

    sioyek = {
      enable = false;
      bindings = {
        "move_up" = "k";
        "move_down" = "j";
        "move_left" = "h";
        "move_right" = "l";
        "screen_down" = [ "d" "" ];
        "screen_up" = [ "u" "" ];
      };
    };

    # pidgin = {
    #  enable = true;
    #  plugins = with pkgs; [ pidgin-otr pidgin-latex purple-matrix purple-discord purple-xmpp-http-upload ];
    # };

  };
}
