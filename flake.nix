{
  description = "My first flakie for managing NixOS";
  
  nixConfig = {
      experimental-features = [ "nix-command" "flakes" ];

      # Cachix
      substituters = [ 
        "https://cache.nixos.org"
      ];
      extra-substituters = [
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
      ];
      extra-trusted-public-keys = [
        "trustedhyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
  };

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Hardware
    hardware.url = "github:nixos/nixos-hardware";

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # You can add other flakes you want here
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nix-colors.url =  "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, helix, ... }@inputs: {

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#snow' (replace #snow with configurations name)
    nixosConfigurations = {
      snow = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
	
        # >>> Your main NixOS configuration file <<< #
	modules = [ ./nixos/configuration.nix ];
      };
    };

    # home-manager configuration entrypoint
    # Available through 'home-manager --flake .#jankasi@snow' (replace with configurations name)
    homeConfigurations = {
      "jankasi@snow" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # home-manager requires 'pkgs' instance (??)
	extraSpecialArgs = { inherit inputs; }; # Pass flake output to out config
        
	# >>> Your main home-manager configuration file <<< #
	modules = [ 
	  ./home-manager/home.nix
	  hyprland.homeManagerModules.default
          {wayland.windowManager.hyprland.enable = true;}

        ];
      };
    };
  };
}
