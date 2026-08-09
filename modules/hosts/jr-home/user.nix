{ den, inputs, ... }: {
  den.aspects.jr.provides.jr-home = { host, user, ... }: {
    imports = [
      inputs.hardware.nixosModules.common-cpu-amd
      inputs.hardware.nixosModules.common-gpu-amd
      inputs.hardware.nixosModules.common-pc-ssd
    ];

    hjem = {

    };

    nixos = { pkgs, ... }: {

    };
  };
}
