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
  cfg = config.theme.icons.papirus.nord;
in {
  options.theme.icons.papirus.nord = with types; {
    enable = mkBoolOpt false "Whether or not to enable the Papirus icon theme (NORDIC)";
  };

  config = mkIf cfg.enable {
    gtk.iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-nord;
    };
  };
}
