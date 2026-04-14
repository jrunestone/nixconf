{ self, inputs, ... }: {
  flake.nixosModules.zsh = { config, lib, pkgs, modulesPath, ... }: {
    programs.zsh.enable = true;
    # hjem.users.jr.xdg.config.files.".config/zsh/.zshrc".source = ../../dotfiles/zsh/.zshrc;
  };
}
