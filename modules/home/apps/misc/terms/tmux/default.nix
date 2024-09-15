# TMUX Multiplexer
{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.apps.misc.terms.tmux;
in {
  options.apps.misc.terms.tmux = with types; {
    enable = mkBoolOpt false "Whether or not to enable Tmux";
  };

  config = mkIf cfg.enable {
    programs = {
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
    };
  };
}
