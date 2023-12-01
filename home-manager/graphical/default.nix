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

    # pidgin = {
    #  enable = true;
    #  plugins = with pkgs; [ pidgin-otr pidgin-latex purple-matrix purple-discord purple-xmpp-http-upload ];
    # };

  };
}
