{ den, inputs, lib, ... }: {
  den.aspects.essential = {
    includes = [
      den.aspects.essential.git
      den.aspects.essential.containers
      den.aspects.essential.shell
      den.aspects.essential.prompt
    ];

    nixos = { host, pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        zip
        unzip
        unar
        tree
        jq
        ripgrep
        bat
        eza
        wl-clipboard
        yazi
      ];

      programs.vim.enable = true;
      programs.vim.defaultEditor = true;
    };
  };
}
