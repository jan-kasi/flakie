# { inputs, pkgs, ... }: {
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    libevdev # bluetooth gamepad?
    game-devices-udev-rules # bluetooth gamepad?
    python311
    # where-is-my-sddm-theme
    adwaita-qt
    gnome.adwaita-icon-theme
  ];

  programs = {
    git.enable = true;
    fish.enable = true;
    dconf.enable = true;
    light.enable = true;

    # note: enabling here is for proper support, it won't duplicate package ofc, thanks to hash
    hyprland = {
      # uncomment if changing to flake instead of nixpkgs release. Also in home-manager/desktop/hyprland.nix
      # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      enable = true;
      xwayland.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ]; # gnome already adds this
  };

  fonts.enableDefaultPackages = true;
  virtualisation.libvirtd.enable = true;
}
