# ThePirateBay Hyprland setup
{
  inputs,
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
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
      };

      hyprlock.enable = false;
    };

    services.hypridle.enable = false;

    environment.systemPackages = with pkgs; [
      # Desktop dependencies
      swww.packages.${pkgs.system}.swww
      pkgs.waybar
      pkgs.wofi
      pkgs.sass
      pkgs.sassc
      pkgs.mpvpaper
      pkgs.grimblast
      pkgs.playerctl
      pkgs.brightnessctl
      pkgs.pamixer
      pkgs.gnome.gvfs

      # Applications used with ThePirateBay rice
      pkgs.xfce.thunar
      pkgs.xfce.thunar-volman
      pkgs.xfce.thunar-dropbox-plugin
      pkgs.xfce.thunar-archive-plugin
      pkgs.xfce.thunar-media-tags-plugin
      pkgs.xfce.tumbler
      pkgs.file-roller
      pkgs.pavucontrol
    ];
  };
}
