{ lib, den, inputs, ... }: {
  den.aspects.desktop.terminal.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [ pkgs.ghostty ];
    hjem.users.${user.userName}.files.".config/ghostty/config.ghostty".source = ../../../cfg/ghostty/config.ghostty;
  };
}
