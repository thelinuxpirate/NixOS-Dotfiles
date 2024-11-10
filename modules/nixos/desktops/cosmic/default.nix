# ThePirateBay Cosmic setup
{
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.desktops.cosmic;
in {
  options.desktops.cosmic = with types; {
    enable = mkBoolOpt false "Whether or not to enable Cosmic DE";
    # NOTE DISPLAY MANAGERS WILL ALWAYS BE MANAGED BY THE HOST NOT A MODULE
  };

  config = mkIf cfg.enable {
    services = {
      desktopManager.cosmic.enable = true;
      displayManager.cosmic-greeter.enable = false; # Use SDDM
    };

    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-cosmic
        pkgs.xdg-desktop-portal-gtk
      ];
    };

    environment = {
      sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
      systemPackages = with pkgs; [
        # Desktop dependencies
        pkgs.flameshot
        pkgs.playerctl
        pkgs.brightnessctl
        pkgs.pamixer
        pkgs.gnome.gvfs

        # Applications used with ThePirateBay rice
        pkgs.nemo-with-extensions
        pkgs.peazip
        pkgs.file-roller
        pkgs.pavucontrol
      ];
    };
  };
}
