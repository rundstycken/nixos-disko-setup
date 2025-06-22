{ config, pkgs, ... }:
{
  networking.hostName = "nixit";
  networking.firewall.enable = true;
  services.openssh.enable = true;
}
