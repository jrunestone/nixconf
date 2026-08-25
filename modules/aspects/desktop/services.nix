{ lib, den, inputs, ... }: {
  den.aspects.desktop.services.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      swaybg
      wl-clip-persist
    ];

    systemd.user.services.wl-clip-persist = {
      description = "wl-clip-persist";
      wantedBy = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard regular";
        Restart = "on-failure";
      };
    };

    systemd.user.services.swaybg = {
      description = "swaybg";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.swaybg}/bin/swaybg --image /home/${user.userName}/.${user.userName}/wallpaper.png";
        Restart = "on-failure";
      };
    };
  };
}
