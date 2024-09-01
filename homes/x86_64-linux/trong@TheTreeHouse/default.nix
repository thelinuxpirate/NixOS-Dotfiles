{
  config,
  lib,
  pkgs,
  osConfig,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; {
  snowfallorg.user = {
    enable = true;
    name = "trong";
  };

  # Shell Management
  shells = {
    zsh.enable = true;
    starship.enable = true;
  };

  # Applications
  apps = {
    misc = {
      enable = true;
      spicetify.enable = true;
    };

    programming = {
      enable = true;
      gamedev.enable = true;
    };

    gaming = {
      enable = true;

      extras = {
        proton.enable = false;
        #minecraft.enable = true;
      };
    };
  };

  # Theming
  themes = {
    gtk.palenight.enable = true;
    icons.papirus.enable = true;
    cursors.numix.enable = true;
  };

  home.stateVersion = lib.mkDefault (osConfig.system.stateVersion or "24.05");
}
