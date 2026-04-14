{ self, inputs, ... }: {
  flake.nixosModules.firefox = { config, lib, pkgs, modulesPath, ... }: {
    programs.firefox = {
      enable = true;
      policies = {
        DisableAppUpdate = true;
        AutofillCreditCardEnabled = false;
      };
    };
  };
}
