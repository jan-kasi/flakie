{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [

    #############  
    # utilities #
    #############
    # pretty important stuff #
    fd
    libnotify
    libimobiledevice
    grc
    (ripgrep.override { withPCRE2 = true; })
    imagemagick
    jq
    ffmpeg
    acpi
   inputs.iloader.packages."${pkgs.stdenv.hostPlatform.system}".iloader

    # useful stuff #
    qrcp
    net-tools # `netstat -lnp` to see ports listened to
    fff
    _7zz
    eza
    mkvtoolnix
    pfetch
    gnugo
    qrtool # qrtool encode -t terminal "<text data here>"
    glow # preview markdown in terminal
    # catgirl # RSS


    #############
    # languages #
    #############

    (lua.withPackages (ps: with ps; [ fennel luaposix ]))
    sbcl
    jdk

    # ghc #haskell
    # cabal-install
    # racket
    # guile

    #######################
    # desktop environment #
    #######################

    waypaper # gui frontend for swww/feh
    feh
    blueman # gui bluetooth
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
    stable.mullvad-vpn

    # communication #
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
    libreoffice-stable
    texliveFull
    # zotero # until update no longer relies on firefox-esr it is broken 
    anki
    freeplane
    multimarkdown
    sioyek 
    tinymist
    typst

    # graphics #
    rawtherapee
    # libresprite


    # flatpaks:
    # flatseal, warehouse, gamescope, protontricks, steamtinkerlaunch,
    # bottles, steam, cartridges, armcord 
    # unofficial homestuck collection,
    # decoder, halftone, calligraphy, newsflash
    # darktable

    # others #
    keepassxc
    stable.google-chrome
    kdePackages.kleopatra

    baobab # storage usage

    prismlauncher # minecraft launcher
  ];
}
