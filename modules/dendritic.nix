{ inputs, ... }:
{
  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.den.flakeModules.dendritic or { })
  ];

  flake-file.inputs = {
    den.url = "github:denful/den";
    flake-file.url = "github:denful/flake-file";
    agenix.url = "github:ryantm/agenix";
    niri-scratchpad.url = "github:argosnothing/niri-scratchpad";
    veila.url = "github:naurissteins/Veila";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
     url = "github:nix-community/disko";
     inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
