{ inputs, ... }:
{
  # You can import other home-manager modules here
  imports = [
    ./homesystem.nix
    ./pkgs.nix
    ./programs
    ./desktop

    # Modules exported from other flakes
    inputs.nix-colors.homeManagerModules.default
    # inputs.hyprland.homeManagerModules.default DISABLED because no settings option, only extraConfig

    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
