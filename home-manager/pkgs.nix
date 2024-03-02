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
    zip
    unzip

    acpi # battery stuff

    cbonsai # fun bonsai
    krabby # fun pokemon
    pfetch

    # nix-alien # run binaries
    # nix-init # generate nix packages from URLs

    # lsp #
    nil
    nixpkgs-fmt
    nixfmt
    shellcheck
    shfmt
    marksman


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

    # wayland #
    wl-clipboard
    wl-clip-persist
    cliphist
    swww
    eww-wayland
    hyprpicker
    hyprshade
    grimblast
    pantheon.pantheon-agent-polkit
    gnome.adwaita-icon-theme #icon theme

    # documents #
    libreoffice-fresh
    texlive.combined.scheme-full
    multimarkdown
    ditaa # diagrams

    # apps
    ungoogled-chromium
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
