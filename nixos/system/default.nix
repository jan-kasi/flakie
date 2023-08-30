{
  imports = [
    ./nix.nix
    ./network.nix
    ./bootloader.nix
    ./users.nix
    ./locale.nix
    ./audio.nix
    ./security.nix
    ./hardware.nix
    ./systemd.nix
  ];

  system.stateVersion = "23.05"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}