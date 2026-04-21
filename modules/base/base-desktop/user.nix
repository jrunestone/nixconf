{ self, inputs, ... }: {
  flake.nixosModules.desktop-user = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
    ];

    # user setup
    users.users.jr = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "video"
        "audio"
        "networkmanager"
        "jackaudio"
      ];
    };

    hjem.clobberByDefault = true;
    hjem.users.jr.files.".jr/avatar.png".source = ../../../assets/jr.png;
    hjem.users.jr.files.".jr/wallpaper.png".source = ../../../assets/wallpaper.png;

    # mounts and directories
    systemd.tmpfiles.rules = [
      "d /home/jr/tmp 0755 jr users -"
      "d /home/jr/src/work 0755 jr users -"
      "d /home/jr/src/home 0755 jr users -"
    ];
  };
}
