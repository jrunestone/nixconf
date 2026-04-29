{ self, inputs, ... }: {
  flake.nixosModules.browser = { config, lib, pkgs, modulesPath, ... }: {
    # firefox
    programs.firefox = {
      enable = true;
      preferences = {
        # dark theme
        "browser.theme.content-theme" = 0;
        "extensions.activeThemeID" = "{3177265d-43d4-44ff-b923-55357c469a12}";

        # don't switch to link opened in new tab
        "browser.tabs.loadInBackground" = true;

        # open new tab next to the active tab
        "browser.link.open_newwindow.override.external" = 7;

        "browser.download.dir" = "/home/jr/tmp";
        "sidebar.verticalTabs" = true;
      };
      policies = {
        DisableAppUpdate = true;
        AutofillCreditCardEnabled = false;
        AutofillAddressEnabled = false;
        Certificates = {
          Install = [
            "/home/jr/.jr/certs/rootCA.pem"
          ];
        };
        PromptForDownloadLocation = false;
        DefaultDownloadDirectory = "/home/jr/tmp";
        GenerativeAI = {
          Enabled = false;
        };
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
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
