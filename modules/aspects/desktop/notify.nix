{ lib, den, inputs, ... }: {
  den.aspects.desktop.notify.nixos = { host, user, config, pkgs, lib, ... }: {
    services.dunst.enable = true;
    hjem.users.${user.userName}.files.".config/dunst/dunstrc".source = ../../../cfg/dunst/dunstrc;
  };
}
