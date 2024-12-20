# Custom Proton/Wine Packages
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
  cfg = config.apps.gaming.extras.proton;
in {
  options.apps.gaming.extras.proton = with types; {
    enable = mkBoolOpt false "Whether or not to enable custom proton options";
  };

  config = mkIf cfg.enable { # (Proton-GE now has support via programs.steam)
    home.packages = [
      nix-gaming.packages.${pkgs.system}.wine-ge
      #nix-gaming.packages.${pkgs.system}.vkd3d-proton
      #nix-gaming.packages.${pkgs.system}.wine-osu
      #nix-gaming.packages.${pkgs.system}.wine-tkg
    ];
  };
}
