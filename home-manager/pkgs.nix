{ pkgs, ... }: {
  home.packages = with pkgs; [
    # utilities #
    fd
    exa
    grc
    ripgrep
    jq
    chafa # teminal graphics
    acpi # battery stuff
    # brightnessctl # currently using light 
    ffmpeg
    cbonsai # fun bonsai
    krabby # fun pokemon 
    nix-alien # run binaries
    nix-init # generate nix packages from URLs

    # lsp
    nil
    nixpkgs-fmt
    nixfmt
    marksman

    # fonts #
    jetbrains-mono
    # icons
    font-awesome
    feather-icon-font # custom
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

    # documents #
    libreoffice-fresh
    texlive.combined.scheme-full
    ghostscript
    # for emacs doom org jupyter integration require
    # (python311.withPackages(ps: with ps; [jupyter]))
    pandoc

    # other #
    zotero # bibliography
  ];
}
