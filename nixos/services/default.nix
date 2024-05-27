{ pkgs, ... }: {
  # tidy services with larger configuration
  imports = [
    # ./gnome.nix
  ];

  services = {
    ################
    # Just enabled #
    ################
    tlp.enable = false; # can cause bluetooth issues sometimes
    fstrim.enable = true;
    printing.enable = true; # Enable CUPS to print documents
    flatpak.enable = true;
    mullvad-vpn.enable = true; # VPN
    gvfs.enable = true; # gnome nautilus 
    fwupd.enable = true;
    thermald.enable = true; # prevent overheating on intel CPUs, works with other tools

    ##############
    # Configured #
    ##############

    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };

    auto-cpufreq.enable = true;
    auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };

    # Xserver
    xserver = {
      enable = true;
      xkb.layout = "gb";
      xkb.variant = "";
      dpi = 192;
      upscaleDefaultCursor = true;
      # monitorSection = ''
      #   
      # '';

      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;

      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          fennel
          luaposix
        ];
      };
    };

    # Display Manager
    displayManager.defaultSession = "gnome";
    # displayManager.sddm = {
    #  enable = true;
    #  #  # package = pkgs.libsForQt5.sddm;
    #  wayland.enable = true;
    #  enableHidpi = true;
    #  theme = "where_is_my_sddm_theme";
    #};

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
