# ThePirateBay XMonad setup
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
  inherit (inputs) sleepy-dwm;
  cfg = config.desktops.xmonad;
in {
  options.desktops.xmonad = with types; {
    enable = mkBoolOpt false "Whether or not to enable XMonadWM";
    # NOTE DISPLAY MANAGERS WILL ALWAYS BE MANAGED BY THE HOST NOT A MODULE
  };

  config = mkIf cfg.enable {
    services.xserver.windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = builtins.readFile ./config/xmonad.hs;
    };

    sleepy.enableDmenu = true;

    environment.systemPackages = with pkgs; [
      # Desktop dependencies
      pkgs.feh
      pkgs.picom
      pkgs.flameshot
      pkgs.dunst
      pkgs.polybar
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
