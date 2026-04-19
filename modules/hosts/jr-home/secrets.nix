{ self, inputs, ... }: {
  flake.nixosModules.secrets = { config, lib, pkgs, modulesPath, ... }: {
    age = {
      identityPaths = [ "/home/jr/.ssh/id_ed25519" ];
      secrets = {
        passwd.file = ./cfg/secrets/passwd.age;
      };
    };
  };
}
