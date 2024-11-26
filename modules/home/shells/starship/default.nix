# Starship shell configuration
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
  cfg = config.shells.starship;
in {
  options.shells.starship = with types; {
    enable = mkBoolOpt false "Whether or not to enable the Starship shell";
  };

  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      package = pkgs.starship;
      settings = {
        command_timeout = 1000;
        right_format = "$time";

        time = {
          disabled = false;
          style = "#939594";
          format = "[$time]($style)";
        };

        aws = {
          style = "bg:#f9a600 fg:black";
          symbol = "☁ ";
          format = "[](fg:black bg:#f9a600)[$symbol$profile]($style)[](fg:#f9a600 bg:black)";
        };

        character = {
          success_symbol = "[❯](#ff9400)";
          error_symbol = "[✗](#ff4b00)";
        };

        cmd_duration = {
          style = "#f9a600";
          format = "[](fg:black bg:#f9a600)[祥$duration](bg:$style fg:black)[](fg:$style)";
        };

        directory = {
          style = "#c05303";
          truncate_to_repo = false;
          fish_style_pwd_dir_length = 1;
          format = "[](fg:black bg:#c05303)[$path[$read_only](bg:$style fg:black)](bg:$style fg:black)[](fg:$style)";
          read_only = " ";
        };

        docker_context = {
          style = "fg:black bg:#eb9606";
          symbol = "🐳  ";
          format = "[](fg:black bg:#eb9606)[$symbol$context]($style)[](fg:#eb9606)";
        };

        git_branch = {
          style = "#d8712c";
          format = "[](fg:black bg:$style)[ $symbol$branch](fg:black bg:$style)[](fg:$style)";
        };

        git_commit = {
          style = "#d8712c";
          format = "\b[ ](bg:$style)[\\($hash$tag\\)](fg:black bg:$style)[](fg:$style)";
        };

        git_state = {
          style = "#d8712c";
          format = "\b[ ](bg:$style)[ \\($state( $progress_current/$progress_total)\\)](fg:black bg:$style)[](fg:$style)";
        };


        golang = {
          symbol = "ﳑ ";
          style = "fg:black bg:#eb9606";
          format = "[](fg:black bg:#eb9606)[$symbol$version]($style)[](fg:#eb9606)";
        };

        helm = {
          style = "fg:black bg:#eb9606";
          format = "[](fg:black bg:#eb9606)[$symbol($version)]($style)[](fg:#eb9606)";
        };

        java = {
          symbol = " ";
          style = "fg:black bg:#eb9606";
          format = "[](fg:black bg:#eb9606)[$symbol$version]($style)[](fg:#eb9606)";
        };

        kotlin = {
          style = "fg:black bg:#eb9606";
          format = "[](fg:black bg:#eb9606)[$symbol$version]($style)[](fg:#eb9606)";
        };

        kubernetes = {
          format = "[](fg:black bg:#ad4007)[$symbol$context](fg:black bg:#ad4007)[](fg:#ad4007)";
          disabled = false;
        };

        nodejs = {
          style = "green";
          format = "[](fg:black bg:#eb9606)[$symbol($version)](fg:black bg:#eb9606)[](fg:#eb9606)";
        };

        php = {
          style = "fg:black bg:#eb9606";
          format = "[](fg:black bg:#eb9606)[$symbol$version]($style)[](fg:#eb9606)";
        };

        python = {
          symbol = " ";
          style = "fg:black bg:#eb9606";
          format = "[](fg:black bg:#eb9606)[$symbol$pyenv_prefix$version$virtualenv]($style)[](fg:#eb9606)";
        };

        ruby = {
          symbol = " ";
          format = "[](fg:black bg:#eb9606)[$symbol$version](fg:black bg:#eb9606)(fg:black bg:#eb9606)[](fg:#eb9606)";
        };

        rust = {
          style = "fg:black bg:#eb9606";
          format = "[](fg:black bg:#eb9606)[$symbol$version]($style)[](fg:#eb9606)";
        };

        terraform = {
          style = "fg:black bg:#eb9606";
          format = "[](fg:black bg:#eb9606)[$symbol$workspace]($style)[](fg:#eb9606)";
        };

        username = {
          style_user = "#0370C0";
          style_root = "#C00311";
          format = "[](fg:black bg:$style)[$user](fg:black bg:$style)[](fg:$style)";
        };

        vagrant = {
          style = "fg:black bg:#eb9606";
          format = "[](fg:black bg:#eb9606)[$symbol$version]($style)[](fg:#eb9606)";
        };
      };
    };
  };
}
