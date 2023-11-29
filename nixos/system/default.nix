{
  imports = [
    ./bootloader.nix
    ./locale.nix
    ./nix.nix
    ./users.nix
  ];

  ############
  # Hardware #
  ############
  hardware = {
    enableAllFirmware = true;
    cpu.intel.updateMicrocode = true;

    powerManagement.enable = true;
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
  };
}
