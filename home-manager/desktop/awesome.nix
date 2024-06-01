{ pkgs, ... }: {
  xsession.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [
      fennel
      luaposix
    ];
  };

  services.picom.enable = true;

  home.file.".xprofile".text = ''
    #!/usr/bin/env dash
    dbus-update-activation-environment --systemd --all
  '';
}
