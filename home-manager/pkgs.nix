{ pkgs, ... }: {
  home.packages = with pkgs; [
    # utilities #
    fd
    libnotify
    eza
    grc
    (ripgrep.override { withPCRE2 = true; })
    imagemagick
    jq
    chafa # teminal graphics
    acpi # battery stuff
    # brightnessctl # currently using light 
    ffmpeg
    cbonsai # fun bonsai
    krabby # fun pokemon
    nix-alien # run binaries
    nix-init # generate nix packages from URLs

    sqlite # org-roam
    graphviz # org-roam
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ])) # spellcheck
    cmake # vterm
    gnumake # vterm
    gcc # vterm

    # lsp
    nil
    nixpkgs-fmt
    nixfmt
    shellcheck
    shfmt
    marksman

    # fonts #
    jetbrains-mono
    etBook
    # icons
    symbola
    font-awesome
    feather-icon-font # custom
    # nerdfonts
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    meslo-lgs-nf

    # internet #
    mullvad-vpn
    transmission-gtk
    yt-dlp

    # tui/cli #
    glow # markdown
    fff # file manager
    ikill # interactive pkill
    nb # notes
    catgirl # RSS
    mangal # download manga
    gnugo # gnu Go AI

    # music #
    mpc-cli
    mpd-notification
    playerctl
    cli-visualizer
    cava
    python311Packages.requests # fetchart plugin
    python311Packages.pylast # lastgenre plugin

    # wayland #
    wl-clipboard
    wl-clip-persist
    cliphist
    swww
    eww-wayland
    hyprpicker

    # documents #
    libreoffice-fresh
    texlive.combined.scheme-full
    zotero # bibliography
    multimarkdown
    ditaa # diagrams

    # apps
    anki
    calibre
  ];
}
