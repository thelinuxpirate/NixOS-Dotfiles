# Emacs (DOOM-Compatible)
{
  inputs,
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  inherit (inputs) emacs-overlay nixpkgs-stable;
  stablePkgs = import nixpkgs-stable { system = pkgs.stdenv.hostPlatform.system; };
  cfg = config.apps.programming.emacs;
in {
  options.apps.programming.emacs = with types; {
    enable = mkBoolOpt false "Whether or not to enable Emacs";
  };

  config = mkIf cfg.enable {
    programs.emacs = {
      enable = true;
      package = stablePkgs.emacs-gtk; #emacs-overlay.packages.${pkgs.system}.emacs-pgtk
      extraPackages = epkgs: [
        epkgs.vterm
        epkgs.mu4e
        epkgs.emacsql-sqlite
      ];
    };

    services.emacs = { # acting buggy on 29.4v
      enable = false;
      defaultEditor = true;
      package = stablePkgs.emacs-gtk;
    };

    home = {
      sessionVariables = {
        DOOMDIR = "${config.xdg.configHome}/doom";
      };

      packages = [ # Darkwraith Dependencies
        pkgs.git
        pkgs.findutils
        pkgs.python3
        pkgs.fd
        pkgs.ripgrep
        pkgs.texliveMedium
        pkgs.nixfmt-rfc-style
        pkgs.enchant
        pkgs.languagetool
        pkgs.imagemagick
        pkgs.poppler
        pkgs.ffmpegthumbnailer
        pkgs.mediainfo
        pkgs.gnutar
        pkgs.unzip
        pkgs.mu
        pkgs.isync
        pkgs.clang-tools
        pkgs.cmake-language-server
        pkgs.gopls
        pkgs.zls
        pkgs.rust-analyzer
        pkgs.pyright
      ];
    };
  };
}
