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
  cfg = config.themes.gtk.palenight;
in {
  options.themes.gtk.palenight = with types; {
    enable = mkBoolOpt false "Whether or not to enable the Palenight GTK theme";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;

      theme = {
        name = "palenight";
        package = pkgs.palenight-theme;
      };

      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme=1;
      };
    
      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme=1;
      };
    };  
  };
}
