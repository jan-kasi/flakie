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

    acpi # battery stuff

    cbonsai # fun bonsai
    krabby # fun pokemon
    pfetch

    # nix-alien # run binaries
    # nix-init # generate nix packages from URLs

    # programming #
    lua
    luaPackages.fennel
    ghc #haskell
    racket
    guile

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
    qrcp # send files over internet

    # tui/cli #
    glow # markdown
    fff # file manager
    ikill # interactive pkill
    # nb # notes
    # catgirl # RSS
    mangal # download manga
    # gnugo # gnu Go AI

    # music #
    spotify-tui #spt
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
    hyprpicker
    hyprshade
    grimblast
    pantheon.pantheon-agent-polkit
    gnome.adwaita-icon-theme # icon theme
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
    uget-integrator
  ];
}
