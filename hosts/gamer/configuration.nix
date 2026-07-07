{ config, pkgs, inputs,  ... }:

{
  imports =
    [
      ../../modules/base-conf.nix

      ./hardware-configuration.nix
      ../../modules/nvidia.nix
      ../../modules/nixos/pkgs/rice-pkgs.nix
      ../../modules/nixos/pkgs/util-pkgs.nix
      ../../modules/stylix.nix
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = "GAMER";


  # make nvidia work lmao
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ] ;
  hardware.nvidia.open = true;
  hardware.nvidia.modesetting.enable = true;
  boot.kernelParams = [ "nvidia_drm.fbdev=1" ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
  };


  fileSystems."/mnt/2tb" = {
    device = "/dev/disk/by-uuid/a6deacb0-fcd1-4f6d-b9c7-be3861b4f995";
    fsType = "ext4";
    options = [ "nofail" "users" ];
  };


}
