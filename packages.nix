{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    firefox
    neovim
    btop
    wget
    curl
    unzip
    file
    tree
  ];
}
