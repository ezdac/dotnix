{ hmUsers, ... }:
{
  home-manager.users = { inherit (hmUsers) ezdac; };

  users.users.ezdac = {
    password = "nixos";
    description = "default";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
