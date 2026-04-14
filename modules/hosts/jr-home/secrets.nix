{ self, inputs, ... }: {
  flake.nixosModules.secrets = { config, lib, pkgs, modulesPath, ... }: {
    age.secrets = {
      passwd.file = ./creds/passwd.age;
    };
  };
}
