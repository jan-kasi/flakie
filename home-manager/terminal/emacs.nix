{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraPackages = epkgs: [ epkgs.vterm ];
  };
  services.emacs = {
    enable = true;
    socketActivation.enable = true;
    defaultEditor = true;
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
    gnuplot # gnuplot org
    unoconv # doc-view
    ghostscript # doc-view
    zip # export odt
    unzip # export odt
    ditaa # diagrams
    python311Packages.grip # preview markdown
  ];
}
