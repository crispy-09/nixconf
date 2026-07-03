{ config, pkgs, inputs, ... }: {


  programs.partition-manager.enable = true;
  environment.systemPackages = with pkgs; [
    macchanger
    r2modman
    easyeffects
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
