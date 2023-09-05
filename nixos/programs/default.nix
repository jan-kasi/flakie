{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    polkit_gnome
    libevdev # bluetooth gamepad?
    game-devices-udev-rules # bluetooth gamepad?
    python311
    hyprland-share-picker
  ];

  programs = {
    git.enable = true;
    fish.enable = true;
    mosh.enable = true;
    dconf.enable = true;
    hyprland = {
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      enable = true;
      xwayland.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  fonts.enableDefaultPackages = true;
}
