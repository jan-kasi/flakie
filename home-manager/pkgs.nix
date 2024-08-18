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
    mkvtoolnix # edit mkv video files
    appimage-run #run appimages

    acpi # battery stuff

    cbonsai # fun bonsai
    krabby # fun pokemon
    pfetch

    # languages #
    (lua.withPackages (ps: with ps; [ fennel luaposix ]))
    ghc #haskell
    cabal-install
    racket
    guile
    sbcl
    jdk17

    # internet #
    mullvad-vpn
    transmission_4-gtk
    yt-dlp
    qrcp # send files over internet
    hexchat #irc
    irssi
    # nyxt # not easy useable atm

    # tui/cli #
    # glow # markdown
    fff # file manager
    ikill # interactive pkill
    # nb # notes
    # catgirl # RSS
    # mangal # download manga
    # gnugo # gnu Go AI
    # qrtool # qrtool encode -t terminal "<text data here>"

    # music #
    # spotify-player
    mpc-cli
    mpd-notification
    playerctl
    cava
    songrec # recognise songs
    cider

    # de #
    waypaper # gui frontend for swww/feh
    feh
    lxqt.lxqt-policykit # start with lxqt-policykit-agent
    adwaita-icon-theme
    gnome-screenshot
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
    komikku
    calibre

    # apps

    # flatpaks:
    # flatseal, warehouse, gamescope, protontricks, steamtinkerlaunch,
    # bottles, steam, cartridges, copyq, armcord 
    # unofficial homestuck collection,
    # decoder, halftone, calligraphy,

    blueberry # bluetooth
    uget # download manager

    anki # flashcards
    zotero # citation manager
    foliate # read ebooks

    gnome.gnome-boxes # gui stuff for virtualisation (qemu)
    baobab # storage usage

    prismlauncher # minecraft launcher
    mindustry

    rawtherapee # photo processing software
    pureref2

    keepassxc
    gnome-secrets
    libsForQt5.kleopatra
    dino

  ];
}
