{ self, inputs, ... }: {
  flake.nixosModules.notifier = { config, lib, pkgs, ... }: {
    # dunst
    services.dunst = {
      enable = true;

      settings = {
        global = {
          width = 600;
          height = 300;
          frame_width = 0;
          padding = 24;
          horizontal_padding = 24;
          line_height = 0;
          font = "FiraCode Nerd Font 16";
          format = "<b><span color='#F0C674' size='18pt'>%a</span></b>\n%s";
          follow = "mouse";
          corner_radius = 7;
          icon_corner_radius = 3;
          show_indicators = false;
          pause_on_mouse_over = true;
          timeout = 10;
        };

        urgency_normal = {
          background = "#17181a";
          foreground = "#bec1bf";
          highlight = "#F0C674";
        };

        urgency_low = {
          background = "#17181a";
          foreground = "#bec1bf";
          highlight = "#F0C674";
        };

        urgency_critical = {
          background = "#17181a";
          foreground = "#bec1bf";
          highlight = "#F0C674";
          timeout = 0;
        };
      };
    };
  };
}
