{ self, inputs, ... }: {
  flake.nixosModules.desktop-apps = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      self.nixosModules.git
      self.nixosModules.zsh
      self.nixosModules.oh-my-posh
      self.nixosModules.ghostty
      self.nixosModules.greetd
      self.nixosModules.mako
      self.nixosModules.niri
      self.nixosModules.zed
      self.nixosModules.firefox
    ];

    environment.systemPackages = with pkgs; [
      spotify
      slack
    ];
  };
}
