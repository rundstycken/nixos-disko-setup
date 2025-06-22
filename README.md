# nixos-disko-setup

## How to Install NixOS on Another Computer Using nixos-anywhere (from WSL)

### Prerequisites
- You have this repo cloned on your WSL machine (with Nix installed).
- The target computer is booted into a live Linux environment (NixOS ISO recommended) with SSH enabled and network access.
- You know the target computer's IP address and root password (or have passwordless sudo).

### 1. Install Nix on your WSL machine (if not already installed)
```sh
sh <(curl -L https://nixos.org/nix/install)
```
Log out and back in, or run:
```sh
. ~/.nix-profile/etc/profile.d/nix.sh
```

### 2. (Optional) Test your NixOS flake build
```sh
nix build .#nixosConfigurations.nixit.config.system.build.toplevel
```

### 3. Boot the target computer with a live Linux USB
- Use the NixOS ISO or any Linux live environment.
- Connect to the network and enable SSH:
  - For NixOS ISO: `sudo systemctl start sshd`
  - Set a root password: `sudo passwd`
  - Find the IP: `ip a`

### 4. Run nixos-anywhere from your WSL machine
You do NOT need to install nixos-anywhere globally. Just run:
```sh
nix run github:nix-community/nixos-anywhere -- --flake .#nixit root@<target-ip>
```
Replace `<target-ip>` with the IP address of the target machine.

- To do a dry run (no changes):
```sh
nix run github:nix-community/nixos-anywhere -- --dry-run --flake .#nixit root@<target-ip>
```

### 5. Follow the prompts
- nixos-anywhere will partition, copy, and install NixOS as defined in your flake.
- When finished, reboot the target machine and remove the live USB.

### Notes
- The target disk will be wiped and repartitioned according to your `disko.nix`.
- If dual-booting with Windows, make sure your Disko config only targets the correct drive.
- You can add more hosts or customize your flake for multi-host setups.

---

For more details, see: https://github.com/nix-community/nixos-anywhere