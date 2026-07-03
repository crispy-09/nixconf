{ config, pkgs, osConfig, ...}:
{

programs.fish = {
  enable = true;

  shellAliases = {
    ptest = "ping 1.1.1.1";
    ll = "ls -l";
    nixconf = "nano ~/.config/nixos/hosts/${osConfig.networking.hostName}/configuration.nix";
    nrs = "sudo nixos-rebuild switch --flake ~/.config/nixos/#${osConfig.networking.hostName}";
    nrt = "sudo nixos-rebuild test --flake ~/.config/nixos/#${osConfig.networking.hostName}";
    nr = "sudo nixos-rebuild";
    nixcd = "cd ~/.config/nixos";
    nixstoreopt = "nix-store --optimize";
    nixgen = "nixos-rebuild list-generations";
    nixsearch = "nix search nixpkgs";
    spf = "superfile";
  };
};

}
