{ self, inputs, ... }: {
  flake.nixosModules.desktop-user = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
    ];

    users.users.jr = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "video"
        "audio"
        "networkmanager"
        "jackaudio"
      ];
    };
  };
}
