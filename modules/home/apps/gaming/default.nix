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
  inherit (inputs) nixpkgs-stable;
  stablePkgs = import nixpkgs-stable { system = pkgs.stdenv.hostPlatform.system; };
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
      pkgs.wineWowPackages.waylandFull
      pkgs.winetricks

      stablePkgs.grapejuice
    ];
  };
}
