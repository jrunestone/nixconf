# NixOS configuration
## Install
### With nixos-anywhere
Prerequisites for target machine:
1. Keys, certs and password generated in the secrets repo.
2. Static IP in DHCP and has SSH server running.
3. Must have host machine SSH key in authorized_keys.

3. Run `nix run nixos-anywhere -- --flake .#<hostname> --extra-files /path --generate-hardware-config nixos-generate-config ./hardware-configuration.nix root@<ip>`
  4. Can skip hardware stuff if a file already exists
  5. --extra-files directory should include a /home/<username>/<keypair>
  7. If new host: copy the hardware info file and git push.
6. SSH into machine and clone the nixos conf repo.
7. Run nixos-rebuild switch --flake <flake> --sudo.


### With NixOS installer
Prerequisites for target machine:
1. Keys, certs and password generated in the secrets repo.
2. SSH keys must be trusted by GitHub.

1. Boot installer ISO and exit into terminal as `sudo su`.
2. Clone config repo to somewhere appropriate like `/etc/nixos`.
3. Run disko to format disk(s): `nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./nixos-config/modules/hosts/<host>/disko-config.nix`.
4. If new host: create hardware info: `nixos-generate-config --no-filesystems` and copy to repo and git add.
5. Copy over SSH keys to `/etc/ssh` (chmod 0600) and add to SSH agent to be able to authenticate with GitHub (for secrets repo).
6. Install NixOS: `nixos-install --no-root-passwd --flake /etc/nixos/nixos-config#<host>`.
7. `reboot`

## Wrapped modules
* To build only a wrapped module: `nix build .#moduleName`.
* To run a module as a stand alone package. `nix run .#moduleName`.
