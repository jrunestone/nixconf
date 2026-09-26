{ lib, den, inputs, ... }: {
  den.aspects.desktop.editors.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.zed-editor
      pkgs.nixfmt
      pkgs.nil
      pkgs.nixd
    ];

    nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

    programs.vscode = {
      enable = true;

      extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
        ms-vscode-remote.remote-containers
        mustafamohamad.min-tomorrow-theme
        dnegstad.devcontainer-dev-certs-host
      ];
    };

    hjem.users.${user.userName} = {
      files.".config/zed/settings.json".source = ../../../cfg/zed/settings.json;
      files.".config/zed/keymap.json".source = ../../../cfg/zed/keymap.json;
      files.".config/Code/User/settings.json".source = ../../../cfg/vscode/settings.json;
      files.".config/Code/User/keybindings.json".source = ../../../cfg/vscode/keybindings.json;
    };
  };
}
