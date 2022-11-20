{ pkgs, config, lib, ... }:
with lib;

let
  plugins = pkgs.interception-tools-plugins;
  cfg = config.services.ctrlremap;
  dfkConfig = pkgs.writeText "dual-function-keys.yaml" ''
    MAPPINGS:
      - KEY: KEY_CAPSLOCK
        TAP: KEY_ESC
        HOLD: KEY_LEFTCTRL
  '';
in
{
  options.services.ctrlremap = {
    enable = mkEnableOption "ctrlremap";
    keyboard = mkOption {
      type = types.str;
      default = "";
      example = "Keyboard 1";
      description = "The udevmon keyboard name to be used for remapping";
    };
  };
  config = mkIf cfg.enable {
    home.packages = [
      pkgs.interception-tools
      pkgs.interception-tools-plugins
    ];
  };

  config.services.interception-tools = mkDefault {
    enable = true;
    udevmonConfig = ''
      - JOB: "intercept -g $DEVNODE | dual-function-keys -c ${dfkConfig} | uinput -d $DEVNODE"
        DEVICE:
          NAME: "${cfg.keyboard}"
          EVENTS:
            EV_KEY: [[KEY_CAPSLOCK, KEY_ESC, KEY_LEFTCTRL]]
    '';
    plugins = [ plugins.caps2esc plugins.dual-function-keys ];
  };
}
