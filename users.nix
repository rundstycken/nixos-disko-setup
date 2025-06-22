{ config, pkgs, ... }:
{
  users.users.barkis = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    password = "";
  };
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;
}
