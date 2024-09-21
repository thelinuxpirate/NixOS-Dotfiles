# HyprPanel (Hyprland)
{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.apps.misc.ags.hyprpanel;
in {
  options.apps.misc.ags.hyprpanel = with types; {
    enable = mkBoolOpt false "If enabled installs Hyprpanel";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # Imported via Overlay
      pkgs.hyprpanel

      # AGs Dependencies
      pkgs.gtksourceview
	    pkgs.webkitgtk
	    pkgs.accountsservice
    ];
  };
}
