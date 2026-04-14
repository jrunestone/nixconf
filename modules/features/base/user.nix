{ self, inputs, ... }: {
  flake.nixosModules.user = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default
    ];

    users.users.jr = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
      shell = pkgs.bash;
      openssh.authorizedKeys.keys = [
        inputs.nixos-secrets.hosts.jr-home.pubkey
      ];
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}
