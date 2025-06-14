# Ags Wayland Shell
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
  inherit (inputs) ags;
  cfg = config.apps.misc.ags;
in {
  options.apps.misc.ags = with types; {
    enable = mkBoolOpt false "If enabled installs Ags wayland shell";
  };

  config = mkIf cfg.enable {
    programs.ags = {
      enable = true;
      extraPackages = [
        pkgs.gtksourceview
        pkgs.webkitgtk
        pkgs.accountsservice

        pkgs.esbuild
        pkgs.libnotify
        pkgs.dart-sass
        pkgs.fd
        pkgs.libgtop
        pkgs.gobject-introspection
        pkgs.glib
        pkgs.bluez-tools
        pkgs.gpu-screen-recorder
        pkgs.matugen
      ];
    };
  };
}
