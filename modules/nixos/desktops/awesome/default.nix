# ThePirateBay AwesomeWM setup
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
  inherit (inputs) sleepy-dwm;
  cfg = config.desktops.awesome;
in {
  options.desktops.awesome = with types; {
    enable = mkBoolOpt false "Whether or not to enable AwesomeWM";
    # NOTE DISPLAY MANAGERS WILL ALWAYS BE MANAGED BY THE HOST NOT A MODULE
  };

  config = mkIf cfg.enable {
    services.xserver.windowManager.awesome = {
      enable = true;
      luaModules = [];
    };

    sleepy.enableDmenu = true;

    environment.systemPackages = with pkgs; [
      # Desktop dependencies
      pkgs.feh
      pkgs.picom
      pkgs.flameshot
      pkgs.dunst
      pkgs.playerctl
      pkgs.brightnessctl
      pkgs.pamixer

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
