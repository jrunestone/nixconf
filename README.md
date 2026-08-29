# NixOS configuration
## Install
Prerequisites for target machine:
1. Static IP in DHCP
3. Must have secrets generated in the config repo with the TARGET host's ssh keys (new or existing) (`nix run github:ryantm/agenix -- -e xxx.age -i <path-to-key>` or `nix run github:ryantm/agenix -- -e xxx.age -i <path-to-key> < file`)

**Installation**
1. Boot minimal installer
2. Set nixos password with `passwd`
3. Connect to network (nmtui for wifi)
4. Run `nix run nixos-anywhere -- --flake .#<hostname> --extra-files /path --generate-hardware-config nixos-generate-config ./hardware-configuration.nix nixos@<ip>`
    1. --extra-files directory should include the new host user's ssh keys (new or existing) including the full destination path: `/home/<username>/.ssh/id_ed25519*`
    2. Move the generated target hardware info file to the host folder and commit
    3. You need to be owner of ~/.ssh on the host machine
5. Clone the nixos conf repo to /etc/nixos/nixconf and rebuild and reboot

## Info
* All hosts read from hosts/base/{global.nix, host.nix}
* All users read from hosts/base/user.nix
* All hosts read from aspects/essential.nix
* Connect BT devices:
  * $ bluetoothctl
  * $ scan on
  * $ pair <id>
  * $ trust <id>
  * $ connect <id>

# Todo
* Perms on .ssh and .ssh/* no work?
* jr-work brightness, volume
