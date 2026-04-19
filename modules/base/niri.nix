{ self, inputs, ... }: {
  flake.nixosModules.niri = { config, lib, pkgs, modulesPath, ... }: {
    programs.niri.enable = true;
    environment.systemPackages = [ inputs.niri-scratchpad.packages.${pkgs.stdenv.hostPlatform.system}.default ];
    hjem.users.jr.files.".config/niri/config.kdl".source = ../../cfg/niri/config.kdl;
  };
}
