# ThePirateBay XMonad setup
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
  cfg = config.desktops.xmonad;
in {
  options.desktops.xmonad = with types; {
    enable = mkBoolOpt false "Whether or not to enable XMonadWM";
    # NOTE DISPLAY MANAGERS WILL ALWAYS BE MANAGED BY THE HOST NOT A MODULE
  };

  config = mkIf cfg.enable {
    services = {
      xserver.windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = builtins.readFile ./../../../../dotfiles/xmonad/xmonad.hs;
      };

      greenclip.enable = true;
    };

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
      pkgs.rofi

      # Applications used with ThePirateBay rice
      pkgs.nemo-with-extensions
      pkgs.peazip
      pkgs.file-roller
      pkgs.pavucontrol
    ];
  };
}
