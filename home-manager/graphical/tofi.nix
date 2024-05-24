{ pkgs, ... }: {
  home.packages = [ pkgs.tofi ];

  # create file ~/.config/tofi/current-theme with "include = /home/jankasi/.config/tofi/themes/fullscreen" or your choice
  xdg.configFile."tofi/config".text = ''
    font     = "/home/jankasi/.nix-profile/share/fonts/truetype/MesloLGS\ NF\ Regular.ttf"
    include  = "/home/jankasi/.config/tofi/current-theme"
    terminal = alacritty
  '';

  home.file.".config/tofi/themes/fullscreen".text = ''
    width = 100%
    height = 100%
    border-width = 0
    outline-width = 0
    padding-left = 35%
    padding-top = 35%
    result-spacing = 25
    num-results = 5
    background-color = #000A
    clip-to-padding = true
  '';
}
