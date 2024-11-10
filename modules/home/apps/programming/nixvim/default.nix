# NixVim
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
  cfg = config.apps.programming.nixvim;
in {
  options.apps.programming.nixvim = with types; {
    enable = mkBoolOpt false "Whether or not to enable NixVim";
  };

  config = mkIf cfg.enable {
    home.packages = [
      hielo.packages.${pkgs.system}.default
      pkgs.neovide
      pkgs.stylua
      pkgs.ripgrep
    ];
  };
}
