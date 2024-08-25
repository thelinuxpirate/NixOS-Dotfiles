# ThePirateBay - The Oceanic Desktop
{pkgs, ...}: {
  imports = [./hardware.nix];

  # NixOS Boot Options
  boot.loader = { 
    timeout = 25;
    systemd-boot = { 
      enable = true;
      configurationLimit = 80;
      netbootxyz.enable = true;
     };
    efi.canTouchEfiVariables = true;
  };

  # Desktop Hostname
  networking.hostName = "TheTreeHouse";

  # Create user "trong"
  users.trong.create = true; 

  # Nix options
  nix = {
    gc = { # Automatic Garbage Collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Enables the common desktop properties
  suites.common.enable = true;

  # Enables the Oceanic desktop modules
  oceanic = { # TODO sort out oceanic modules 
    audio.enable = true;
    fonts.enable = true;
    # env.enable = true;
    # shell.enable = true;
  };

  # Desktop environment
  services.xserver = { # MUST CLEAN
    enable = true;
    updateDbusEnvironment = true;
    videoDrivers = [ "intel-media-driver" ];
    xkb = {
      layout = "us";
      variant = "";
    };
    
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
      wayland  = true;
    };
  };

  programs = {
    # zsh.enable = true; # oceanic.shell

    hyprland = {
      enable = true;
      package = pkgs.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };

    steam = { # TODO suites/gaming/default.nix & oceanic/naval versions
      enable = true;
      extest.enable = true;
      protontricks.enable = true;
    };

    gamemode = {
      enable = true;
      enableRenice = true;
    };

    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };


  environment.systemPackages = with pkgs; [
    # Utils
    pkgs.appimage-run
    pkgs.glxinfo
    pkgs.vulkan-tools
    pkgs.fastfetch

    # Desktop
    pkgs.waybar
    pkgs.wofi
    pkgs.swaybg
    pkgs.mpvpaper
    pkgs.xfce.xfce4-screenshooter
    pkgs.ags
    pkgs.dunst
    pkgs.playerctl
    pkgs.brightnessctl

    # Applications
    pkgs.xfce.thunar
    pkgs.xfce.thunar-volman
    pkgs.xfce.thunar-dropbox-plugin
    pkgs.xfce.thunar-archive-plugin
    pkgs.xfce.thunar-media-tags-plugin
    pkgs.xfce.tumbler
    pkgs.file-roller

    pkgs.bluetuith
    pkgs.blueberry
    pkgs.pavucontrol
  ];

  system.stateVersion = "24.05";
}
