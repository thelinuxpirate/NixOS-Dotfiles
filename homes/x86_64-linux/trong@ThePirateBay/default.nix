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
    sleepy-xinit.enable = true;
  };

  # Applications
  apps = {
    misc = {
      enable = true;
      ags.enable = true;
      spicetify.enable = true;

      terms = {
        tmux.enable = true;
        alacritty.enable = true;
        foot.enable = false;
        wezterm.enable = false;
      };
    };

    programming = {
      enable = true;
      nixvim.enable = true;
      gamedev.enable = true;
    };

    gaming = {
      enable = true;

      extras = {
        enable = true;
        emulation.enable = true;
        minecraft.enable = true;
        proton.enable = false;
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
