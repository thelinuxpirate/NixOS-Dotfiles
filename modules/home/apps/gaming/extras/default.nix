# Gaming extras

{
  options,
  config,
  pkgs,
  lib,
  nix-gaming,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.apps.gaming.extras;
in {
  options.apps.gaming.extras = with types; {
    enable = mkBoolOpt false "Whether or not to enable the gaming preset";
  };

  config = mkIf cfg.enable { # TODO in 'minecraft' add the "modrinth-app" package from nix-gaming input
    home.packages = [
      nix-gaming.packages.${pkgs.system}.osu-stable
      nix-gaming.packages.${pkgs.system}.rocket-league
      nix-gaming.packages.${pkgs.system}.technic-launcher 
    ]; 
  };
}
