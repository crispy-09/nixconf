{ config, pkgs, inputs,  ... }:
{
  imports = [
    ./services/services.nix
    ./nixos/crsp-user.nix
    ./nixos/pkgs/main-pkgs.nix
    inputs.home-manager.nixosModules.default
  ];
}
