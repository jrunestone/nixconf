{ self, inputs, ... }: {
  flake.nixosConfigurations.jr-home = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.host
    ];
  };

  flake.nixosModules.host = { pkgs, config, ... }: {
    imports = [
      # dependencies
      inputs.agenix.nixosModules.default
      inputs.disko.nixosModules.disko
      inputs.hjem.nixosModules.default

      # hardware configuration
      self.diskoConfigurations.jr-home
      self.nixosModules.hardware

      # shared base system config, apps and user settings
      self.nixosModules.desktop-system
      self.nixosModules.desktop-user

      # host secrets
      self.nixosModules.secrets
    ];

    users.users.jr.hashedPasswordFile = config.age.secrets.passwd.path;
    users.users.jr.openssh.authorizedKeys.keys = [ ../../jr-work/creds/jr-work.pub ];
  };
}
