{ config, pkgs, inputs,  ... }:
{
  imports = [
    ./services/services.nix
    ./nixos/crsp-user.nix
    ./nixos/pkgs/main-pkgs.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;
  time.timeZone = "America/Denver";

  # Locale?
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

  # Home manager YAAAY
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.crispy = import ./home-manager/home.nix;
    backupFileExtension = "backup";
  };

  # oooo nix stuff
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


  # let stoat work ;-;
  nixpkgs.config.permittedInsecurePackages = [
      "electron-38.8.4"
    ];

}
