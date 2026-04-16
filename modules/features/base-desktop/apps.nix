{ self, inputs, ... }: {
  flake.nixosModules.desktop-apps = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      self.nixosModules.git
      self.nixosModules.zsh
      self.nixosModules.kitty
      self.nixosModules.niri
      self.nixosModules.firefox
    ];

    environment.systemPackages = with pkgs; [
      spotify
      slack
    ];
  };
}
