{ self, inputs, ... }: {
  flake.nixosModules.editors = { config, lib, pkgs, modulesPath, ... }: {
    # vim
    programs.vim.enable = true;
    programs.vim.defaultEditor = true;

    # zed
    environment.systemPackages = [
      pkgs.zed-editor
      pkgs.nixfmt
      pkgs.nil
      pkgs.nixd
    ];

    hjem.users.jr.files.".config/zed/settings.json".source = ../../cfg/zed/settings.json;
    hjem.users.jr.files.".config/zed/keymap.json".source = ../../cfg/zed/keymap.json;

    # vscode
    nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

    programs.vscode = {
      enable = true;

      extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
        ms-vscode-remote.remote-containers
        mustafamohamad.min-tomorrow-theme
      ];
    };

    hjem.users.jr.files.".config/Code/User/settings.json".source = ../../cfg/vscode/settings.json;
    hjem.users.jr.files.".config/Code/User/keybindings.json".source = ../../cfg/vscode/keybindings.json;
  };
}
