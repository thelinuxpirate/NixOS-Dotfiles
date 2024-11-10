# Foot Terminal (Wayland)
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
  cfg = config.apps.misc.terms.foot;
in {
  options.apps.misc.terms.foot = with types; {
    enable = mkBoolOpt false "If enabled installs Foot & applies configuration";
  };

  config = mkIf cfg.enable {
    programs = {
      foot = {
        enable = true;

        settings = {
          main = {
            font = "Comic Mono:size=13";
            dpi-aware = "yes";
          };

          scrollback = {
            lines = 5000;
          };

          # TokyoNight Theme
          colors = {
            background = "1a1b26";
            foreground = "c0caf5";
            regular0 = "15161E";
            regular1 = "f7768e";
            regular2 = "9ece6a";
            regular3 = "e0af68";
            regular4 = "7aa2f7";
            regular5 = "bb9af7";
            regular6 = "7dcfff";
            regular7 = "a9b1d6";
            bright0 = "414868";
            bright1 = "f7768e";
            bright2 = "9ece6a";
            bright3 = "e0af68";
            bright4 = "7aa2f7";
            bright5 = "bb9af7";
            bright6 = "7dcfff";
            bright7 = "c0caf5";
          };
        };
        server.enable = true;
      };
    };
  };
}
