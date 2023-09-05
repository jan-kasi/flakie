{
  imports = [
    ./minidlna.nix
    ./xserver.nix
    ./openssh.nix
  ];

  services = {
    printing.enable = true; # Enable CUPS to print documents
    mullvad-vpn.enable = true;
    flatpak.enable = true;
    gvfs.enable = true; # gnome nautilus 
  };
}
