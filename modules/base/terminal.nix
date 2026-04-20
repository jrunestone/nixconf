{ self, inputs, ... }: {
  flake.nixosModules.terminal = { config, lib, pkgs, modulesPath, ... }: {
    # ghostty
    environment.systemPackages = [ pkgs.ghostty ];
    hjem.users.jr.files.".config/ghostty/config.ghostty".source = ../../cfg/ghostty/config.ghostty;
  };
}
