# TRONG NixVim Configuration
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
  inherit (inputs) hielo;
  cfg = config.apps.programming.hielo;
in {
  options.apps.programming.hielo = with types; {
    enable = mkBoolOpt false "Whether or not to enable NixVim";
  };

  config = mkIf cfg.enable {
    home.packages = [
      hielo.packages.${pkgs.system}.default
      pkgs.stylua
      pkgs.ripgrep
    ];
  };
}
