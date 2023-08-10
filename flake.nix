{
  description = "My first flakie for managing NixOS";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hardware
    hardware.url = "github:nixos/nixos-hardware";
    
    # You can add other flakes you might need/want here (such as nixos-hardware above)
    # look into the following?
    # nix-colors.url =  "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

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
	modules = [ ./home-manager/home.nix ];
      };
    };
  };
}
