{ lib, den, ... }: {
  den.aspects.desktop.desktop-user.nixos = { host, user, config, ... }: {
    hjem.clobberByDefault = true;
    hjem.users.${user.userName}.files = {
      ".${user.userName}/avatar.png".source = ../../../assets/${user.userName}.png;
      ".${user.userName}/wallpaper.png".source = ../../../assets/wallpaper.png;
    };

    systemd.tmpfiles.rules = [
      "d /home/${user.userName}/.${user.userName} 0755 ${user.userName} users -"
      "d /home/${user.userName}/.${user.userName}/notes 0755 ${user.userName} users -"
      "d /home/${user.userName}/.${user.userName}/src/work 0755 ${user.userName} users -"
      "d /home/${user.userName}/.${user.userName}/src/home 0755 ${user.userName} users -"
    ];
  };
}
