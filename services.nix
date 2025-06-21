{ config, pkgs, ... }:
{
  # Snapper and Btrfs maintenance
  services.snapper.configs.root = {
    SUBVOLUME = "/";
    snapshotRoot = "/snapshots/root";
    cleanup = [ "number" "timeline" ];
    TIMELINE_CREATE = true;
    TIMELINE_CLEANUP = true;
    TIMELINE_LIMIT_HOURLY = 24;
    TIMELINE_LIMIT_DAILY = 7;
    TIMELINE_LIMIT_WEEKLY = 4;
    TIMELINE_LIMIT_MONTHLY = 12;
    TIMELINE_LIMIT_YEARLY = 1;
  };
  system.activationScripts.postRebuild.text = ''
    ${pkgs.snapper}/bin/snapper --config root create --description 'post-rebuild snapshot'
  '';
  services.btrfs.autoScrub.enable = true;
  services.btrfs.autoScrub.fileSystems = [ "/" ];
  services.timesyncd.enable = true;
  services.printing.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  programs.kdeconnect.enable = true;
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 7d";
}
