# Ags wayland shell
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
  inherit (inputs) ags;
  cfg = config.apps.misc.ags;
in {
  options.apps.misc.ags = with types; {
    enable = mkBoolOpt false "If enabled installs Ags wayland shell";
  };

  config = mkIf cfg.enable {
    programs.ags = {
      enable = true;
      extraPackages = with pkgs; [
        pkgs.gtksourceview
	      pkgs.webkitgtk
	      pkgs.accountsservice
      ];
    };
  };
}
