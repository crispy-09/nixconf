{ pkgs, ... }: {
 
  programs.hyprland.enable = true;
  programs.fish.enable = true;

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
  ];

}
