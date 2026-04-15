{ self, inputs, ... }: {
  flake.nixosModules.git = { config, lib, pkgs, modulesPath, ... }: {
    environment.systemPackages = [ pkgs.gitstatus ];
    programs.git = {
      enable = true;
      # TODO
    };
  };
}
