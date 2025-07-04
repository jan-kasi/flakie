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
    ./qutebrowser.nix
    ./nautilus.nix
  ];

  programs.imv.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 16;
        normal = { family = "CozetteVector"; style = "Regular"; };
      };
      # shell = {
      #  program = "zellij";
      #  args = [ "-l" "welcome" ];
      # };
    };
  };

  programs.sioyek = {
    enable = true;
  };

  programs.mpv = {
    enable = true;
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

  programs.password-store = {
    enable = false;
    package = pkgs.pass.withExtensions
      (exts: [ exts.pass-update exts.pass-import exts.pass-genphrase ]);
  };


}
