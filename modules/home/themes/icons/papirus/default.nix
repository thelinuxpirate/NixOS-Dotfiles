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
  cfg = config.themes.icons.papirus;
in {
  options.themes.icons.papirus = with types; {
    enable = mkBoolOpt false "Whether or not to enable the Papirus icon theme";
  };

  config = mkIf cfg.enable {
    gtk.iconTheme = { # TODO Change to catppuccin version
      name = "ePapirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}

