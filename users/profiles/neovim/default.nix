{ inputs,pkgs,home,config, ... }:
{
  # programs.neovim = {
  #   enable = true;
  # };

  home = {
    # ...
    packages = with pkgs; [
      # this is included in the overlays/overrides.nix
      # and thus will be pulled from the "latest" channel (nixpks-unstable)
      neovim 
    ];
  };

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
