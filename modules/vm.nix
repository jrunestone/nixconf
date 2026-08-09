# `nix run .#vm` (specify host config below)
{ inputs, den, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
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
