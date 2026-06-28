{ pkgs, inputs, ... }: {


  programs.fish.enable = true;
  programs.steam.enable = true;
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [

    nerd-fonts.jetbrains-mono




    prusa-slicer
    feishin
    alacritty
    discord

    stoat-desktop

    libva
    libva-utils
    nvidia-vaapi-driver
    egl-wayland
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];


}
