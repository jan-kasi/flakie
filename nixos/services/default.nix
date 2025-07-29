{ pkgs, ... }: {
  # tidy services with larger configuration
  imports = [
    ./gnome.nix
  ];

  services = {

    ################
    # Just enabled #
    ################
    tlp.enable = false; # can cause bluetooth issues sometimes, conflicts with gnome power-profiles-daemon
    fstrim.enable = true;
    flatpak.enable = true;
    mullvad-vpn.enable = true; # VPN
    gvfs.enable = true; # gnome nautilus 
    fwupd.enable = true;
    thermald.enable = true; # prevent overheating on intel CPUs, works with other tools
    spice-vdagentd.enable = true; # for virtualisation, enable spice client
    spice-autorandr.enable = true; # for virtualisation, resize display automatically
    spice-webdavd.enable = true; # for virtualisation, file sharing

    ##############
    # Configured #
    ##############


    printing.enable = true; # Enable CUPS to print documents
    printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin pkgs.hplip pkgs.cnijfilter2 ];
    avahi.enable = true;
    avahi.openFirewall = true;
    avahi.nssmdns4 = true;

    logind = {
      lidSwitch = "ignore";
    };

    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };

    cloudflare-warp.enable = true;

    dbus.packages = [ pkgs.gcr ];

    auto-cpufreq.enable = false; #conflicts with gnome power-profiles-daemon
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
      displayManager.gdm.wayland = true;

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

    # SDDM
    displayManager.sddm = {
      enable = false;
      # package = pkgs.libsForQt5.sddm;
      wayland.enable = true;
      enableHidpi = true;
      theme = "where_is_my_sddm_theme";
    };

    # Audio via pipewire
    pulseaudio.enable = false;
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
        wide_links = "yes"; # allow symlinks that point outside media_dir
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
