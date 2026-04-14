{ self, inputs, ... }: {
  flake.nixosModules.niri = { config, lib, pkgs, modulesPath, ... }: {
    programs.niri.enable = true;
    hjem.users.jr.xdg.config.files.".config/niri/config.kdl".source = ../../dotfiles/niri/niri.kdl;
  };
}
