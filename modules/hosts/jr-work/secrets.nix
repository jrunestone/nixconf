{ inputs, ... }: {
  den.aspects.jr-work.nixos = {
    imports = [ inputs.agenix.nixosModules.default ];

    age = {
      identityPaths = [ "/home/jr/.ssh/id_ed25519" ];

      secrets = {
        git = {
          file = ./_cfg/secrets/git.age;
          owner = "jr";
          group = "users";
        };

        passwd = {
          file = ./_cfg/secrets/passwd.age;
          owner = "jr";
          group = "users";
        };

        rootCA-pem = {
          file = ./_cfg/secrets/rootCA.pem.age;
          owner = "jr";
          group = "users";
        };

        localhost-pfx = {
          file = ./_cfg/secrets/localhost.pfx.age;
          owner = "jr";
          group = "users";
        };
      };
    };
  };
}
