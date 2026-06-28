{ lib, config, pkgs, ...}:

{
    users.users."crispy" = {
        isNormalUser = true;
        description = "crispy";
        extraGroups = [ "networkmanager" "wheel" "video" "render"];
        packages = with pkgs; [
            kdePackages.kate
        ];
        shell = pkgs.fish;
    };
}
