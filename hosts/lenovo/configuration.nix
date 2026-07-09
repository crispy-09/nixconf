{ config, pkgs, inputs,  ... }:

{
  imports =
    [
      ../../modules/base-conf.nix
      ../../modules/stylix.nix



      ./hardware-configuration.nix
      ../../modules/nixos/pkgs/rice-pkgs.nix
      ../../modules/nixos/pkgs/util-pkgs.nix
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = "lenovo";
}
