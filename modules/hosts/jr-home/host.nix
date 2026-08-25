{ den, inputs, ... }: {
  den.hosts.x86_64-linux.jr-home = {
    hostName = "jr-home";
    users.jr = {};

    # custom options that can be read in aspects go here
    # https://den.denful.dev/guides/declare-hosts/#freeform-schema
    # https://den.denful.dev/guides/configure-aspects/#provides
  };

  den.aspects.jr-home = {
    includes = [
      den.aspects.desktop
      den.aspects.jr-home.secrets
    ];

    imports = [
      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-gpu-amd
      inputs.nixos-hardware.nixosModules.common-pc-ssd
    ];

    nixos = { inputs, config, pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        moonlight-qt
      ];

      programs.steam.enable = true;

      # fix garbage bars/strips
      boot.kernelParams = [
        "amdgpu.sg_display=0"
        "amdgpu.dcdebugmask=0x10"
      ];

      hjem.users.jr.files.".jr/certs/rootCA.pem".source = config.age.secrets.rootCA-pem.path;
      hjem.users.jr.files.".jr/certs/localhost.pfx".source = config.age.secrets.localhost-pfx.path;
      hjem.users.jr.files.".local/state/wireplumber/default-nodes".source = ./_cfg/wireplumber/default-nodes;
      hjem.users.jr.files.".local/state/wireplumber/default-routes".source = ./_cfg/wireplumber/default-routes;

      services.openssh.knownHosts = {
        homelab = {
          extraHostNames = [ "192.168.8.243" ];
          publicKeyFile = ../jr-homelab/_cfg/jr-homelab.pub;
        };
      };

      systemd.tmpfiles.rules = [
        "d /storage 0755 jr users -"
      ];

      fileSystems."/media/openmediavault" = {
        device = "//openmediavault.local/root";
        fsType = "cifs";
        options = let
          automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
        in
          ["${automount_opts},credentials=${config.age.secrets.omv-smb.path}"];
      };

      users.users.jr.openssh.authorizedKeys.keys = [ (builtins.readFile ../jr-work/_cfg/jr-work.pub) ];
    };
  };
}
