{ pkgs, ... }: {

  imports = [ ./theme.nix ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";
    font = "CozetteVector 14";
    pass.enable = true;
    plugins = with pkgs; [ rofi-calc rofi-mpd rofi-top rofi-bluetooth rofi-pass ];
    extraConfig = {
      show-icons = true;
      drun-display-format = "{icon} {name}";
      display-drun = " ";
      show-match = true;
      dpi = 0;
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
