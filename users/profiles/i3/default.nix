{ config, lib, ... }:

let
  cfg = config.xsession.windowManager.i3;
in
{
  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";

      fonts = {
        names = [ "DejaVu Sans Mono, FontAwesome6" ];
        style = "Bold Semi-Condensed";
        size = 14.0;
      };

      keybindings = lib.mkOptionDefault {
        # Focus
        "${cfg.config.modifier}+l" = "focus left";
        "${cfg.config.modifier}+j" = "focus down";
        "${cfg.config.modifier}+k" = "focus up";
        "${cfg.config.modifier}+h" = "focus left";

        # Move
        "${cfg.config.modifier}+Shift+l" = "move left";
        "${cfg.config.modifier}+Shift+j" = "move down";
        "${cfg.config.modifier}+Shift+k" = "move up";
        "${cfg.config.modifier}+Shift+h" = "move left";
      };
      terminal = "kitty";
    };
  };
}
