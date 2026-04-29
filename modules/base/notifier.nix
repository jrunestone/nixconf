{ self, inputs, ... }: {
  flake.nixosModules.notifier = { config, lib, pkgs, ... }: {
    # dunst
    services.dunst.enable = true;
    hjem.users.jr.files.".config/dunst/dunstrc".source = ../../cfg/dunst/dunstrc;
  };
}
