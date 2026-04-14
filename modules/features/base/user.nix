{ self, inputs, ... }: {
  flake.nixosModules.user = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
    ];

    users.users.jr = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
      shell = pkgs.zsh;
    };
  };
}
