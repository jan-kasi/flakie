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
    ffmpeg
    chafa # teminal graphics
    mkvtoolnix # edit mkv video files
    appimage-run #run appimages

    acpi # battery stuff

    cbonsai # fun bonsai
    krabby # fun pokemon
    pfetch

    # nix-alien # run binaries
    # nix-init # generate nix packages from URLs

    # programming #
    (lua.withPackages (ps: with ps; [ fennel luaposix ]))
    ghc #haskell
    racket
    guile
    sbcl
    jdk17

    # lsp #
    nil
    nixpkgs-fmt
    nixfmt
    shellcheck
    shfmt
    marksman
    haskell-language-server
    lua-language-server
    semgrep
    fennel-ls
    fnlfmt

    # internet #
    mullvad-vpn
    transmission-gtk
    yt-dlp
    gnome-decoder # qr codes
    qrcp # send files over internet

    # tui/cli #
    glow # markdown
    fff # file manager
    ikill # interactive pkill
    # nb # notes
    # catgirl # RSS
    mangal # download manga
    # gnugo # gnu Go AI
    # qrtool # qrtool encode -t terminal "<text data here>"

    # music #
    # spotify-player
    mpc-cli
    mpd-notification
    playerctl
    cava
    python311Packages.requests # fetchart plugin
    python311Packages.pylast # lastgenre plugin
    songrec # recognise songs
    cider

    # de #
    waypaper # gui frontend for swww/feh
    feh
    lxqt.policykit-agent # start with lxqt-policykit-agent
    gnome.adwaita-icon-theme
    adwaita-qt
    gnome.gnome-screenshot
    wl-clipboard

    # xserver wms#
    xcalib
    xbindkeys
    maim
    xclip

    # wayland #
    # wl-clipboard
    # wl-clip-persist
    # cliphist
    # swww
    # hyprpicker
    # hyprshade
    # hyprcursor
    # grimblast
    # gtklock # lock screen

    # documents #
    libreoffice-fresh
    texliveFull
    multimarkdown
    minder # mindmaps

    # apps
    # flatpaks: steam, flatseal, bottles, unofficial homestuck collection, cartridges
    blueberry # bluetooth
    anki # flashcards
    zotero # citation manager
    foliate # read ebooks
    gnome.gnome-boxes # gui stuff for virtualisation (qemu)
    gnome.baobab # storage usage
    loupe # simple gnome image viewer
    uget # download manager
    prismlauncher # minecraft launcher
    rawtherapee # photo processing software
    pureref2
    keepassxc # passwords
  ];
}
