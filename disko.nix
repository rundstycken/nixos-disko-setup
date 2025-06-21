{
  disko.devices = {
    disk = {
      nvmeNix = {
        device = "/dev/nvme1n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            esp = {
              name = "ESP";
              type = "EF00";
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            swap = {
              name = "swap";
              type = "8200";
              size = "8G";
              content = {
                type = "swap";
                # No mountpoint for swap!
              };
            };
            root = {
              name = "btrfs";
              type = "8300";
              size = "100%";
              content = {
                type = "btrfs";
                mountpoint = "/";
                subvolumes = {
                  "@root" = { mountpoint = "/"; };
                  "@home" = { mountpoint = "/home"; };
                  "@nix" = { mountpoint = "/nix"; };
                  "@persist" = { mountpoint = "/persist"; };
                  "@log" = { mountpoint = "/var/log"; };
                  "@snapshots" = { mountpoint = "/snapshots"; };
                };
                extraArgs = [ "compress=zstd" "noatime" ];
              };
            };
          };
        };
      };
    };
  };
}

