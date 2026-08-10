{ lib, den, inputs, ... }: {
  den.aspects.essential.prompt.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [ pkgs.oh-my-posh ];
    hjem.users.${user.userName}.files.".config/oh-my-posh/jr.omp.json".source = ../../../cfg/oh-my-posh/jr.omp.json;
  };
}
