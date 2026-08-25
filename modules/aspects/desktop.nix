{ den, lib, ... }: {
  den.aspects.desktop = {
    includes = [
      den.aspects.desktop.desktop-user
      den.aspects.desktop.bar
      den.aspects.desktop.browser
      den.aspects.desktop.compositor
      den.aspects.desktop.editors
      den.aspects.desktop.greeter
      den.aspects.desktop.idle
      den.aspects.desktop.launcher
      den.aspects.desktop.lock
      den.aspects.desktop.notes
      den.aspects.desktop.notify
      den.aspects.desktop.terminal
      den.aspects.desktop.services
    ];

    nixos = { host, pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        slurp
        grim
        satty
        playerctl
        simp1e-cursors
        libnotify
    	  xwayland-satellite
    	  xdg-desktop-portal-gtk
    	  nautilus
        spotify
        slack
        bruno
        setxkbmap
      ];

      services.playerctld.enable = true;
      programs.localsend.enable = true;

      xdg.portal = {
        enable = true;
        extraPortals = [
          pkgs.xdg-desktop-portal-gtk
          pkgs.xdg-desktop-portal-gnome
          pkgs.gnome-keyring
        ];
        config.common.default = [ "gtk" ];
      };

      programs.dconf.profiles.user.databases = [
        {
          lockAll = true;
          settings = {
            "org/gnome/desktop/interface".color-scheme = "prefer-dark";
          };
        }
      ];

      services.hardware.openrgb.enable = true;
      hardware = {
        graphics.enable = true;
        graphics.enable32Bit = true;
        enableRedistributableFirmware = true;
      };

      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
        socketActivation = true;
      };

      # manage the printer from cups at localhost:631
      services.printing.enable = true;
      services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
