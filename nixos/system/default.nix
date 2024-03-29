{ pkgs, lib, ... }: {
  imports = [
    ./bootloader.nix
    ./locale.nix
    ./nix.nix
    ./users.nix
  ];

  ############
  # Hardware #
  ############
  powerManagement.enable = true;
  hardware = {
    enableAllFirmware = true;
    cpu.intel.updateMicrocode = true;

    bluetooth.enable = true;

    uinput.enable = true;
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  #########
  # AUDIO #
  #########
  # via pipewire enabled in ../services/default.nix
  hardware.pulseaudio.enable = false; # therefore disable pulseaudio

  ###############
  # FONTS/STYLE #
  ###############
  qt.style = "adwaita";

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      # fonts #
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk
      libertinus
      cozette
      # icons
      symbola
      font-awesome
      feather-icon-font # custom
      # nerdfonts
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Iosevka" "IosevkaTerm" "Monoid" "Mononoki" ]; })
      meslo-lgs-nf
    ];

    fontconfig = {
      enable = true;
      antialias = true; # Fixes pixelation
      hinting = {
        enable = true; # Fixes antialiasing blur
        style = "full";
        autohint = true;
      };
      subpixel = {
        # Makes it bolder
        rgba = "rgb";
        lcdfilter = "default";
      };
    };
  };

  ###########
  # Network #
  ###########
  networking = {
    hostName = "snow";
    networkmanager.enable = true; # via Network Manager
    firewall.enable = false; # Disable the firewall altogether (lazy option instead of only opening specific ports)
  };

  ###########
  # SystemD #
  ###########
  # NOFILE for Steam Proton games
  # timeoutstop so you don't need to wait 90s on poweroff stop jobs
  systemd.extraConfig = ''
    DefaultLimitNOFILE=1048576
    DefaultTimeoutStopSec=10s
  '';

  # update path (flatpak stuff) 
  systemd.user.extraConfig = ''
    DefaultEnvironment="PATH=/run/wrappers/bin:/etc/profiles/per-user/%u/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
  '';

  ############
  # Security #
  ############
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.swaylock.text = ''
      # PAM configuration file for the swaylock screen locker. By default, it includes
      # the 'login' configuration file (see /etc/pam.d/login)
      auth include login
    '';
    pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
  };
}
