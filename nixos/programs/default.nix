# { inputs, pkgs, ... }: {
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    libevdev # bluetooth gamepad?
    game-devices-udev-rules # bluetooth gamepad?
    python311
    # stable.where-is-my-sddm-theme
    adwaita-qt
    adwaita-icon-theme
    dash
  ];

  programs = {
    git.enable = true;
    fish.enable = true;
    dconf.enable = true;
    light.enable = true;
    gamemode.enable = true;
    xwayland.enable = true;
    # ssh.startAgent = true; # conflict with gnome gcr ssh agent
    virt-manager.enable = true;
    localsend.enable = true;

    bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };

    # note: enabling here is for proper support, it won't duplicate package ofc, thanks to hash
    hyprland = {
      # uncomment if changing to flake instead of nixpkgs release. Also in home-manager/desktop/hyprland.nix
      # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      enable = false;
      xwayland.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    # extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # enabling gnome adds this too
    configPackages = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common = {
        default = [ "*" ];
      };
    };
  };

  fonts.enableDefaultPackages = true;

  virtualisation.podman.enable = true;
  
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd= {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
    };
  };
}
