{ config, pkgs, inputs, hostName, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "crispy";
  home.homeDirectory = "/home/crispy";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [

  ];

  imports = [
    ../fish.nix
    ../hyprland.nix
    inputs.zen-browser.homeModules.twilight
  ];

  programs.zen-browser = {
    enable = true;
    profiles = {
      "Default Profile" = {
        isDefault = true;
      };
    };
  };


  programs.nix-search-tv = {
    enable = true;
    enableTelevisionIntegration = true;
    settings = {
        indexes = [ "nixpkgs" "home-manager" "nixos" ];
      };
  };
  programs.vesktop.enable = true;
  programs.bat.enable = true;
  programs.fd.enable = true;
  programs.television.enable = true;
  programs.rofi.enable = true;

  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" "lua" ];
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Nate Johnson";
      user.email = "naterjohnson09@gmail.com";
    };
    extraConfig = {
        credential.helper = "!${pkgs.gh}/bin/gh auth git-credential";
      };

  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          fit_mode = "cover";
          monitor = "DP-2";
          path = "/home/crispy/Pictures/Wallpapers/golden.jpg";
        }
        {
          monitor = "DP-1";
          path = "/home/crispy/Pictures/Wallpapers/golden.jpg";
        }
      ];

    };
  };




  stylix.targets = {
    zed.enable = true;
    hyprland.enable = true;
    vesktop.enable = true;
    rofi.enable = true;
    zen-browser = {
      enable = true;
      profileNames = ["Default Profile"];
    };
  };




  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
