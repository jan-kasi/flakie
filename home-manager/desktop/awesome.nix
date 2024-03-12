{ pkgs, ... }: {
  xsession.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [ fennel ];
  };
  services.picom.enable = true;
}
