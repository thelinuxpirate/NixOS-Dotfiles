# Sleepy-DWM XinitRC
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
  cfg = config.shells.sleepy-xinit;
in {
  options.shells.sleepy-xinit = with types; {
    enable = mkBoolOpt false "If enabled enables usage of Sleepy-xinitrc";
  };

  config = mkIf cfg.enable {
    xsession.initExtra = "
      xset r rate 200 60 &\n
      xset b off &\n
      slstatus &\n
      nm-applet &\n
      blueman-applet &\n
      feh --bg-fill ~/Pictures/Wallpapers/landscape/TPS.png &\n
      picom --daemon &\n
      dunst &\n
      flameshot &\n
      #playme -t ~/.local/audio/StickerbushSymphony.mp3 -d 1 &\n
    ";
  };
}
