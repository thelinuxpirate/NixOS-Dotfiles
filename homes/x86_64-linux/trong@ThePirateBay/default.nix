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

      terms = {
        tmux.enable = true;
        alacritty.enable = true;
        foot.enable = false;
        wezterm.enable = false;
      };

      ags = {
        enable = false;
        hyprpanel.enable = true;
      };
    };

    # Programming Tools
    programming = {
      enable = false; # Use Nix flake templates instead
      emacs.enable = true;
      nixvim.enable = true;
      gamedev.enable = true;
    };

    # Gaming Options
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
  theme = {
    stylix.enable = true;
    icons.papirus.enable = true;
  };

  home.stateVersion = lib.mkDefault (osConfig.system.stateVersion or "24.05");
}
