# TRONG Management & Settings
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
  # Enable User
  snowfallorg.user = {
    enable = true;
    name = "trong";
  };

  # Shell Management
  shells = {
    # TODO: reconfigure shell
    zsh.enable = true;
    starship.enable = true;
    sleepy-xinit.enable = false;
  };

  # Applications
  apps = {
    misc = {
      enable = true;
      zen-browser.enable = true;
      spicetify.enable = true;
      ags.enable = true;

      terms = {
        tmux.enable = true;
        alacritty.enable = true;
        foot.enable = false;
        wezterm.enable = false;
      };
    };

    # Programming Tools
    programming = {
      emacs.enable = true; # back to neovim?
      nvchad.enable = false; # TODO: remove
      hielo.enable = true;
      gamedev.enable = false;
    };

    # Gaming Options
    gaming = {
      enable = true;

      extras = {
        enable = true;
        emulation.enable = true;
        minecraft.enable = true; # TODO: Configure
      };
    };
  };

  # Theming
  theme = {
    stylix.enable = true;
    icons.papirus.nord.enable = true;
  };

  home.stateVersion = lib.mkDefault (osConfig.system.stateVersion or "24.05");
}
