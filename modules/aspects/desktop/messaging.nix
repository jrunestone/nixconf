{ lib, den, inputs, ... }: {
  den.aspects.desktop.messaging.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [
      (pkgs.slack.overrideAttrs (oldAttrs: {
        desktopItems = [
          (pkgs.makeDesktopItem {
            name = "slack";
            # fixes opening links in Zen running in X11 mode
            exec = "env DISPLAY=wayland-1 slack %U";
            icon = "slack";
            desktopName = "Slack";
            genericName = "Messaging Client";
            categories = [ "Network" "InstantMessaging" "Chat" ];
            mimeTypes = [ "x-scheme-handler/slack" ];
          })
        ];
      }))
    ];
  };
}
