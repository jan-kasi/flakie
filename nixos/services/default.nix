{
  # tidy services with larger configuration
  imports = [
    # ./gnome.nix
  ];

  services = {
    ################
    # Just enabled #
    ################
    fstrim.enable = true;
    printing.enable = true; # Enable CUPS to print documents
    flatpak.enable = true;
    mullvad-vpn.enable = true; # VPN
    gvfs.enable = true; # gnome nautilus 
    fwupd.enable = true;
    tlp.enable = true; # power management daemon
    thermald.enable = true; # prevent overheating on intel CPUs, works well with other tools

    ##############
    # Configured #
    ##############

    # Xserver
    xserver = {
      enable = true;
      xkb.layout = "gb";
      xkb.variant = "";
      dpi = 331;
      # monitorSection = ''
      #   
      # '';

      windowManager.awesome.enable = true;

      displayManager.defaultSession = "hyprland";
      # desktopManager.gnome.enable = true;
      # displayManager.gdm.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        enableHidpi = true;
        theme = "where_is_my_sddm_theme";
      };
    };

    # Audio via pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Media sharing
    minidlna = {
      enable = true;
      openFirewall = true;
      settings = {
        log_level = "error";
        inotify = "yes";
        friendly_name = "minidlna";
        media_dir = [
          "V,/mnt/minidlna/Videos/" # Video files are located here
        ];
      };
    };

    # Remote access with SSH
    openssh = {
      enable = false;
      settings = {
        PasswordAuthentication = true; # false = use keys only. true = allow SSH using password (not recommended)
        PermitRootLogin = "no"; # Forbid root login through SSH.
      };
    };

  };
}
