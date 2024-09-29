{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraPackages = epkgs: [ epkgs.vterm ];
  };
  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
  };
  home.packages = with pkgs; [
    # EMACS #
    # org
    sqlite # org-roam
    graphviz # org-roam
    gnuplot #
    ditaa # diagrams
    zip # export odt
    unzip # export odt

    unoconv # doc-view
    ghostscript # doc-view

    # spell
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ])) # spellcheck
    languagetool # grammar check

    # vterm
    cmake
    gnumake
    gcc

    # languages
    nil
    nixpkgs-fmt
    nixfmt
    python311Packages.grip # preview markdown
    marksman
    haskell-language-server
    lua-language-server
    fennel-ls
    shellcheck
    shfmt
    semgrep
    fnlfmt
    libxml2
    stylelint
    html-tidy

    # everywhere
    xorg.xwininfo
    xdotool
  ];
}
