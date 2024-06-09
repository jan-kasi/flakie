{ pkgs, ... }: {
  xsession.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [
      fennel
      luaposix
    ];
  };

  services.picom.enable = false;

  home.file.".xprofile".text = ''
    #!/usr/bin/env dash
    dbus-update-activation-environment --systemd --all
  '';
}
