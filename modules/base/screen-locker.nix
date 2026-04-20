{ self, inputs, ... }: {
  flake.nixosModules.screen-locker = { config, lib, pkgs, modulesPath, ... }: {
    # veila
    imports = [
      inputs.veila.nixosModules.default
    ];

    programs.veila.enable = true;
    hjem.users.jr.files.".config/veila/config.toml".source = ../../cfg/veila/config.toml;
  };
}
