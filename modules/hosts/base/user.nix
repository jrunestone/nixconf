{ lib, den, ... }:
{
  den.default.includes = [
    den.batteries.define-user
    den.batteries.primary-user
    (den.batteries.user-shell "zsh")
  ];

  den.schema.user.classes = lib.mkDefault [ "hjem" ];
  den.schema.host.hjem.enable = true;
}
