{ pkgs, conf, ...}:
{
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    image = ../assets/wallpapers/golden.jpg;


    fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };
        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };
      };
  };
}
