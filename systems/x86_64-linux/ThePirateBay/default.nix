# ThePirateBay - The Oceanic Desktop
{pkgs, ...}: {
  imports = [ ./hardware.nix ];

  # NixOS boot options
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  # Desktop hostname
  networking.hostName = "ThePirateBay";

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

  # SDDM prerequisite
  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      font  = "Comic Mono";
      fontSize = "12";
      background = "${./backgrounds/TPS.png}";
      loginBackground = true;
    }
  )];

  # Desktop environment
  services = {
    xserver = {
      enable = true;
      updateDbusEnvironment = true;
      videoDrivers = [ "intel-media-driver" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;

      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };
  };

  desktops = {
    sleepy-dwm.enable = true;
    hyprland.enable = true;
  };

  system.stateVersion = "24.05";
}
