# TRONG owner of TheTreeHouse
{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.users.trong;
in {
  options.users.trong = with types; {
    create = mkBoolOpt false "Creates the TRONG user & applies their settings";
  };

  config = mkIf cfg.create {
    snowfallorg.users.trong = {
      create = true;
      admin = true;

    home = {
      config = {
        programs = {
          foot = { # return to WezTerm?
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

          fzf = {
            enable = true;
            enableZshIntegration = true;

            tmux = {
              enableShellIntegration = true;
            };
          };

          neovim = { # NixVim module soon (still use NvChad???)
            enable = true;
            defaultEditor = true;

            viAlias = true;
            vimAlias = true;
            vimdiffAlias = true;
          };

          firefox = {
            enable = true;
            enableGnomeExtensions = false;
          };

          nheko = {
            enable = true;
          };
        };
      };
    };
    };
  };
}
