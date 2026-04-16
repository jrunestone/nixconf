{ self, inputs, ... }: {
  flake.nixosModules.kitty = { config, lib, pkgs, modulesPath, ... }: {
    environment.systemPackages = [ pkgs.kitty ];
    hjem.users.jr.files.".config/kitty/kitty.conf".source = ../../dotfiles/kitty/kitty.conf;
  };
}
