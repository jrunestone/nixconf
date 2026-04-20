{ self, inputs, ... }: {
  flake.nixosModules.prompt = { config, lib, pkgs, modulesPath, ... }: {
    # oh my posh
    environment.systemPackages = [ pkgs.oh-my-posh ];
    hjem.users.jr.files.".config/oh-my-posh/jr.omp.json".source = ../../cfg/oh-my-posh/jr.omp.json;
  };
}
