{ hmUsers, ... }:
{
  home-manager.users = { inherit (hmUsers) ezdac; };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ezdac = {
    password = "nixos";
    isNormalUser = true;
    description = "Maximilian Langenfeld";
    extraGroups = [ "networkmanager" "wheel" ];
  };

}
