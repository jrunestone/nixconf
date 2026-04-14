{ self, inputs, ... }: {
  flake.nixosConfigurations.jr-home = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.host
    ];
  };

  flake.nixosModules.host = { pkgs, ... }: {
    imports = [
      # dependencies
      # inputs.hjem.nixosModules.default
      inputs.disko.nixosModules.disko
      inputs.stylix.nixosModules.stylix

      # hardware configuration
      self.diskoConfigurations.jr-home
      self.nixosModules.hardware

      # shared base system and user settings
      self.nixosModules.system
      self.nixosModules.user

      # apps/services with a bit of config
      self.nixosModules.niri
      self.nixosModules.firefox
    ];

    users.users.jr.hashedPassword = inputs.nixos-secrets.hosts.jr-home.passwd;
    home-manager.users.jr = self.homeModules.user;
  };
}
