{ self, inputs, ... }: {
  flake.nixosModules.git = { config, pkgs, ... }: {
      environment.systemPackages = [ pkgs.gitstatus ];

      programs.git = {
        enable = true;

        config = {
          alias = {
            logp = "log --pretty='%C(Yellow)%h %C(reset)%ad (%C(Green)%cr%C(reset)) %C(Cyan)%an %C(auto)%d %C(reset)%s' --date=format:'%Y-%m-%d %H:%M' --graph";
            undo = "reset HEAD~1";
            pp = "push origin HEAD";
            pl = "!git pull origin $(git branch --show-current)";
          };

          core.autocrlf = "input";
          core.askPass = "";
          init.defaultBranch = "main";
          credential.helper = "cache --timeout=28800";
          pull.rebase = true;

          url = {
            "git@github.com:" = {
              insteadOf = "https://github.com/";
            };
          };

          user = {
            name = "Johan Runsten";
          };
        };
      };
    };
}
