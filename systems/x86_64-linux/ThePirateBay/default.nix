# ThePirateBay - The Oceanic Desktop
{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [ ./hardware.nix ];

  # NixOS boot options
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
    theme = inputs.grub-themes.packages.${pkgs.system}.hyperfluent;
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
    theme.enable = true;
  };

  # SDDM prerequisite
  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      font  = "Comic Mono";
      fontSize = "12";
      background = "${./backgrounds/city-lights.jpg}";
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
    hyprland.enable = true;
    sleepy-dwm.enable = true;
    xmonad.enable = false;
    awesome.enable = false;
  };

  system.stateVersion = "24.05";
}
