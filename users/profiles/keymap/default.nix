{ pkgs, config, ... }:
{
  config.services.ctrlremap = {
    enable = true;
    keyboard = "Test Keyboard 1";
  };
}
