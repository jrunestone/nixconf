{ lib, den, inputs, ... }: {
  den.aspects.desktop.notes.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [ pkgs.obsidian ];

    hjem.users.${user.userName} = {
      files.".${user.userName}/notes/.obsidian/hotkeys.json".source = ../../../cfg/obsidian/hotkeys.json;
    };
  };
}
