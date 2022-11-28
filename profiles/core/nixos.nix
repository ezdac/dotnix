{ config, lib, pkgs, self, ... }:

{
  imports = [
    ./common.nix
    ./keymap.nix
  ];

  # This is just a representation of the nix default
  nix.systemFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];

  environment = {

    # Selection of sysadmin tools that can come in handy
    systemPackages = with pkgs; [
      dosfstools
      gptfdisk
      iputils
      usbutils
      utillinux

    ];

    shellAliases =
      let ifSudo = lib.mkIf config.security.sudo.enable; in
      {
        # nix
        nrb = ifSudo "sudo nixos-rebuild";

        # fix nixos-option for flake compat
        nixos-option = "nixos-option -I nixpkgs=${self}/lib/compat";

        # systemd
        ctl = "systemctl";
        stl = ifSudo "s systemctl";
        utl = "systemctl --user";
        ut = "systemctl --user start";
        un = "systemctl --user stop";
        up = ifSudo "s systemctl start";
        dn = ifSudo "s systemctl stop";
        jtl = "journalctl";
      };
  };

  fonts.fontconfig.defaultFonts = {
    monospace = [ "DejaVu Sans Mono for Powerline" ];
    sansSerif = [ "DejaVu Sans" ];
  };

  nix = {
    # Improve nix store disk usage
    autoOptimiseStore = true;
    optimise.automatic = true;
    allowedUsers = [ "@wheel" ];
  };

  programs.bash = {
    # Enable starship
    promptInit = ''
      eval "$(${pkgs.starship}/bin/starship init bash)"
    '';
    # Enable direnv, a tool for managing shell environments
    interactiveShellInit = ''
      eval "$(${pkgs.direnv}/bin/direnv hook bash)"
    '';
  };

  # For rage encryption, all hosts need a ssh key pair
  services.openssh = {
    enable = true;
    openFirewall = lib.mkDefault false;
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    # Swap Caps Lock with Ctrl
    # now handled by intercept-tools
    # xkbOptions = "ctrl:swapcaps";
    desktopManager = {
      xterm.enable = true;
    };
    # displayManager = {
    #   lightdm.enable = true;
    # };
  };
  # Also use the keyboard in tty virtual consoles
  console.useXkbConfig = true;

  # Service that makes Out of Memory Killer more effective
  services.earlyoom.enable = true;


  # wayland / sway
  security.polkit.enable = true;


}
