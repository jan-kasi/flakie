{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    libevdev # bluetooth gamepad?
    game-devices-udev-rules # bluetooth gamepad?
    python311
  ];

  programs = {
    git.enable = true;
    fish.enable = true;
    dconf.enable = true;
    light.enable = true;

    # note: enabling here is for proper support, it won't duplicate package ofc, thanks to hash
    hyprland = {
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      enable = true;
      xwayland.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
  };

  fonts.enableDefaultPackages = true;
}
