{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    }; # Added closing brace here

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, caelestia-shell, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # Combined specialArgs into one set
      specialArgs = { inherit caelestia-shell home-manager; }; 
      
      modules = [
        ./configuration.nix
        # Now this reference works because 'home-manager' is the input name
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
