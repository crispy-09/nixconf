{ config, pkgs, inputs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    configType = "hyprlang";
    settings = {
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, W, exec, zen-twilight"
        "$mainMod, T, exec, alacritty"
        "$mainMod, E, exec, dolphin"
        "$mainMod, SPACE, exec, rofi -show drun"
        "$mainMod, Q, exec, hyprctl dispatch killactive"
        "$mainMod SHIFT, SPACE, togglefloating"







        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 0"

        "$mainMod Shift, 1, movetoworkspace, 1"
        "$mainMod Shift, 2, movetoworkspace, 2"
        "$mainMod Shift, 3, movetoworkspace, 3"
        "$mainMod Shift, 4, movetoworkspace, 4"
        "$mainMod Shift, 5, movetoworkspace, 5"
        "$mainMod Shift, 6, movetoworkspace, 6"
        "$mainMod Shift, 7, movetoworkspace, 7"
        "$mainMod Shift, 8, movetoworkspace, 8"
        "$mainMod Shift, 9, movetoworkspace, 9"
        "$mainMod Shift, 0, movetoworkspace, 0"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizeactive"
      ];
    };
  };
}
