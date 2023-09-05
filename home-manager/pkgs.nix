{ pkgs, ... }: {
  home.packages = with pkgs; [
    # utilities #
    fd
    exa
    grc
    ripgrep
    jq
    catimg
    acpi # battery stuff
    ffmpeg
    cbonsai # fun bonsai
    krabby # fun pokemon 
    nix-alien # run binaries
    nix-init # generate nix packages from URLs

    # lsp
    nil
    nixpkgs-fmt
    marksman

    # fonts #
    meslo-lgs-nf
    font-awesome
    jetbrains-mono
    feather-icon-font # custom

    # internet #
    mullvad-vpn
    transmission-gtk
    yt-dlp

    # tui/cli
    glow # markdown
    nb # note-taking, archiving, and knowledge base
    fff # file manager
    ikill # interactive pkill

    # music
    mpc-cli
    mpd-notification
    playerctl
    cli-visualizer
    cava
    python311Packages.requests # fetchart plugin
    python311Packages.pylast # lastgenre plugin

    # wayland
    wl-clipboard
    wl-clip-persist
    cliphist
    swww
    eww-wayland

    # gui editing
    libreoffice-fresh
  ];
}
