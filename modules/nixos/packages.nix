{ pkgs, ... }: {
 
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    dosfstools
    exfat
    curl
    prusa-slicer
    feishin
    alacritty
    discord
    hyprlauncher
    git  
    gh
    stoat-desktop
    rofi
    btop
  ];

}
