{ lib, den, inputs, ... }: {
  den.aspects.desktop.idle.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.swayidle
    ];

    hjem.users.${user.userName}.files.".config/swayidle/config".source = ../../../cfg/swayidle/config;
  };
}
