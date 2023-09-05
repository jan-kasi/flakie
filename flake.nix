{
  description = "Nix flake managing NixOS";

  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hardware.url = "github:nixos/nixos-hardware";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    helix.url = "github:helix-editor/helix";
    # helix.inputs.nixpkgs.follows = "nixpkgs"; I think helix flake adds a cachix, so don't override

    hyprland.url = "github:hyprwm/Hyprland";
    # don't override hyprland nixpkgs follows, this would make hyprland cachix useless

    newm-atha.url = "sourcehut:~atha/newm-atha";
    newm-atha.inputs.nixpkgs.follows = "nixpkgs";

    nix-alien.url = "github:thiagokokada/nix-alien";
    nix-alien.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      usedSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
    in
    rec {
      # Your custom packages
      packages = usedSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; }
      );
      # Devshell for bootstrapping
      devShells = usedSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./dev/shell.nix { inherit pkgs; }
      );

      # NixOS configuration entrypoint
      nixosConfigurations = {
        snow = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      homeConfigurations = {
        "jankasi@snow" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home-manager/home.nix
          ];
        };
      };

      # Custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };
      # Reusable nixos modules
      nixosModules = import ./modules/nixos;
      # Reusable home-manager modules
      homeManagerModules = import ./modules/home-manager;
    };
}
