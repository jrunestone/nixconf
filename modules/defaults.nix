{ lib, den, ... }:
{
  den.default.nixos.system.stateVersion = "25.11";

  den.aspects.jr = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "zsh")
    ];
  };
}
