# ThePirateBay Hyprland setup
{
  inputs,
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  inherit (inputs) swww;
  cfg = config.desktops.hyprland;
in {
  options.desktops.hyprland = with types; {
    enable = mkBoolOpt false "Whether or not to enable Hyprland";
    # NOTE DISPLAY MANAGERS WILL ALWAYS BE MANAGED BY THE HOST NOT A MODULE
  };

  config = mkIf cfg.enable {
    programs = {
      hyprland = {
        enable = true;
        xwayland.enable = true;
        portalPackage = pkgs.xdg-desktop-portal-hyprland;
      };

      waybar.enable = true;
      hyprlock.enable = false;
    };

    services.hypridle.enable = false;

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    environment = {
      sessionVariables.NIXOS_OZONE_WL = "1";

      systemPackages = [
        # Desktop dependencies
        swww.packages.${pkgs.system}.swww
        pkgs.kdePackages.xwaylandvideobridge
        pkgs.nerd-fonts.jetbrains-mono
        pkgs.mpvpaper
        pkgs.grimblast # TODO: find replacement
        pkgs.playerctl
        pkgs.brightnessctl
        pkgs.pamixer

        # Applications used with TheTreeHouse rice
        pkgs.nemo-with-extensions
        pkgs.wofi # TODO: replace with an AGs implementation
        pkgs.file-roller
        pkgs.pavucontrol
        pkgs.hyprpicker
      ];
    };
  };
}
