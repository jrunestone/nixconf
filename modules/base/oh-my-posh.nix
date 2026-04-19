{ self, inputs, ... }: {
  flake.nixosModules.oh-my-posh = { config, lib, pkgs, modulesPath, ... }: {
    environment.systemPackages = [ pkgs.oh-my-posh ];
    hjem.users.jr.files.".config/oh-my-posh/jr.omp.json".source = ../../cfg/oh-my-posh/jr.omp.json;
  };
}
