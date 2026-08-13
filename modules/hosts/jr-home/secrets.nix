{ inputs, ... }: {
  den.aspects.jr-home.secrets.nixos = { host, user, lib }: {
    imports = [ inputs.agenix.nixosModules.default ];

    age = {
      identityPaths = [ "/home/${user.userName}/.ssh/id_ed25519" ];

      secrets = {
        git = {
          file = ./_cfg/secrets/git.age;
          owner = user.userName;
          group = "users";
        };

        passwd = {
          file = ./_cfg/secrets/passwd.age;
          owner = user.userName;
          group = "users";
        };

        rootCA-pem = {
          file = ./_cfg/secrets/rootCA.pem.age;
          owner = user.userName;
          group = "users";
        };

        localhost-pfx = {
          file = ./_cfg/secrets/localhost.pfx.age;
          owner = user.userName;
          group = "users";
        };

        omv-smb = {
          file = ./_cfg/secrets/omv-smb.age;
          owner = user.userName;
          group = "users";
        };
      };
    };
  };
}
