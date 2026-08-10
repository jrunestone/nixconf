{ lib, den, ... }: {
  # global config for all hosts and users
  den.schema.conf = {

  };

  den.default.nixos = { inputs, pkgs, ... }: {
    system.stateVersion = "26.11";
  };
}
