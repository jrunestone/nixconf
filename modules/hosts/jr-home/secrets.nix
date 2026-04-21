{ self, inputs, ... }: {
  flake.nixosModules.secrets = { config, lib, pkgs, modulesPath, ... }: {
    age = {
      identityPaths = [ "/home/jr/.ssh/id_ed25519" ];
      secrets = {
        passwd = {
          file = ./cfg/secrets/passwd.age;
          owner = "jr";
          group = "users";
        };

        rootCA-pem = {
          file = ./cfg/secrets/rootCA.pem.age;
          owner = "jr";
          group = "users";
        };

        localhost-pfx = {
          file = ./cfg/secrets/localhost.pfx.age;
          owner = "jr";
          group = "users";
        };
      };
    };
  };
}
