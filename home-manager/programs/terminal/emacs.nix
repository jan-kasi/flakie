{ pkgs, ... }: {
  programs.emacs = {
    enable = false;
    package = pkgs.emacs29-pgtk;
  };
}
