{ self, inputs, ... }: {
  flake.nixosModules.notes = { config, lib, pkgs, modulesPath, ... }: {
    # obsidian
    environment.systemPackages = [ pkgs.obsidian ];
    hjem.users.jr.files.".jr/notes/.obsidian/hotkeys.json".source = ../../cfg/obsidian/hotkeys.json;
  };
}
