{ lib, den, ... }: {
  # global config for all users
  den.default.includes = [
    den.batteries.hostname
    den.batteries.define-user
    den.batteries.primary-user
    (den.batteries.user-shell "zsh")
    den.aspects.base-user
  ];

  den.schema.user = {
    classes = lib.mkDefault [ "hjem" ];
  };

  den.aspects.base-user = { host, user, ... }: {
    nixos = { config, ... }: {
      users.users.${user.userName} = {
        extraGroups = [
          "video"
          "audio"
          "jackaudio"
        ];

        hashedPasswordFile = config.age.secrets.passwd.path;
      };

      fileSystems."/home/${user.userName}/tmp" = {
        device = "none";
        fsType = "tmpfs";
        options = [ "mode=755" ];
      };

      systemd.tmpfiles.rules = [
        "f /home/${user.userName}/.ssh/id_ed25519 0600 ${user.userName}:users -"
        "f /home/${user.userName}/.ssh/id_ed25519 0644 ${user.userName}:users -"
      ];
    };
  };
}
