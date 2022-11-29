{ lib, pkgs, self, ... }:
{
  services.interception-tools = {
    enable = true;
    udevmonConfig =
      let
        intercept = pkgs.interception-tools;
        plugins = pkgs.interception-tools-plugins;
        dfkConfig = pkgs.writeText "dual-function-keys.yaml" ''
          TIMING:
            TAP_MILLISEC: 200
            DOUBLE_TAP_MILLISEC: 0

          MAPPINGS:
            - KEY: KEY_CAPSLOCK
              TAP: KEY_ESC
              HOLD: KEY_LEFTCTRL
        '';

      in
      ''
        - JOB: ${intercept}/bin/intercept -g $DEVNODE | ${plugins.dual-function-keys}/bin/dual-function-keys -c ${dfkConfig} | ${plugins.caps2esc}/bin/caps2esc | ${intercept}/bin/uinput -d $DEVNODE
          DEVICE:
            EVENTS:
              EV_KEY: [[KEY_CAPSLOCK, KEY_ESC, KEY_LEFTCTRL]]
      '';
    # plugins = [ plugins.caps2esc plugins.dual-function-keys ];
  };
  home-manager.sharedModules = [
    {
      home.keyboard = null;
    }
  ];
}
