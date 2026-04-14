{ self, inputs, ... }: {
  flake.homeModules.user = { pkgs, ... }: {
    # programs.bash.enable = true;

    home.packages = [ pkgs.hello ];
    home.stateVersion = "25.11";
  };
}
