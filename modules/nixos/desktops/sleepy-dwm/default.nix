# Sleepy-DWM Nix port 
{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.desktops.sleepy-dwm;
in {
  options.desktops.sleepy-dwm = with types; {
    enable = mkBoolOpt false "Whether or not to enable Sleepy-DWM";
    # NOTE DISPLAY MANAGERS WILL ALWAYS BE MANAGED BY THE HOST NOT A MODULE
  };

  config = mkIf cfg.enable {
    # TODO add patched versions of Slstatus, Dmenu, & ST
    services.xserver.windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs rec {
        pname = "sleepy-dwm";
        version = "6.5";
        src = /home/trong/.config/sleepy-dwm; # Replace with your user
        nativeBuildInputs = [ pkgs.imlib2 ];
      };
    };

    environment.systemPackages = with pkgs; [
      # Desktop dependencies
      pkgs.wezterm
      pkgs.feh
      pkgs.picom
      pkgs.dunst
      pkgs.flameshot

      # Applications used with Sleepy-DWM
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
