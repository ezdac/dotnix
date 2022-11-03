{ suites, ... }:
{
  ### root password is empty by default ###
  imports = suites.base;

  networking.hostName = "flagship";

  boot.loader.grub = {
    enable = true;
    configurationLimit = 3;
    efiInstallAsRemovable = true;
    devices = [ "nodev" ];
    efiSupport = true;
    fsIdentifier = "label";
    useOSProber = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };
  fileSystems."/boot/efi" = { device = "/dev/disk/by-label/efiboot"; };
}
