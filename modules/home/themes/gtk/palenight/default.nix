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
    # TODO make homeCursors its own module
    home.pointerCursor = {
      package = pkgs.numix-cursor-theme;
      name = "Numix-Cursor-Light";
      size = 20;
      gtk.enable = true;
      x11.enable = true;
    };

    gtk = {
      enable = true;

      theme = {
        name = "palenight";
        package = pkgs.palenight-theme;
      };

      iconTheme = { # Possibly its own module?
        name = "ePapirus-Dark";
        package = pkgs.papirus-icon-theme;
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
