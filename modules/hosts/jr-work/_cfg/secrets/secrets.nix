let
  jr-work = builtins.readFile ../jr-work.pub;
in {
  "git.age".publicKeys = [ jr-work ];
  "passwd.age".publicKeys = [ jr-work ];
  "rootCA.pem.age".publicKeys = [ jr-work ];
  "localhost.pfx.age".publicKeys = [ jr-work ];
}
