{ self, inputs, ... }: {
  flake.nixosConfigurations.jr-work = inputs.nixpkgs.lib.nixosSystem {
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
      self.diskoConfigurations.jr-work
      self.nixosModules.hardware
      inputs.hardware.nixosModules.common-cpu-intel
      inputs.hardware.nixosModules.common-gpu-intel
      inputs.hardware.nixosModules.common-pc-ssd

      # shared base system config, apps and user settings
      self.nixosModules.desktop-system
      self.nixosModules.desktop-user

      # host secrets
      self.nixosModules.secrets
    ];

    # user/host setup
    users.users.jr.hashedPasswordFile = config.age.secrets.passwd.path;
    networking.hostName = "jr-work";
    environment.sessionVariables = {
      HOSTNAME = "jr-work";
    };
    users.users.jr.openssh.authorizedKeys.keys = [ (builtins.readFile ../jr-work/cfg/jr-work.pub) ];

    # known hosts
    services.openssh.knownHosts = {

    };

    # certificates
    hjem.users.jr.files.".jr/certs/rootCA.pem".source = config.age.secrets.rootCA-pem.path;
    hjem.users.jr.files.".jr/certs/localhost.pfx".source = config.age.secrets.localhost-pfx.path;

    # extra directories
    systemd.tmpfiles.rules = [

    ];

    # mounts

    # git user
    programs.git.config.user.email = "johan.runsten@toxic.se";

    # audio
    hjem.users.jr.files.".local/state/wireplumber/default-nodes".source = ./cfg/wireplumber/default-nodes;
    hjem.users.jr.files.".local/state/wireplumber/default-routes".source = ./cfg/wireplumber/default-routes;

    # apps
  };
}
