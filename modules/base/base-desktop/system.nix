{ self, inputs, ... }: {
  flake.nixosModules.desktop-system = { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      self.nixosModules.desktop-apps
    ];

    system.stateVersion = "25.11";

    # system utilities without config
    environment.systemPackages = with pkgs; [
      zip
      unzip
      unar
      tree
      just
      ripgrep
      killall
      playerctl
      satty
      bat
      eza
      vim
      simp1e-cursors
      swaybg
      libnotify
      wl-clipboard
  	  xwayland-satellite
  	  xdg-desktop-portal-gtk
  	  nautilus
    ];

    time.timeZone = "Europe/Stockholm";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "sv-latin1";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "sv_SE.UTF-8";
      LC_IDENTIFICATION = "sv_SE.UTF-8";
      LC_MEASUREMENT = "sv_SE.UTF-8";
      LC_MONETARY = "sv_SE.UTF-8";
      LC_NAME = "sv_SE.UTF-8";
      LC_NUMERIC = "sv_SE.UTF-8";
      LC_PAPER = "sv_SE.UTF-8";
      LC_TELEPHONE = "sv_SE.UTF-8";
      LC_TIME = "sv_SE.UTF-8";
    };

    boot.initrd.systemd.enable = true;
    boot.loader.grub = {
      efiSupport = true;
      efiInstallAsRemovable = true;
    };

    security.sudo.extraConfig = ''
      Defaults lecture = never
    '';

    # nix settings
    nix = {
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
        trusted-users = [ "root" "@wheel" ];
        warn-dirty = false;
        auto-optimise-store = true;
      };

      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than +5";
      };

      optimise = {
        automatic = true;
      };
    };

    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };

    # misc system programs/services

    programs.nix-ld.enable = true;
    services.fwupd.enable = true;
    services.playerctld.enable = true;

    # security/policies
    services.gnome.gnome-keyring.enable = true;
    environment.variables.XDG_RUNTIME_DIR = "/run/user/$UID";
    security.polkit.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;

    # number of open files
    security.pam.loginLimits = [{
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "1048576";
    }];

    boot.kernel.sysctl = {
      "fs.file-max" = 1048576;
      "fs.inotify.max_queued_events" = 1048576;
      "fs.inotify.max_user_instances" = 1048576;
      "fs.inotify.max_user_watches" = 1048576;
    };

    systemd.settings.Manager = {
      DefaultLimitNOFILE = 1048576;
      DefaultLimitMEMLOCK = "infinity";
      DefaultTimeoutStopSec = "10s";
    };

    systemd.user.extraConfig = ''
      DefaultLimitNOFILE=1048576
      DefaultLimitMEMLOCK=infinity
      DefaultTimeoutStopSec=10s
    '';

    # portals/ui etc
    services.dbus.enable = true;
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
      pkgs.gnome-keyring
    ];

    programs.dconf.enable = true;
    programs.dconf.profiles.user.databases = [
      {
        lockAll = true;
        settings = {
          "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        };
      }
    ];

    # fonts
    fonts = {
        packages = [
          pkgs.nerd-fonts.fira-code
          pkgs.nerd-fonts.fira-mono
          pkgs.nerd-fonts.caskaydia-cove
          pkgs.nerd-fonts.caskaydia-mono
        ];

        fontDir.enable = true;
        fontconfig.enable = true;
    };

    # graphics
    services.hardware.openrgb.enable = true;
    hardware = {
      graphics.enable = true;
      graphics.enable32Bit = true;
      opentabletdriver.enable = true;
      enableRedistributableFirmware = true;
    };

    # sound
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

    # printing
    # manage the printer from cups at localhost:631
    services.printing.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # ssh
    services.openssh = {
      enable = true;
      knownHosts = {
        "github.com" = {
          publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
        };
      };
    };

    systemd.tmpfiles.rules = [
      "f /home/jr/.ssh/id_ed25519 0600 jr:users -"
      "f /home/jr/.ssh/id_ed25519 0644 jr:users -"
    ];

    # networking
    networking.networkmanager.enable = true;

    # environment variables
    environment.sessionVariables = {
      NIXDIR = "/etc/nixos/nixconf";
    };
  };
}
