{ pkgs, inputs, config, ... }: {
  imports = [
    ./pkgs/main-pkgs.nix
    ./pkgs/rice-pkgs.nix
    ./pkgs/util-pkgs.nix
  ];
}
