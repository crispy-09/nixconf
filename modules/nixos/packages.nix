{ pkgs, inputs, ... }: {


  programs.fish.enable = true;
  programs.steam.enable = true;
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    dosfstools
    exfat
    curl
    prusa-slicer
    feishin
    alacritty
    discord
    git
    gh
    stoat-desktop
    rofi
    btop
    libva
    libva-utils
    nvidia-vaapi-driver
    zed-editor
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];


}
