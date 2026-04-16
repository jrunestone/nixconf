{ self, inputs, ... }: {
  flake.nixosModules.zsh = { config, lib, pkgs, modulesPath, ... }: {
    programs.zsh = {
      enable = true;
    };

    users.defaultUserShell = pkgs.zsh;
    hjem.users.jr.files.".config/.zshrc".source = ../../dotfiles/zsh/.zshrc;
  };
}
