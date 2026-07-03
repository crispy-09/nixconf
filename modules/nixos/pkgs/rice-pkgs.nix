{ config, pkgs, inputs, ... }: {

  programs.firefox.enable = true;


  environment.systemPackages = with pkgs; [
    pavucontrol
    cava
    hyprpaper
    hyprlock
    rofi
    hyprpolkitagent
    nerd-fonts.jetbrains-mono
    swaynotificationcenter

  ];


}
