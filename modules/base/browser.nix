{ self, inputs, ... }:
  # zen
  let
    extension = shortId: guid: {
      name = guid;
      value = {
        install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
        installation_mode = "normal_installed";
      };
    };

    prefs = {
      # dark theme
      "browser.theme.content-theme" = 0;
      "browser.tabs.loadInBackground" = true;
      "browser.link.open_newwindow.override.external" = 7;
      "browser.ctrlTab.sortByRecentlyUsed" = true;
      "browser.engagement.ctrlTab.has-used" = true;
      "browser.download.dir" = "/home/jr/tmp";
      "browser.download.folderList" = 2;
      "layout.spellcheckDefault" = 0;
      "zen.tabs.show-newtab-vertical" = false;
      "zen.welcome-screen.seen" = true;
      "zen.theme.gradient.show-custom-colors" = true;
      "zen.view.experimental-no-window-controls" = true;
      "zen.pinned-tab-manager.close-shortcut-behavior" = "close";
    };

    extensions = [
      (extension "ublock-origin" "uBlock0@raymondhill.net")
      (extension "proton-pass" "78272b6fa58f4a1abaac99321d503a20@proton.me")
      (extension "1password-x-password-manager" "{d634138d-c276-4fc8-924b-40a0ea21d284}")
    ];
  in
  {
    flake.nixosModules.browser = { config, lib, pkgs, modulesPath, ... }: {
      environment.systemPackages = [
        (pkgs.wrapFirefox inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped {
            extraPrefs = lib.concatLines (
              lib.mapAttrsToList (
                name: value: ''lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});''
              ) prefs
            );

            extraPolicies = {
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
              ExtensionSettings = builtins.listToAttrs extensions;
            };
          }
        )
      ];
    };
}
