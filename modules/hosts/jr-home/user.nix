{ den, inputs, config, ... }: {
  # host-specific user config
  den.aspects.jr.provides.jr-home = { host, user, ... }: {
    imports = [];

    # custom options that can be read in aspects go here
    # https://den.denful.dev/guides/declare-hosts/#freeform-schema
    # https://den.denful.dev/guides/configure-aspects/#provides

    nixos = { pkgs, config, ... }: {
      imports = [
        inputs.agenix.nixosModules.default
      ];

      users.users.jr.hashedPasswordFile = config.age.secrets.passwd.path;
      hjem.users.jr.files.".jr/certs/rootCA.pem".source = config.age.secrets.rootCA-pem.path;
      hjem.users.jr.files.".jr/certs/localhost.pfx".source = config.age.secrets.localhost-pfx.path;

      fileSystems."/home/jr/tmp" = {
        device = "none";
        fsType = "tmpfs";
        options = [ "mode=755" ];
      };
    };
  };
}
