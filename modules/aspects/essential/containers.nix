{ lib, den, ... }: {
  den.aspects.essential.containers.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.podman-compose
    ];

    virtualisation = {
      podman = {
        enable = true;
        autoPrune.enable = true;
        defaultNetwork.settings.dns_enabled = true;
      };

      oci-containers.backend = "podman";

      containers.storage.settings = {
        storage = {
          driver = "overlay";
        };
      };
    };

    hjem.users.${user.userName}.files.".config/containers/storage.conf".source = ../../../cfg/podman/storage.conf;
  };
}
