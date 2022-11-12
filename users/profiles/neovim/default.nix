{ inputs, pkgs, home, config, ... }:
{
  # programs.neovim = {
  #   enable = true;
  # };

  home = {
    # ...
    packages = with pkgs; [
      neovim # in overlays/overrides.nix, thus pulled from "latest" (nixpks-unstable)
      gcc
    ];
  };

  # for now, we have to use dotfile configuration
  # instead of configuring it via home-manager
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
