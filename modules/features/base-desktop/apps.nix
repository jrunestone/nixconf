{ self, inputs, ... }: {
  flake.nixosModules.desktop-apps = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      self.nixosModules.zsh
      self.nixosModules.niri
      self.nixosModules.firefox
    ];

    environment.systemPackages = with pkgs; [
      spotify
      slack
    ];
  };
}
