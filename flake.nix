{
  description = "NixOS with Disko, Btrfs, Snapper, Snapshots, and Dual Boot";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko";
  };

  outputs = { self, nixpkgs, disko, ... }: {
    nixosConfigurations = {
      nixit = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          ./disko.nix
          ./configuration.nix
          # ./hardware-configuration.nix  # Add this after your first install
        ];
      };
    };
  };
}

