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
  inherit (inputs) nix-gaming;
  cfg = config.apps.gaming;
in {
  options.apps.gaming = with types; {
    enable = mkBoolOpt false "Whether or not to enable the gaming preset";
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.lutris
      pkgs.heroic
      pkgs.bottles 
    ]; 
  };
}
