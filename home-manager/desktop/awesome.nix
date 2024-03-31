{ pkgs, ... }: {
  xsession.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [ fennel ];
  };
  services.picom.enable = true;

  home.file.".xprofile".text = ''
    export QT_SCALE_FACTOR=2
  '';
}
