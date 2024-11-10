# GameDev Utils
{
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.apps.programming.gamedev;
in {
  options.apps.programming.gamedev = with types; {
    enable = mkBoolOpt false "If enabled installs gamedev utils";
  };

  config = mkIf cfg.enable {
    # 'DevKitPro' has nix flakes
    home.packages = [
      pkgs.godot_4 # Game engine
      pkgs.gdtoolkit_4 # Tools for GDScript

      pkgs.blender # 3D rendering
      pkgs.krita # Misc drawing app
      pkgs.pixelorama # Pixel art 
    ]; 
  };
}
