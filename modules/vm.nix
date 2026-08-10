# `nix run .#vm` (specify host config below)
{ inputs, den, ... }: {
  # todo: doesnt work with agenix because ssh key is not copied over so autlogin
  den.aspects.jr-work.includes = [ (den.batteries.tty-autologin "jr") ];

  perSystem = { pkgs, ... }: {
    packages.vm = pkgs.writeShellApplication {
      name = "vm";
      text =
        let
          host = inputs.self.nixosConfigurations.jr-work.config;
        in
        ''
          ${host.system.build.vm}/bin/run-${host.networking.hostName}-vm "$@"
        '';
    };
  };
}
