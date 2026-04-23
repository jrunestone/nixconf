{ self, inputs, ... }: {
  flake.nixosModules.desktop-apps = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      self.nixosModules.git
      self.nixosModules.greeter
      self.nixosModules.compositor
      self.nixosModules.shell
      self.nixosModules.prompt
      self.nixosModules.terminal
      self.nixosModules.launcher
      self.nixosModules.notifier
      self.nixosModules.screen-locker
      self.nixosModules.idle-daemon
      self.nixosModules.editors
      self.nixosModules.browser
      self.nixosModules.containers
    ];

    environment.systemPackages = with pkgs; [
      spotify
      slack
    ];

    programs.localsend.enable = true;
  };
}
