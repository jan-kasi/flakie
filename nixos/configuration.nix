# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    # provided by nixos-generate-config
    ./hardware-configuration.nix

    # You can put here modules to use from other flakes
  ];
  
  nixpkgs = {
    config.allowUnfree = true;
    # overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      # outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages
      
     # You can also add overlays exported from other flakes:
     # neovim-nightly-overlay.overlays.default
      
     # Or define it inline, for example:
     # (final: prev: {
     #   hi = final.hello.overrideAttrs (oldAttrs: {
     #     patches = [ /change-hello-to-hi.patch ];
     #   });
     # })
    # ];
  };
  
  nix = {
    # This will add each flake input as a registry (make nix3 commands consistent with your files)
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;    
    
    settings = {
      # Enable flakes and new  'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix-store
      auto-optimise-store = true;
      # Allow users of wheel group to also set substituters
      trusted-users = [ "root" "@wheel" ];
      
    };
  };

  # Define your hostname
  networking.hostName = "snow";
  
  # Your bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configue your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    jankasi = {
      isNormalUser = true;
      description = "jan kasi";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
      shell = pkgs.fish;
    };

    minidlna = {
      extraGroups = [ "users" ]; # Allow access to directories (can't do /home)
    };
 }; 
  
  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure X11/xorg server
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
    # Enable X11 windowing system
    enable = true;
    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Configure console keymap
  console.keyMap = "uk";

  # add shells to /etc/shells 
  environment.shells = with pkgs; [ fish ];  

  # Enable networking with NetworkManager
  networking.networkmanager.enable = true;

  ##################
  # Enable things #
  #################

  ## override to remove unused gnome packages ##
  environment.gnome.excludePackages = with pkgs; [
    gnome.cheese
    gnome.eog
    gnome.epiphany
    gnome.evince
    gnome.geary
    gnome.gnome-characters
    gnome.gnome-contacts
    gnome.gnome-maps
    gnome.gnome-music
    gnome.gnome-software
    gnome.gnome-system-monitor
    gnome.gnome-weather
    gnome.yelp
    gnome.totem
    gnome.geary
    gnome-tour
  ];
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # Better for steam proton games
  systemd.extraConfig = "DefaultLimitNOFILE=1048576";

  ##############################################
  # List packages installed in system profile. #
  ##############################################

  environment.systemPackages = with pkgs; [
    wget
    curl
  ];
  
  # Enable Mullvad-vpn daemon
  services.mullvad-vpn.enable = true;
  # Enable Git
  programs.git.enable = true;
  # Enable Flatpak
  services.flatpak.enable = true;
  # Enable Fish shell
  programs.fish.enable = true;
  # Enable MiniDLNA
  services.minidlna.enable = true;
  services.minidlna.settings = {
    friendly_name = "minidlna media";
    media_dir = [
      "V,/mnt/minidlna/Videos/" #Video files are located here
    # "A,/mnt/minidlna/Music/"  #Audio files are here
    # "etc..." 
    ];  
    log_level = "error";
    inotify = "yes";
    openFirewall = true;
  };

  # ------------------- #
  # Hyprland compositor #
  # ------------------- #

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
