# Gaming extras
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
  cfg = config.apps.gaming.extras;
in {
  options.apps.gaming.extras = with types; {
    enable = mkBoolOpt false "Whether or not to enable the gaming preset";
  };

  config = mkIf cfg.enable {
    home.packages = [
      nix-gaming.packages.${pkgs.system}.osu-stable
      #nix-gaming.packages.${pkgs.system}.rocket-league
      #nix-gaming.packages.${pkgs.system}.technic-launcher 
    ]; 
  };
}
