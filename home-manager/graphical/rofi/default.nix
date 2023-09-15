{ pkgs, ... }: {

  imports = [ ./theme.nix ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";
    font = "MesloLGS NF 14";
    plugins = [ ];
    extraConfig = {
      show-icons = true;
      drun-display-format = "{icon} {name}";
      display-drun = " ";
      show-match = true;
    };
  };
  home.file.".config/rofi/config/askpass.rasi".source = ./config/askpass.rasi;
  home.file.".config/rofi/config/confirm.rasi".source = ./config/confirm.rasi;
  home.file.".config/rofi/config/powermenu.rasi".source = ./config/powermenu.rasi;

  home.file.".config/rofi/bin/powermenu".source = ./bin/powermenu;
  home.file.".config/rofi/bin/launcher".source = ./bin/launcher;
  home.file.".config/rofi/bin/rofi-bluetooth".source = ./bin/rofi-bluetooth;
}
