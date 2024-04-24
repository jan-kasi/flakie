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
    songrec # recognise songs

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
    spotify-player
    mpc-cli
    mpd-notification
    playerctl
    cava
    python311Packages.requests # fetchart plugin
    python311Packages.pylast # lastgenre plugin

    # wayland/windowmanager #
    wl-clipboard
    wl-clip-persist
    cliphist
    swww
    feh
    waypaper # gui frontend
    hyprpicker
    hyprshade
    hyprcursor
    grimblast
    pantheon.pantheon-agent-polkit
    gnome.adwaita-icon-theme
    adwaita-qt
    gtklock # lock screen

    # documents #
    libreoffice-fresh
    texliveFull
    multimarkdown

    # apps
    anki
    zotero
    minder
    foliate # read ebooks
    gnome.gnome-boxes # gui stuff for virtualisation (qemu)
    # flatpaks: steam, flatseal, bottles, unofficial homestuck collection, cartridges
    uget
    prismlauncher
  ];
}
