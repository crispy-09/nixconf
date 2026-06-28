{ config, pkgs, inputs, ... }: {


  programs.partition-manager.enable = true;
  environment.systemPackages = with pkgs; [
    wget
    superfile
    unzip
    dosfstools
    exfat
    curl
    git
    gh
    btop
    android-tools
    zed-editor
    tree

  ];


}
