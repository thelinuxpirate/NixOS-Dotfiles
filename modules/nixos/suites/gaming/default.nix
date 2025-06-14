# TRONGs version of Steam settings (useable between ALL hosts)
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
  cfg = config.suites.gaming;
in {
  options.suites.gaming = with types; {
    enable = mkBoolOpt false "Whether or not to enable Steam gaming options";
  };

  config = mkIf cfg.enable { 
    programs = {
      steam = {
        enable = true;
        
        extest.enable = true;
        gamescopeSession.enable = true;
        protontricks.enable = true;
        platformOptimizations.enable = true;

        extraPackages = [
          pkgs.mangohud
          pkgs.protonup-ng
        ];
        extraCompatPackages = [ 
          pkgs.proton-ge-bin 
        ];
      };

      gamemode = {
        enable = true;
        enableRenice = true;
      };
    };
  };
}
