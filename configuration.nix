{ config, pkgs, ... }:

{
  # Imports
  imports = [
    # ./hardware-configuration.nix
    ./disko.nix
    ./users.nix
    ./desktop.nix
    ./networking.nix
    ./services.nix
    ./fonts.nix
    ./packages.nix
  ];

  # System basics
  system.stateVersion = "25.05";
  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "sv-latin1";
  i18n.extraLocaleSettings = {
    LC_TIME = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
  };

  # Bootloader and filesystems
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.supportedFilesystems = [ "btrfs" ];

  fileSystems."/".options = [ "subvol=@root" "compress=zstd" "noatime" ];
  fileSystems."/home".options = [ "subvol=@home" "compress=zstd" "noatime" ];
  fileSystems."/nix".options = [ "subvol=@nix" "compress=zstd" "noatime" ];
  fileSystems."/persist".options = [ "subvol=@persist" "compress=zstd" "noatime" ];
  fileSystems."/var/log".options = [ "subvol=@log" "compress=zstd" "noatime" ];
  fileSystems."/snapshots".options = [ "subvol=@snapshots" "compress=zstd" "noatime" ];
}
