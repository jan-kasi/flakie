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

    acpi # battery stuff

    cbonsai # fun bonsai
    krabby # fun pokemon

    nix-alien # run binaries
    nix-init # generate nix packages from URLs

    # lsp #
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
    gnome.adwaita-icon-theme
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
    hyprshade
    grimblast
    pantheon.pantheon-agent-polkit

    # documents #
    libreoffice-fresh
    texlive.combined.scheme-full
    multimarkdown
    ditaa # diagrams

    # apps
    anki
    zotero # bibliography
    cool-retro-term
    foliate # read ebooks
  ];
}
