{ lib, den, ... }: {
  den.aspects.desktop.greeter.nixos = { host, user, config, pkgs, lib, ... }: {
    services.greetd = {
      enable = true;

      settings = {
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
