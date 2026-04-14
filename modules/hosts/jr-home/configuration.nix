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

      # shared base system and user settings
      self.nixosModules.system
      self.nixosModules.user

      # host secrets
      self.nixosModules.secrets

      # apps/services with a bit of config
      self.nixosModules.niri
      self.nixosModules.zsh
      self.nixosModules.firefox
    ];

    users.users.jr.hashedPasswordFile = config.age.secrets.passwd.path;

    # TODO: remove
    users.users.jr.openssh.authorizedKeys.keys = [ (builtins.readFile ./creds/jr-home.pub) ];
  };
}
