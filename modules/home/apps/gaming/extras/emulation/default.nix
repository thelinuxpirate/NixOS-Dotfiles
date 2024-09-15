# Emulators
{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.apps.gaming.extras.emulation;
in {
  options.apps.gaming.extras.emulation = with types; {
    enable = mkBoolOpt false "Whether or not to enable emulators";
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.dolphin-emu
      pkgs.cemu
      pkgs.ryujinx # TODO replace with Suyu when supported
      pkgs.rmg-wayland
      pkgs.lime3ds
      pkgs.vbam
      pkgs.desmume
      pkgs.snes9x-gtk
      pkgs.rpcs3
      pkgs.pcsx2
    ]; 
  };
}
