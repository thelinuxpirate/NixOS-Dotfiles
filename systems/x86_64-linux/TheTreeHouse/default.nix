# ThePirateBay - The Oceanic Desktop
{pkgs, ...}: {
  imports = [./hardware.nix];

  # NixOS boot options
  boot.loader = { 
    timeout = 25;
    systemd-boot = { 
      enable = true;
      configurationLimit = 80;
      netbootxyz.enable = true;
     };
    efi.canTouchEfiVariables = true;
  };

  # Desktop hostname
  networking.hostName = "TheTreeHouse";

  # Create user "trong" & set default shell
  users.trong.create = true; 
  users.users.trong.shell = pkgs.zsh;

  # Set OS shell to Zsh
  programs.zsh.enable = true;

  # Nix options
  nix = {
    gc = { # Automatic garbage collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Different suites for different needs 
  suites = {
    common.enable = true; # Enables the common desktop properties
    gaming.enable = true; # Gaming options
  };

  # Enables the Oceanic desktop modules
  oceanic = {
    utils.enable = true;
    audio.enable = true;
    fonts.enable = true;
    # TODO make a global 'env' module for environment variables etc
  };

  # Desktop environment
  services.xserver = {
    enable = true;
    updateDbusEnvironment = true;
    videoDrivers = [ "intel-media-driver" ];
    xkb = {
      layout = "us";
      variant = "";
    };
    
    # TODO change display manager to SDDM & customize it
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
      wayland  = true;
    };
  };

  desktops.hyprland.enable = true;

  system.stateVersion = "24.05";
}
