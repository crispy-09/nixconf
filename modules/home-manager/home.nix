{ config, pkgs, ... }:

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


  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" ];
    userSettings = {
      theme = {
        mode = "system";
        dark = "One Dark";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Nate Johnson";
    userEmail = "naterjohnson09@gmail.com";
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      ptest = "ping 1.1.1.1";
      ll = "ls -l";
      nixconf = "nano /home/crispy/.config/nixos/hosts/gamer/configuration.nix";
      pkgconf = "nano /home/crispy/.config/nixos/modules/nixos/packages.nix";
      nrs = "sudo nixos-rebuild switch --flake /home/crispy/.config/nixos/#GAMER";
      nrt = "sudo nixos-rebuild test --flake /home/crispy/.config/nixos/#GAMER";
      nr = "sudo nixos-rebuild";
      nixcd = "cd ~/.config/nixos";
      nixstoreopt = "nix-store --optimize";
      nixgen = "nixos-rebuild list-generations";
      nixsearch = "nix search nixpkgs";
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
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
