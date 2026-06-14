# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/packages.nix
      ../../modules/nixos/crsp-user.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "GAMER"; # Define your hostname.
  #  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
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


  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # Install firefox.
  programs.firefox.enable = true;
  programs.partition-manager.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.crispy = import ./home.nix;
  };

  # Allow unfree packages
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

 # let stoat work ;-;
 nixpkgs.config.permittedInsecurePackages = [
    "electron-38.8.4"
  ];



}
