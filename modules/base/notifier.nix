{ self, inputs, ... }: {
  flake.nixosModules.notifier = { config, lib, pkgs, modulesPath, ... }: {
    # mako
    environment.systemPackages = [ pkgs.mako ];
    #hjem.users.jr.files.".config/ghostty/config.ghostty".source = ../../cfg/ghostty/config.ghostty;
  };
}
