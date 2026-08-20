{ lib, den, inputs, ... }: {
  den.aspects.desktop.notes.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [ pkgs.obsidian ];

    hjem.users.${user.userName} = {
      files.".${user.userName}/notes/.obsidian/hotkeys.json".source = ../../../cfg/obsidian/hotkeys.json;
      files.".${user.userName}/notes/.obsidian/appearance.json".source = ../../../cfg/obsidian/appearance.json;
      files.".${user.userName}/notes/.obsidian/community-plugins.json".source = ../../../cfg/obsidian/community-plugins.json;
    };
  };
}
