{ lib, den, inputs, ... }: {
  den.aspects.desktop.launcher.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      rofi
      rofi-calc
    ];

    hjem.users.${user.userName}.files.".config/rofi/config.rasi".source = ../../../cfg/rofi/config.rasi;
  };
}
