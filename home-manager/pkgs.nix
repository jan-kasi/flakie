{ pkgs, inputs, ... }: {
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

    # cbonsai # fun bonsai
    # krabby # fun pokemon
    pfetch

    # languages #
    (lua.withPackages (ps: with ps; [ fennel luaposix ]))
    # ghc #haskell
    # cabal-install
    # racket
    # guile
    sbcl
    jdk17

    # internet #
    mullvad-vpn
    hexchat # irc gui
    irssi # irc terminal
    # (nyxt.override (x: { sbclPackages = sbcl_2_4_6.pkgs; })) # https://github.com/NixOS/nixpkgs/issues/332862

    # downloading
    transmission_4-gtk
    stable.nicotine-plus # SoulSeek client
    yt-dlp
    lux # fast and simple video download library and CLI tool written in go
    qrcp # send files over internet
    mangal # download manga

    # tui/cli #
    # glow # markdown
    fff # file manager
    ikill # interactive pkill
    # nb # notes
    # catgirl # RSS
    # gnugo # gnu Go AI
    # qrtool # qrtool encode -t terminal "<text data here>"

    # music #
    # spotify-player
    amberol
    stable.cantata # gui for mpd
    mpc-cli
    pms # practical music search for mpd
    mpd-notification
    playerctl
    songrec # recognise songs
    eartag
    spek # analyse audio spectogram
    flac # Free Lossless Audio Codec tools

    # de #
    waypaper # gui frontend for swww/feh
    feh
    lxqt.lxqt-policykit # start with lxqt-policykit-agent
    adwaita-icon-theme
    gnome-screenshot

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
    calibre
    # anytype

    # apps

    # flatpaks:
    # flatseal, warehouse, gamescope, protontricks, steamtinkerlaunch,
    # bottles, steam, cartridges, armcord 
    # unofficial homestuck collection,
    # decoder, halftone, calligraphy, newsflash

    komikku
    animdl

    blueberry # bluetooth
    uget # download manager

    anki # flashcards
    zotero # citation manager
    foliate # read ebooks

    gnome-boxes # gui stuff for virtualisation (qemu)
    baobab # storage usage

    prismlauncher # minecraft launcher
    mindustry

    rawtherapee # photo processing software
    gimp 
    # libresprite

    keepassxc
    libsForQt5.kleopatra
  ];
}
