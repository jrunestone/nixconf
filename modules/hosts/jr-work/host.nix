{ inputs, ... }: {
  den.hosts.x86_64-linux.jr-work = {
    hostName = "jr-work";
    users.jr = {};

    # custom options that can be read in aspects go here
    # https://den.denful.dev/guides/declare-hosts/#freeform-schema
    # https://den.denful.dev/guides/configure-aspects/#provides
  };

  # host-specific config
  den.aspects.jr-work = {
    imports = [
      inputs.nixos-hardware.nixosModules.common-cpu-intel
      inputs.nixos-hardware.nixosModules.common-gpu-intel
      inputs.nixos-hardware.nixosModules.common-pc-ssd
    ];

    nixos = { inputs, config, pkgs, ... }: {
      environment.systemPackages = [ ];
    };
  };
}
