# Alacritty Terminal (Wayland & Xorg)
{
  inputs,
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  inherit (inputs) alacritty-themes;
  cfg = config.apps.misc.terms.alacritty;
in {
  options.apps.misc.terms.alacritty = with types; {
    enable = mkBoolOpt false "If enabled installs Alacritty & applies configuration";
  };

  config = mkIf cfg.enable {
    programs = {
      alacritty = {
        enable = true;
        settings.import = [ pkgs.alacritty-theme.tomorrow_night ];
        settings = {
          font = {
            normal.family = "Comic Mono";
            bold.family = "Comic Mono";
            italic.family = "Comic Mono";
            bold_italic.family = "Comic Mono";
            size = 13;
          };

          cursor = {
            style = {
              shape = "Block";
              blinking = "Off";
            };
            unfocused_hollow = true;
            thickness = 0.20;
          };

          mouse.hide_when_typing = true;
        };
      };
    };
  };
}
