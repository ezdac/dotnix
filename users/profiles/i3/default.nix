{ lib, ... }:

let
  mod = "Mod4";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      fonts = {
        names = [ "DejaVu Sans Mono, FontAwesome6" ];
        style = "Bold Semi-Condensed";
        size = 14.0;
      };

      keybindings = lib.mkOptionDefault {
        # Focus
        "${mod}+l" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+h" = "focus left";

        # Move
        "${mod}+Shift+l" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+h" = "move left";
      };
      terminal = "kitty";
    };
  };
}
