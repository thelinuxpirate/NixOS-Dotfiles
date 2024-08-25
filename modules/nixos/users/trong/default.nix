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
    create = mkBoolOpt false "Create the TRONG user";
  };

  config = mkIf cfg.create {
    snowfallorg.users.trong = {
      create = true;
      admin = true;

    home = {
      config = {
        home.packages = [
          # Web, & Media
          pkgs.vesktop
          pkgs.discord
          pkgs.betterdiscordctl
          pkgs.thunderbird

          pkgs.tor-browser-bundle-bin
          pkgs.transmission_4-gtk
          pkgs.obs-studio
          pkgs.obs-studio-plugins.wlrobs
          pkgs.obs-studio-plugins.obs-pipewire-audio-capture
          pkgs.vlc

          # General
          pkgs.neovide
          pkgs.blender
          pkgs.gimp
          pkgs.krita
          pkgs.pixelorama

          pkgs.krabby
          pkgs.onefetch
          pkgs.ffmpeg
          pkgs.xdelta
          pkgs.hyprpicker
    
          # Programming
          pkgs.ghc # Haskell
          pkgs.cabal-install
          pkgs.stack
          pkgs.godot_4 # Godot/C#
          pkgs.dotnet-sdk_8
          pkgs.nim # Nim
          pkgs.nimlsp
          pkgs.asdf # Elixir 
          pkgs.zig # Zig
          pkgs.zls
          pkgs.sbcl # Lisp/Scheme
          pkgs.guile_3_0
          pkgs.python311Packages.pip # Python
          pkgs.go # Golang
          pkgs.gcc # C/C++
          pkgs.gnumake
          pkgs.cmake
          pkgs.lua # Lua
          pkgs.nodejs # JS/TS
          pkgs.bun
        ];

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

          neovim = {
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
