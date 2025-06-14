# Gaming extras
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
  inherit (inputs) nix-gaming;
  cfg = config.apps.gaming.extras;
in {
  options.apps.gaming.extras = with types; {
    enable = mkBoolOpt false "Whether or not to enable the gaming preset";
  };

  config = mkIf cfg.enable {
    home.packages = [
      #nix-gaming.packages.${pkgs.system}.osu-stable # BROKEN? Nix Flake Update?
      #nix-gaming.packages.${pkgs.system}.rocket-league
      #nix-gaming.packages.${pkgs.system}.technic-launcher 
    ]; 
  };
}
