{ pkgs, ... }: {
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };
  home.packages = [ pkgs.pinentry-gnome3 ];
}
