# NixOS configuration
## Install
### With nixos-anywhere
Prerequisites for target machine:
1. Static IP in DHCP and has SSH server running some os.
2. Either:
    1. Host machine SSH key in authorized_keys for root (nixos-anywhere requires root ssh access).
    2. Or a user with a password that can sudo without password (use this user instead of root in nixos-anywhere command).
3. Must have secrets generated in the config repo with the host user's ssh keys (`nix run github:ryantm/agenix -- -e xxx.age`).

**If installing on a computer without os (nixos installer)**
1. Boot minimal installer
2. Set nixos password with `passwd`.
3. Use `nixos` user instead of `root` below for nixos-anywhere command.

3. Run `nix run nixos-anywhere -- --flake .#<hostname> --extra-files /path --generate-hardware-config nixos-generate-config ./hardware-configuration.nix root@<ip>`
  5. --extra-files directory should include the new host user's ssh keys: /home/<username>/.ssh/id_ed25519*
  7. Copy the hardware info file and commit.
6. Clone the nixos conf repo somewhere on the new machine to rebuild.

### With NixOS installer
Prerequisites for target machine:
* None

1. Boot minimal installer ISO.
2. Copy existing ssh keys to /home/<username>/.ssh/id_ed25159*.
2. Clone config repo to somewhere appropriate like `/etc/nixos/nixconf`.
4. Create hardware info: `nixos-generate-config --no-filesystems` and copy to repo and commit.
1. Generate secrets (with the new host user's ssh keys) with `nix run github:ryantm/agenix -- -e xxx.age` and commit.
3. Run disko to format disk(s): `nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./nixos-config/modules/hosts/<host>/disko-config.nix`.
6. Install NixOS: `nixos-install --no-root-passwd --flake /etc/nixos/nixconf#<host>`.
7. `reboot`

## Todo
* niri
  * hotkey 2 cols 75+25
  * autostart "zed+term", "firefox", "slack" on named workspaces
* localsend config
* (jr-work) better-control
  * adwaita-icon-theme, adwaita-icon-theme-legacy, better-control
  * battery indicator
* clock
