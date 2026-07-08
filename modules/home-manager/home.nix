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
  ];




  programs.zed-editor = {
    enable = true;
    extensions = [ "nix, lua" ];
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Nate Johnson";
      user.email = "naterjohnson09@gmail.com";
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


  home.file = {
      ".config/hypr/hyprland.lua".source =
        config.lib.file.mkOutOfStoreSymlink
          "/home/crispy/.config/nixos/external-conf/hypr/hosts/${hostName}.lua";
    };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/crispy/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
