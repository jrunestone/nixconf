{ lib, den, ... }: {
  den.aspects.desktop.greeter.nixos = { host, user, config, pkgs, lib, ... }: {
    services.greetd = {
      enable = true;

      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd niri-session";
          user = "greeter";
        };
      };
    };
  };
}
