{ config, pkgs, inputs, hostName, lib, ... }:

{
  home.username = "crispy";
  home.homeDirectory = "/home/crispy";
  home.stateVersion = "26.05";
  home.packages = [

  ];

  imports = [
    ../fish.nix
    ../hyprland/common.nix
    ../hyprland/${hostName}.nix
    inputs.zen-browser.homeModules.twilight
  ];

  programs = {
    btop.enable = true;
    vesktop.enable = true;
    bat.enable = true;
    fd.enable = true;
    television.enable = true;
    rofi.enable = true;

    zen-browser = {
      enable = true;
      profiles = {
        "Default Profile" = {
          isDefault = true;
        };
      };
    };

    nix-search-tv = {
      enable = true;
      enableTelevisionIntegration = true;
      settings = {
          indexes = [ "nixpkgs" "home-manager" "nixos" ];
        };
    };

    zed-editor = {
      enable = true;
      extensions = [ "nix" "lua" ];
      mutableUserSettings = false;

    };

    git = {
      enable = true;
      settings = {
        user.name = "Nate Johnson";
        user.email = "naterjohnson09@gmail.com";
      };
      extraConfig = {
          credential.helper = "!${pkgs.gh}/bin/gh auth git-credential";
        };

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
    btop.enable = true;
    hyprland.enable = true;
    vesktop.enable = true;
    rofi.enable = true;
    zen-browser = {
      enable = true;
      profileNames = ["Default Profile"];
    };
  };

  # Used to correctly theme zed
  home.activation.fixZedThemeAppearance = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
      themeFile="${config.xdg.configHome}/zed/themes/stylix.json"
      if [ -e "$themeFile" ]; then
        $DRY_RUN_CMD ${pkgs.jq}/bin/jq '.themes[0].appearance = "dark"' "$themeFile" > "$themeFile.tmp"
        $DRY_RUN_CMD mv "$themeFile.tmp" "$themeFile"
      fi
    '';



  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
