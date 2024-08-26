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
  cfg = config.apps.gaming;
in {
  options.apps.gaming = with types; {
    enable = mkBoolOpt false "Whether or not to enable the gaming preset";
  };

  config = mkIf cfg.enable { # TODO in 'minecraft' add the "modrinth-app" package from nix-gaming input
    home.packages = [
      pkgs.lutris
      pkgs.heroic
      pkgs.bottles


      # move to extras?
      nix-gaming.packages.${pkgs.system}.osu-stable
      nix-gaming.packages.${pkgs.system}.rocket-league
      nix-gaming.packages.${pkgs.system}.technic-launcher 
    ]; 
  };
}
