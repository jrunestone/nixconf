{ self, inputs, ... }: {
  flake.nixosModules.firefox = { config, lib, pkgs, modulesPath, ... }: {
    programs.firefox = {
      enable = true;
      preferences = {
        "browser.theme.content-theme" = 0;
      };
      policies = {
        DisableAppUpdate = true;
        AutofillCreditCardEnabled = false;
        AutofillAddressEnabled = false;
        # Certificates =
        DefaultDownloadDirectory = "/home/jr/temp";
        GenerativeAI = {
          Enabled = false;
        };
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        PromptForDownloadLocation = true;
        TranslateEnabled = false;
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          };

          "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
          };

          "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
          };

          "{3177265d-43d4-44ff-b923-55357c469a12}" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/tomorrow-night/latest.xpi";
          };
        };
      };
    };
  };
}
