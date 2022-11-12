{ hmUsers, ... }:
{
  home-manager.users = { inherit (hmUsers) nixos; };

  users.users.nixos = {
    password = "nixos";
    description = "default";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  # home-manager.users.nixos.programs.git.userEmail = "maxdacjs@gmail.com";
  # home-manager.users.nixos.programs.git.userName = "Maximilian Langenfeld";
}
