{
  den.hosts.x86_64-linux.jr-work.users.jr = {};

  den.aspects.jr-work = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [ ];
      };
  };
}
