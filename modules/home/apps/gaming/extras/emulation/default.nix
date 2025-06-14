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
      # NOTE: Use Citra via AppImage
      # pkgs.ryujinx
      # pkgs.cemu
      # pkgs.vbam
      # pkgs.pcsx2
      pkgs.dolphin-emu
      pkgs.rmg-wayland
      pkgs.desmume
      pkgs.snes9x-gtk
      pkgs.rpcs3
    ];
  };
}
