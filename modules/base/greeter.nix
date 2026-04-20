{ self, inputs, ... }: {
  flake.nixosModules.greeter = { config, pkgs, ... }: {
      # greetd/tuigreet
      services.greetd = {
        enable = true;

        settings = {
          initial_session = {
            command = "niri-session";
            user = "jr";
          };

          default_session = {
            command = "${pkgs.tuigreet} --time --remember --remember-session";
            user = "greeter";
          };
        };
      };

      systemd.services.greetd = {
        enable = true;

        serviceConfig = {
          Type = "idle";
          StandardInput = "tty";
          StandardOutput = "tty";
          StandardError = "journal";
          TTYReset = true;
          TTYVHangup = true;
          TTYVTDisallocate = true;
        };
      };
    };
}
