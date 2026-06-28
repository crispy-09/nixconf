{ pkgs, inputs, ... }: {

  environment.systemPackages = with pkgs; [
    rofi
    hyprpolkitagent
    nerd-fonts.jetbrains-mono

  ];


}
