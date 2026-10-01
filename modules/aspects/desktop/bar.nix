{ lib, den, inputs, ... }: {
  den.aspects.desktop.bar.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [ pkgs.ironbar ];

    hjem.users.${user.userName} = {
      files.".config/ironbar/style.css".source = ../../../cfg/ironbar/style.css;

      files.".config/ironbar/config.json".text =
        let
          userConfigPath = ../../hosts + "/${host.hostName}/_cfg/ironbar/config.json";
          baseConfig = builtins.fromJSON (builtins.readFile ../../../cfg/ironbar/config.json);
          userConfig =
            if builtins.pathExists userConfigPath
            then builtins.fromJSON (builtins.readFile userConfigPath)
            else {};
          finalConfig = lib.recursiveUpdate baseConfig userConfig;
        in
          builtins.toJSON finalConfig;
    };

    systemd.user.services.ironbar = {
      description = "ironbar";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.ironbar}/bin/ironbar --config /home/${user.userName}/.config/ironbar/config.json";
        Restart = "on-failure";
      };
    };
  };
}
