{ inputs, lib, den, ... }: {
  den.aspects.desktop.compositor.nixos = { host, user, config, pkgs, lib, ... }: {
    programs.niri.enable = true;
    environment.systemPackages = [ inputs.niri-scratchpad.packages.${pkgs.stdenv.hostPlatform.system}.default ];

    hjem.users.${user.userName} = {
      files.".config/niri/config.kdl".source = ../../../cfg/niri/config.kdl;
      files.".config/niri/layout-75-25.sh".source = ../../../cfg/niri/layout-75-25.sh;
    };
  };
}
