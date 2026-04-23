{ self, inputs, ... }: {
  flake.nixosModules.editors = { config, lib, pkgs, modulesPath, ... }: {
    # zed
    environment.systemPackages = [
      pkgs.zed-editor
      pkgs.nixfmt
      pkgs.nil
      pkgs.nixd
    ];

    hjem.users.jr.files.".config/zed/settings.json".source = ../../cfg/zed/settings.json;
    hjem.users.jr.files.".config/zed/keymap.json".source = ../../cfg/zed/keymap.json;
  };
}
