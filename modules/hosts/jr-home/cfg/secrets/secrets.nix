let
  jr-home = builtins.readFile ../jr-home.pub;
in {
  "passwd.age".publicKeys = [ jr-home ];
  "rootCA-pem.age".publicKeys = [ jr-home ];
  "localhost-pfx.age".publicKeys = [ jr-home ];
  "omv-smb.age".publicKeys = [ jr-home ];
}
