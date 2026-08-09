let
  jr-work = builtins.readFile ../jr-work.pub;
in {
  "passwd.age".publicKeys = [ jr-work ];
  "rootCA-pem.age".publicKeys = [ jr-work ];
  "localhost-pfx.age".publicKeys = [ jr-work ];
}
