{ self, inputs, ... }: {
  flake.nixosModules.launcher = { config, lib, pkgs, modulesPath, ... }: {
    # rofi
    environment.systemPackages = [
      pkgs.rofi
    ];

    hjem.users.jr.files.".config/rofi/config.rasi".source = ../../cfg/rofi/config.rasi;
  };
}
