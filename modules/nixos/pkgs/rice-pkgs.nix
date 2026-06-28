{ config, pkgs, inputs, ... }: {

  programs.firefox.enable = true;


  environment.systemPackages = with pkgs; [
    rofi
    hyprpolkitagent
    nerd-fonts.jetbrains-mono

  ];


}
