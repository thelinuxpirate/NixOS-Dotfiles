# Utils & media packages
{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.apps.misc;
in {
  options.apps.misc = with types; {
    enable = mkBoolOpt false "If enabled installs misc pkgs";
  };

  config = mkIf cfg.enable {
    home.packages = [
      # Web & media
      pkgs.vesktop # TODO look into discord flakes
      pkgs.discord
      pkgs.thunderbird
      pkgs.tor-browser-bundle-bin
      pkgs.transmission_4-gtk

      pkgs.obs-studio
      pkgs.obs-studio-plugins.wlrobs
      pkgs.obs-studio-plugins.obs-pipewire-audio-capture
      pkgs.vlc
      pkgs.gimp

      # gamedev
      pkgs.blender #gd
      pkgs.krita # gd
      pkgs.pixelorama # gd

      # Misc & util
      pkgs.krabby
      pkgs.betterdiscordctl
      pkgs.onefetch
      pkgs.ffmpeg
      pkgs.xdelta
      pkgs.hyprpicker # TODO add to desktops.hyprland?
    ]; 
  };
}
