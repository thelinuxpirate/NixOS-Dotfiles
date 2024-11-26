# NvChad
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
  inherit (inputs) nvchad;
  cfg = config.apps.programming.nvchad;
in {
  options.apps.programming.nvchad = with types; {
    enable = mkBoolOpt false "Whether or not to enable NvChad";
  };

  config = mkIf cfg.enable {
    programs.nvchad.enable = true;

    home.packages = [
      pkgs.neovide
      pkgs.stylua
      pkgs.ripgrep
    ];
  };
}
