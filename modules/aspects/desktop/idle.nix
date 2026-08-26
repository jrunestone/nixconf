{ lib, den, inputs, ... }: {
  den.aspects.desktop.idle.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.swayidle
    ];

    hjem.users.${user.userName}.files.".config/swayidle/config".source = ../../../cfg/swayidle/config;

    systemd.user.services.swayidle = {
      description = "swayidle";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];

      serviceConfig = {
        ExecStart = "${pkgs.swayidle}/bin/swayidle -w -C /home/${user.userName}/.config/swayidle/config";
        Restart = "on-failure";
      };
    };
  };
}
