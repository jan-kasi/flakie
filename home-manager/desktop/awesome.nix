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
    export QT_SCALE_FACTOR=2
    export GDK_SCALE=2
    export _JAVA_OPTIONS="-Dsun.java2d.uiScale=2"
    dbus-update-activation-environment DISPLAY
  '';
}
