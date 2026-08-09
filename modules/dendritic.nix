{ inputs, ... }:
{
  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.den.flakeModules.dendritic or { })
  ];

  flake-file.inputs = {
    hardware.url = "github:nixos/nixos-hardware";
    den.url = "github:denful/den";
    flake-file.url = "github:denful/flake-file";
    agenix.url = "github:ryantm/agenix";

    disko = {
     url = "github:nix-community/disko";
     inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
