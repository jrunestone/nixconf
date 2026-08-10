{ lib, den, inputs, ... }: {
  den.aspects.desktop.launcher.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.rofi
    ];

    hjem.users.${user.userName}.files.".config/rofi/config.rasi".source = ../../../cfg/rofi/config.rasi;
  };
}
