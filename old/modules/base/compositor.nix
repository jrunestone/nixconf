{ self, inputs, ... }: {
  flake.nixosModules.compositor = { config, lib, pkgs, modulesPath, ... }: {
    # niri
    programs.niri.enable = true;
    environment.systemPackages = [ inputs.niri-scratchpad.packages.${pkgs.stdenv.hostPlatform.system}.default ];

    hjem.users.jr.files.".config/niri/config.kdl".source = ../../cfg/niri/config.kdl;
    hjem.users.jr.files.".config/niri/layout-75-25.sh".source = ../../cfg/niri/layout-75-25.sh;
  };
}
