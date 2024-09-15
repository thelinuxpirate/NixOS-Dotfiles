# Programs, Utils, & Media packages
{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.apps.misc;
in {
  options.apps.misc = with types; {
    enable = mkBoolOpt false "If enabled installs misc pkgs";
  };

  config = mkIf cfg.enable {
    programs = {
      firefox = {
        enable = true;
        enableGnomeExtensions = false;
      };

      tmux = {
        enable = true;
        tmuxinator.enable = true;

        mouse = true;
        secureSocket = true;
        disableConfirmationPrompt = true;

        historyLimit = 5000;
        escapeTime = 650;
        resizeAmount = 2;
        clock24 = true;

        prefix = "C-x";
      };

      git = {
        enable = true;
        userEmail = "dim7.42407@gmail.com";
        userName = "thelinuxpirate";

        difftastic = {
          enable = true;
          background = "dark";
          color = "auto";
        };
      };

      gitui.enable = true;

      btop = {
        enable = true;
        settings = {
          color_theme = "tokyo-night";
        };
      };

      fzf = {
        enable = true;
        enableZshIntegration = true;

        tmux = {
          enableShellIntegration = true;
        };
      };

      nheko = {
        enable = true;
      };
    };

    home.packages = [
      # Web & media
      pkgs.vesktop # TODO look into discord flakes
      pkgs.discord
      pkgs.thunderbird
      pkgs.tor-browser-bundle-bin
      pkgs.transmission_4-gtk

      pkgs.obs-studio
      pkgs.obs-studio-plugins.wlrobs
      pkgs.obs-studio-plugins.obs-pipewire-audio-capture
      pkgs.vlc
      pkgs.gimp

      # gamedev
      pkgs.blender #gd
      pkgs.krita # gd
      pkgs.pixelorama # gd

      # Misc & util
      pkgs.krabby
      pkgs.betterdiscordctl
      pkgs.onefetch
      pkgs.ffmpeg
      pkgs.xdelta
      pkgs.hyprpicker
    ];
  };
}
