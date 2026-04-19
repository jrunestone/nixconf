{ self, inputs, ... }: {
  flake.nixosModules.zed = { config, lib, pkgs, modulesPath, ... }: {
    environment.systemPackages = [
      pkgs.zed-editor
      pkgs.nixfmt
    ];

    hjem.users.jr.files.".config/zed/settings.json".source = ../../cfg/zed/settings.json;
    hjem.users.jr.files.".config/zed/keymap.json".source = ../../cfg/zed/keymap.json;
  };
}
