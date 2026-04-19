let
  jr-home = builtins.readFile ./jr-home.pub;
in {
  "passwd.age".publicKeys = [ jr-home ];
}
