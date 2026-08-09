{
  den.hosts.x86_64-linux.jr-home.users.jr = {};

  den.aspects.jr-home = {
    nixos = { pkgs, ... }:
      {
        environment.systemPackages = [ ];
      };
  };
}
