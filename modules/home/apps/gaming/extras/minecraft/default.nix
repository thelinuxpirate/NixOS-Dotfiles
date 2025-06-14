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
  inherit (inputs) nix-minecraft;
  inherit (inputs) nix-minecraft-launcher;
  cfg = config.apps.gaming.extras.minecraft;
in {
  options.apps.gaming.extras.minecraft = with types; {
    enable = mkBoolOpt false "Whether or not to enable minecraft options";
  };

  config = mkIf cfg.enable { 
    home.packages = [ 
      pkgs.prismlauncher
      pkgs.lunar-client
    ];
  };
}
