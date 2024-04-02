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
    dbus-update-activation-environment DISPLAY
  '';
}
