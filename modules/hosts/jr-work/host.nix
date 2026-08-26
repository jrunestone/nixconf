{ den, inputs, ... }: {
  den.hosts.x86_64-linux.jr-work = {
    hostName = "jr-work";
    users.jr = {};

    # custom options that can be read in aspects go here
    # https://den.denful.dev/guides/declare-hosts/#freeform-schema
    # https://den.denful.dev/guides/configure-aspects/#provides
  };

  den.aspects.jr-work = {
    includes = [
      den.aspects.desktop
      den.aspects.jr-work.secrets
    ];

    nixos = { config, pkgs, ... }: {
      imports = [
        inputs.nixos-hardware.nixosModules.common-cpu-intel
        inputs.nixos-hardware.nixosModules.common-gpu-intel
        inputs.nixos-hardware.nixosModules.common-pc-ssd
      ];

      environment.systemPackages = with pkgs; [

      ];

      hardware.bluetooth.enable = true;
      hardware.bluetooth.powerOnBoot = true;

      hjem.users.jr.files.".jr/certs/rootCA.pem".source = config.age.secrets.rootCA-pem.path;
      hjem.users.jr.files.".jr/certs/localhost.pfx".source = config.age.secrets.localhost-pfx.path;

      users.users.jr.openssh.authorizedKeys.keys = [ (builtins.readFile ../jr-home/_cfg/jr-home.pub) ];
    };
  };
}
