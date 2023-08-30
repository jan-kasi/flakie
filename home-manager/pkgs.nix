{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # utilities #
    fd
    exa
    grc
    ripgrep
    jq
    # catimg
    ffmpeg
    cbonsai # fun
    nix-alien # run binaries

    # lsp
    nil
    nixpkgs-fmt
    marksman
    
    # fonts #
    meslo-lgs-nf

    # internet #
    mullvad-vpn
    transmission-gtk
    yt-dlp

    # tui
    glow     # markdown
    nb       # note-taking, archiving, and knowledge base
    fff      # file manager
    walk     # file manager
    ikill    # interactive pkill
    
    
    # music
    mpc-cli
    mpd-notification
    cli-visualizer
    cava
    python311Packages.requests # fetchart plugin
    python311Packages.pylast # lastgenre plugin

    # wayland
    wl-clipboard
    wl-clip-persist
    cliphist
    swww
  ];
}
