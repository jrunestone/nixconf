{ self, inputs, ... }: {
  flake.nixosModules.secrets = { config, lib, pkgs, modulesPath, ... }: {
    age.secrets = {
      identityPaths = [ "~/.ssh/id_ed25519" ];
      passwd.file = ./creds/passwd.age;
    };
  };
}
