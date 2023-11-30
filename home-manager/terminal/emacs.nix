{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: [ epkgs.vterm ];
  };
  services.emacs = {
    enable = true;
    socketActivation.enable = true;
  };
}
