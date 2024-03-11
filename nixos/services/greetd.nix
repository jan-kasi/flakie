{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.greetd.gtkgreet ];

  services.greetd = {
    enable = true;
    settings = {
    };
  };

  services.cage = {
    enable = true;
    restart = true; # disable if using autologin settings.initial_session
    settings = {
      default_session = {
        # -s argument enables VT switching in cage, recommended to avoid locking youself out
        command = "dubs-run-session ${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.gtkgreet}/bin/gtkgreet";
        # agreety is here: ${pkgs.greetd.greetd}/bin/agreety
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
