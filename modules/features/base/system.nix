{ self, inputs, ... }: {
  flake.nixosModules.system = { config, lib, pkgs, modulesPath, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.11";

    boot.loader.grub = {
      efiSupport = true;
      efiInstallAsRemovable = true;
    };

    services.openssh.enable = true;
  };
}
