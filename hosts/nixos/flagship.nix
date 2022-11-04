{ lib, config, pkgs, modulesPath, suites, ... }:
{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ] ++ suites.base;

  networking.hostName = "flagship";
  networking.networkmanager.enable = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/31731f44-3878-4319-b901-b1c226ed2f79";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-4e5782b7-f468-438d-a58f-0fa5712d1d84".device = "/dev/disk/by-uuid/4e5782b7-f468-438d-a58f-0fa5712d1d84";

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/430C-3F08";
      fsType = "vfat";
    };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # TODO should this go here?
  system.stateVersion = "22.05";

}
