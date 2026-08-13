{ lib, den, ... }: {
  # global config for all hosts
  den.default.includes = [
    den.aspects.essential
  ];

  den.schema.host = {
    hjem.enable = true;
  };

  den.default.nixos = { pkgs, ... }: {
    system.stateVersion = "26.11";

    time.timeZone = "Europe/Stockholm";
    console.keyMap = "sv-latin1";

    i18n = {
      defaultLocale = "en_US.UTF-8";

      extraLocaleSettings = {
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

      inputMethod = {
        enable = true;
        type = "fcitx5";
      };
    };

    boot.initrd.systemd.enable = true;
    boot.loader.grub = {
      efiSupport = true;
      efiInstallAsRemovable = true;
    };

    security.sudo.extraConfig = ''
      Defaults lecture = never
    '';

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

    networking.networkmanager.enable = true;
    programs.nix-ld.enable = true;
    services.fwupd.enable = true;
    services.gnome.gnome-keyring.enable = true;
    services.dbus.enable = true;
    programs.dconf.enable = true;
    security.polkit.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
    security.pam.services.login.enableGnomeKeyring = true;
    environment.variables.XDG_RUNTIME_DIR = "/run/user/$UID";
    environment.sessionVariables.NIXDIR = "/etc/nixos/nixconf";

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

    services.openssh = {
      enable = true;
      knownHosts = {
        "github.com" = {
          publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
        };
      };
    };
  };
}
