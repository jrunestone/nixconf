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
      inputs.hardware.nixosModules.common-cpu-amd
      inputs.hardware.nixosModules.common-gpu-amd
      inputs.hardware.nixosModules.common-pc-ssd

      # shared base system config, apps and user settings
      self.nixosModules.desktop-system
      self.nixosModules.desktop-user

      # host secrets
      self.nixosModules.secrets
    ];

    # user/host setup
    users.users.jr.hashedPasswordFile = config.age.secrets.passwd.path;
    users.users.jr.openssh.authorizedKeys.keys = [ (builtins.readFile ../jr-work/cfg/jr-work.pub) ];
    environment.sessionVariables = {
      HOSTNAME = "jr-home";
    };
    networking.hostName = "jr-home";

    # mounts
    systemd.tmpfiles.rules = [
      "d /storage 0755 jr users -"
    ];

    # git user
    programs.git.config.user.email = "johan85@hotmail.com";

    # audio
    hjem.users.jr.files.".local/state/wireplumber/default-nodes".source = ./cfg/wireplumber/default-nodes;
    hjem.users.jr.files.".local/state/wireplumber/default-routes".source = ./cfg/wireplumber/default-routes;
  };
}
