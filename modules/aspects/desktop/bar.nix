{ lib, den, inputs, ... }: {
  den.aspects.desktop.bar.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [ pkgs.ironbar ];
    environment.sessionVariables.IRONBAR_CONFIG = "$HOME/.config/ironbar/config.corn";

    hjem.users.${user.userName} = {
      files.".config/ironbar/config.corn".source = ../../../cfg/ironbar/config.corn;
      files.".config/ironbar/style.css".source = ../../../cfg/ironbar/style.css;
    };
  };
}
