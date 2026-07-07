{
  description = "Woaw";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, stylix, ... }@inputs: {
    nixosConfigurations.GAMER = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        stylix.nixosModules.stylix
        ./hosts/gamer/configuration.nix

      ];
    };
    nixosConfigurations.lenovo = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        stylix.nixosModules.stylix
        ./hosts/lenovo/configuration.nix

      ];
    };
  };
}
