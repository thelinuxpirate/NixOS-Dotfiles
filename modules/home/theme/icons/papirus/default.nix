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
  cfg = config.theme.icons.papirus;
in {
  options.theme.icons.papirus = with types; {
    enable = mkBoolOpt false "Whether or not to enable the Papirus icon theme";
  };

  config = mkIf cfg.enable {
    gtk.iconTheme = { # TODO Change to catppuccin version
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
