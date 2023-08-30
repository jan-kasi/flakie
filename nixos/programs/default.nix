{ inputs, pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    wget
    curl
    polkit_gnome
    libevdev # bluetooth gamepad?
    game-devices-udev-rules # bluetooth gamepad?
  ];

  programs = {
    git.enable = true;
    fish.enable = true;
    mosh.enable = true;
    dconf.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}