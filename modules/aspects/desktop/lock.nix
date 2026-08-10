{ lib, den, inputs, ... }: {
  den.aspects.desktop.lock.nixos = { host, user, config, pkgs, lib, ... }: {
    imports = [
      inputs.veila.nixosModules.default
    ];

    programs.veila = {
      enable = true;
      service.enable = true;
      idle.enable = false;
    };

    hjem.users.${user.userName}.files.".config/veila/config.toml".source = ../../../cfg/veila/config.toml;
  };
}
