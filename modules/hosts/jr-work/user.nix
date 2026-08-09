{ den, inputs, ... }: {
  den.aspects.jr.provides.jr-work = { host, user, ... }: {
    imports = [
      inputs.hardware.nixosModules.common-cpu-intel
      inputs.hardware.nixosModules.common-gpu-intel
      inputs.hardware.nixosModules.common-pc-ssd
    ];

    hjem = {

    };

    nixos = { pkgs, ... }: {

    };
  };
}
