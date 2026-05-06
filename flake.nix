{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    agenix.url = "github:ryantm/agenix";
    niri-scratchpad.url = "github:argosnothing/niri-scratchpad";
    veila.url = "github:naurissteins/Veila";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

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

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree.filterNot (inputs.nixpkgs.lib.hasInfix "cfg") ./modules);
}
