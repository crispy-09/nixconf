{ config, pkgs, ...}:
{

programs.fish = {
  enable = true;

  shellAliases = {
    ptest = "ping 1.1.1.1";
    ll = "ls -l";
    nixconf = "nano /home/crispy/.config/nixos/hosts/gamer/configuration.nix";
    pkgconf = "nano /home/crispy/.config/nixos/modules/nixos/packages.nix";
    nrs = "sudo nixos-rebuild switch --flake /home/crispy/.config/nixos/#GAMER";
    nrt = "sudo nixos-rebuild test --flake /home/crispy/.config/nixos/#GAMER";
    nr = "sudo nixos-rebuild";
    nixcd = "cd ~/.config/nixos";
    nixstoreopt = "nix-store --optimize";
    nixgen = "nixos-rebuild list-generations";
    nixsearch = "nix search nixpkgs";
    spf = "superfile";
  };
};

}
