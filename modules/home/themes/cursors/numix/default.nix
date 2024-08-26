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
  cfg = config.themes.cursors.numix;
in {
  options.themes.cursors.numix = with types; {
    enable = mkBoolOpt false "Whether or not to enable the Numix cursors";
  };

  config = mkIf cfg.enable {
    home.pointerCursor = {
      package = pkgs.numix-cursor-theme;
      name = "Numix-Cursor-Light";
      size = 20;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
