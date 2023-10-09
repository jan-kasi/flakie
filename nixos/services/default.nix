{
  # For services with configuration other than just enable = true;
  imports = [
    ./minidlna.nix
    ./xserver.nix
    ./openssh.nix
  ];

  # Just for those being enabled
  services = {
    printing.enable = true; # Enable CUPS to print documents
    mullvad-vpn.enable = true;
    flatpak.enable = true;
    gvfs.enable = true; # gnome nautilus 
    fstrim.enable = true;
    fwupd.enable = true;
  };
}
