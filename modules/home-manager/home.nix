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


  stylix.targets.zed.enable = true;
  stylix.targets.hyprland.enable = true;
  stylix.targets.zen-browser = {
    enable = true;
    profileNames = [ "Default Profile" ];
  };



  home.file = {
      ".config/hypr/hyprland.lua".source =
        config.lib.file.mkOutOfStoreSymlink
          "/home/crispy/.config/nixos/external-conf/hypr/hosts/${hostName}.lua";
    };


  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
