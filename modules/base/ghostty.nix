{ self, inputs, ... }: {
  flake.nixosModules.ghostty = { config, lib, pkgs, modulesPath, ... }: {
    environment.systemPackages = [ pkgs.ghostty ];
    hjem.users.jr.files.".config/ghostty/config.ghostty".source = ../../cfg/ghostty/config.ghostty;
  };
}
