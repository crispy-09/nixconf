{ config, pkgs, inputs,  ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos/pkg-packs.nix
      ../../modules/nixos/crsp-user.nix
      ../../modules/services/services.nix
      ../../modules/nvidia.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "GAMER";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Denver";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.crispy = import ../../modules/home-manager/home.nix;
  };

  nixpkgs.config.allowUnfree = true;


  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # System Auto Update
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";
  system.autoUpgrade.allowReboot = true;
  system.stateVersion = "26.05";

  # Automatic Garbage cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;



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
  # let stoat work ;-;
  nixpkgs.config.permittedInsecurePackages = [
      "electron-38.8.4"
    ];


  fileSystems."/mnt/2tb" = {
    device = "/dev/disk/by-uuid/a6deacb0-fcd1-4f6d-b9c7-be3861b4f995";
    fsType = "ext4";
    options = [ "nofail" "users" ];
  };


}
