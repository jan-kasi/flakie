{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [

    #############  
    # utilities #
    #############
    # pretty important stuff #
    fd
    libnotify
    grc
    (ripgrep.override { withPCRE2 = true; })
    imagemagick
    jq
    ffmpeg
    acpi

    # useful stuff #
    qrcp
    fff
    _7zz
    ikill
    eza
    mkvtoolnix
    pfetch
    gnugo
    qrtool # qrtool encode -t terminal "<text data here>"
    # glow # preview markdown in terminal
    # catgirl # RSS


    #############
    # languages #
    #############

    (lua.withPackages (ps: with ps; [ fennel luaposix ]))
    sbcl
    jdk17

    # ghc #haskell
    # cabal-install
    # racket
    # guile

    #######################
    # desktop environment #
    #######################

    waypaper # gui frontend for swww/feh
    feh
    stable.blueman # gui bluetooth
    lxqt.lxqt-policykit # start with lxqt-policykit-agent
    adwaita-icon-theme
    gnome-screenshot

    # xserver window managers #
    xcalib
    xbindkeys
    stable.maim
    xclip

    # wayland compositors #
    # wl-clipboard
    # wl-clip-persist
    # cliphist
    # swww
    # hyprpicker
    # hyprshade
    # hyprcursor
    # grimblast
    # gtklock

    ########
    # apps #
    ######## 

    # vpn #
    mullvad-vpn
    protonvpn-gui

    # communication #
    hexchat # irc gui
    irssi # irc terminal
    stable.discord

    # downloading # 
    transmission_4-gtk
    nicotine-plus # SoulSeek client
    yt-dlp
    stable.uget # download manager

    # music #
    amberol
    audacity
    playerctl
    flac 
    stable.eartag
    songrec
    spek

    # spotify-player
    # stable.cantata 
    # mpc-cli
    # pms
    # mpd-notification
    
    # media # 
    komikku
    mangal
    vlc
    foliate
    stable.calibre

    # documents/office/study # 
    libreoffice-fresh
    texliveFull
    zotero
    anki
    minder
    multimarkdown

    # graphics #
    darktable
    # rawtherapee
    # libresprite


    # flatpaks:
    # flatseal, warehouse, gamescope, protontricks, steamtinkerlaunch,
    # bottles, steam, cartridges, armcord 
    # unofficial homestuck collection,
    # decoder, halftone, calligraphy, newsflash

    # others #
    stable.keepassxc
    stable.google-chrome
    libsForQt5.kleopatra

    gnome-boxes # gui stuff for virtualisation (qemu)
    baobab # storage usage

    prismlauncher # minecraft launcher
    mindustry
  ];
}
