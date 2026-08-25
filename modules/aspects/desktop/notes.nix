{ lib, den, inputs, ... }: {
  den.aspects.desktop.notes.nixos = { host, user, config, pkgs, lib, ... }: {
    environment.systemPackages = [ pkgs.obsidian ];
    # install git and config sync addons and sync settings from there
  };
}
