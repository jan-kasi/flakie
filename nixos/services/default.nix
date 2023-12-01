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

    ##############
    # Configured #
    ##############

    # Xserver
    xserver = {
      layout = "gb";
      xkbVariant = "";
      enable = true;
      # desktopManager.gnome.enable = true;

      # displayManager.gdm.enable = true;
      displayManager.lightdm.enable = true;
      displayManager.lightdm.greeters.pantheon.enable = true;
      # displayManager.sddm.enable = true;
      # For some reason following theme is BROKEN, doesn't let me log in
      # (it tries setting user as "", maybe that's the problem?)
      # displayManager.sddm.theme = "where_is_my_sddm_theme"; 
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
