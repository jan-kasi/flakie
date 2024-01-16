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
  home.packages = with pkgs; [
    # EMACS #
    sqlite # org-roam
    graphviz # org-roam
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ])) # spellcheck
    languagetool # grammar check
    cmake # vterm
    gnumake # vterm
    gcc # vterm
  ];
}
