{ config, pkgs, ... }:
{
  users.users.barkis = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;
}
