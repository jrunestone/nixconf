{ lib, den, inputs, ... }: {
  den.aspects.desktop.bar.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [ pkgs.ironbar ];

    hjem.users.${user.userName} = {
      files.".config/ironbar/config.corn".source = ../../../cfg/ironbar/config.corn;
      files.".config/ironbar/style.css".source = ../../../cfg/ironbar/style.css;
    };

    systemd.user.services.ironbar = {
      description = "ironbar";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.ironbar}/bin/ironbar --config /home/${user.userName}/.config/ironbar/config.corn";
        Restart = "on-failure";
      };
    };
  };
}
