{ self, inputs, ... }: {
  flake.nixosModules.zsh = { config, lib, pkgs, modulesPath, ... }: {
    programs.zsh = {
      enable = true;

      autosuggestions = {
        enable = true;
        highlightStyle = "fg=#464d57";
      };

      syntaxHighlighting = {
        enable = true;

        styles = {
          command = "fg=#e0e0e0,bold";
          builtin = "fg=#e0e0e0,bold";
          alias = "fg=#e0e0e0,bold";
          function = "fg=#e0e0e0,bold";
          precommand = "fg=#e0e0e0,bold";
          autodirectory = "fg=#b294bb,underline";
          path = "none";
        };
      };

      setOptions = [
        "AUTO_CD"
        "HIST_IGNORE_DUPS"
        "SHARE_HISTORY"
        "HIST_FCNTL_LOCK"
      ];

      shellAliases = {
        l = "eza -lgaa --group-directories-first";
        ls = "eza -lgaa --group-directories-first";
        cat = "bat --plain";

        nixdir = "cd $NIXDIR";
        nixedit = "zeditor $NIXDIR";
        nixbuild = "git -C $NIXDIR add . && nixos-rebuild --flake $NIXDIR/#$HOST --sudo";
        nixupdates = "echo 'Run nix flake update first' && nixbuild build && nix store diff-closures /run/current-system ./result && rm ./result";
        # nixversions = "find /etc/profiles/per-user/jr/bin -type l | xargs readlink -f | cut -d- -f2- | cut -d/ -f1 | sort -u";
        nixgenerations = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
        nixcleanup = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +5; nix-collect-garbage; nix-store --optimise";
      };
    };

    users.defaultUserShell = pkgs.zsh;
    hjem.users.jr.files.".zshrc".source = ../../cfg/zsh/.zshrc;
  };
}
