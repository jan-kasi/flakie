{ pkgs, ... }: {
  imports = [
    # desktop environment
    ./dunst.nix
    ./rofi
    # ./waybar.nix
    # ./wlsunset.nix
    # ./swaylock.nix

    # apps
    # ./kitty.nix
    # ./foot.nix
    ./qutebrowser.nix
    ./nautilus.nix
    ./zathura.nix
  ];

  programs.imv.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = { family = "CozetteVector"; style = "Regular"; };
      };
      # shell = {
      #  program = "zellij";
      #  args = [ "-l" "welcome" ];
      # };
    };
  };
  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.sponsorblock ];
  };

  programs.password-store = {
    enable = false;
    package = pkgs.pass.withExtensions
      (exts: [ exts.pass-update exts.pass-import exts.pass-genphrase ]);
  };

  programs.sioyek = {
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

  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      nativeMessagingHosts = [ pkgs.tridactyl-native ];
    };
  };

  programs.pidgin = {
    # pidgin v2.x.y bad on wayland (gtk2) uses xwayland
    enable = false;
    plugins = with pkgs; [ pidgin-otr pidgin-latex purple-matrix purple-discord purple-xmpp-http-upload ];
  };

}
