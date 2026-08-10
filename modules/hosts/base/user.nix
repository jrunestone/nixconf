{ lib, den, ... }: {
  # global config for all users
  den.default.includes = [
    den.batteries.hostname
    den.batteries.define-user
    den.batteries.primary-user
    (den.batteries.user-shell "zsh")
  ];

  den.schema.user = {
    classes = lib.mkDefault [ "hjem" ];
  };
}
