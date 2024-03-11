{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.greetd.gtkgreet pkgs.cage ];

  services.greetd = {
    enable = true;
    restart = true; # disable if using autologin settings.initial_session
    settings = {
      default_session = {
        # -s argument enables VT switching in cage, recommended to avoid locking youself out
        command = "${pkgs.dbus}/bin/dbus-run-session ${pkgs.coreutils}/bin/env GTK_THEME=Adwaita-dark ${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.gtkgreet}/bin/gtkgreet";
        # command = "${pkgs.greetd.greetd}/bin/agreety --cmd fish";
        # command = "${pkgs.coreutils}/bin/env GTK_THEME=Adwaita-dark ${pkgs.dbus}/bin/dbus-run-session ${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.regreet}/bin/regreet";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    awesome
    Hyprland
    fish
    bash
  '';
}
