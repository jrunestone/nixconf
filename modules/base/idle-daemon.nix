{ self, inputs, ... }: {
  flake.nixosModules.idle-daemon = { config, lib, pkgs, modulesPath, ... }: {
    # swayidle
    environment.systemPackages = [
      pkgs.swayidle
    ];

    hjem.users.jr.files.".config/swayidle/config".source = ../../cfg/swayidle/config;
  };
}
