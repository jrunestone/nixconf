{ self, inputs, ... }: {
  flake.nixosModules.mako = { config, lib, pkgs, modulesPath, ... }: {
    environment.systemPackages = [ pkgs.mako ];
    #hjem.users.jr.files.".config/ghostty/config.ghostty".source = ../../cfg/ghostty/config.ghostty;
  };
}
