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
  inherit (inputs) emacs-overlay;
  cfg = config.apps.programming.emacs;
in {
  options.apps.programming.emacs = with types; {
    enable = mkBoolOpt false "Whether or not to enable Emacs";
  };

  config = mkIf cfg.enable {
    programs.emacs = {
      enable = true;
      package = emacs-overlay.packages.${pkgs.system}.emacs-pgtk;
    };

    services.emacs = {
      enable = true;
      defaultEditor = true;
    };

    home = {
      packages = [
        pkgs.git
        pkgs.findutils
        pkgs.fd
        pkgs.ripgrep
      ];
    };
  };
}
