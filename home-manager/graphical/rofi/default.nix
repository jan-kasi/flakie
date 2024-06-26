{ pkgs, ... }: {

  home.packages = with pkgs; [ rofi-bluetooth rofi-pass rofi-mpd ];

  imports = [ ./theme.nix ];

  programs.rofi = {
    enable = true;
    # terminal = "${pkgs.kitty}/bin/kitty";
    terminal = "${pkgs.alacritty}/bin/alacritty";
    font = "CozetteVector 14";
    pass.enable = true;
    plugins = with pkgs; [ rofi-calc rofi-top ];
    extraConfig = {
      show-icons = true;
      drun-display-format = "{icon} {name}";
      display-drun = "⌕ ";
      show-match = true;
      dpi = 0;
      modes = "window,drun,run,ssh,filebrowser,top,calc";
    };
  };

  home.file.".config/rofi/config/askpass.rasi".source = ./config/askpass.rasi;
  home.file.".config/rofi/config/confirm.rasi".source = ./config/confirm.rasi;
  home.file.".config/rofi/config/powermenu.rasi".source = ./config/powermenu.rasi;

  home.file.".config/rofi/bin/powermenu".source = ./bin/powermenu;
  home.file.".config/rofi/bin/launcher".source = ./bin/launcher;
  home.file.".config/rofi/bin/rofi-bluetooth".source = ./bin/rofi-bluetooth;
  home.file.".config/rofi/bin/rofi-wifi-menu".source = ./bin/rofi-wifi-menu;
}
