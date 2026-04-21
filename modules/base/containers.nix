{ self, inputs, ... }: {
  flake.nixosModules.containers = { config, lib, pkgs, modulesPath, ... }: {
    # podman
    environment.systemPackages = [
      pkgs.podman-compose
    ];

    virtualisation = {
      podman = {
        enable = true;
        autoPrune.enable = true;
        defaultNetwork.settings.dns_enabled = true;
      };

      containers.storage.settings = {
        storage = {
          driver = "overlay";
        };
      };
    };

    hjem.users.jr.files.".config/containers/storage.conf".source = ../../cfg/podman/storage.conf;
  };
}
