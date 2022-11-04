{ inputs,pkgs,home,config, ... }:
{
  # programs.neovim = {
  #   enable = true;
  # };

  # home = {
  #   # ...
  #   packages = with pkgs; [
  #     neovim
  #   ];
  # };

  xdg = {
    enable = true;
    configFile."astronvim/lua/user" = {
      source = ./user;
      recursive = true;
    };
    configFile."nvim" = {
      source = inputs.astronvim.outPath;
      recursive = true;
    };
  };
}
