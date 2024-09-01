# Starship shell configuration
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
  cfg = config.shells.starship;
in {
  options.shells.starship = with types; {
    enable = mkBoolOpt false "Whether or not to enable the Starship shell";
  };

  config = mkIf cfg.enable { # TODO reconfigure
    programs.starship = {
      enable = true;
      package = pkgs.starship;
      enableZshIntegration = true;

      settings = {
        # Inserts a blank line between shell prompts
        add_newline = true;

        # Base Modules
        package = {
          disabled = false;
        };

        cmd_duration = {
          min_time = 500;
          format = "took [$duration](bold yellow)";
        };

        git_branch = {
          symbol = " ";
          style = "bold italic red";
          format = "[git:](bold blue)[\\(](bold blue)[$branch(:$remote_branch)]($style)[\\)](bold blue) ";
        };

        # Programming Modules
        golang = {
          disabled = false;
          symbol = " ";
        };

        haskell = {
          disabled = false;
          symbol = "λ ";
        };

        nim = {
          disabled = false;
          symbol = " "; 
        };

        nix_shell = {
          disabled = false;
          symbol = " ";
        };

        nodejs = {
          disabled = false;
          symbol = " ";
        };

        python = {
          disabled = false;
          symbol = " ";
        };

        rust = {
          disabled = false;
          symbol = " ";
        };
      };
    };
  };
}
