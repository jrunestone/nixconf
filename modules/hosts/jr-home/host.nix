{ inputs, ... }: {
  den.hosts.x86_64-linux.jr-home = {
    hostName = "jr-home";
    users.jr = {};

    # custom options that can be read in aspects go here
    # https://den.denful.dev/guides/declare-hosts/#freeform-schema
    # https://den.denful.dev/guides/configure-aspects/#provides
  };

  # host-specific config
  den.aspects.jr-home = {
    imports = [
      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-gpu-amd
      inputs.nixos-hardware.nixosModules.common-pc-ssd
    ];

    nixos = { inputs, pkgs, ... }: {
      environment.systemPackages = [ ];
    };
  };
}
