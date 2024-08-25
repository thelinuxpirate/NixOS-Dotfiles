# Custom Proton/Wine suites

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
  cfg = config.suites.proton;
in {
  options.oceanic.audio = with types; {
    enable = mkBoolOpt false "Whether or not to enable custom proton options";
  };

  config = mkIf cfg.enable { # (Proton-GE now has support via programs.steam)
    environment.systemPackages = with pkgs; [
      nix-gaming.packages.${pkgs.system}.vkd3d-proton
      nix-gaming.packages.${pkgs.system}.northstar-proton
      nix-gaming.packages.${pkgs.system}.wine-ge
      nix-gaming.packages.${pkgs.system}.wine-osu
      nix-gaming.packages.${pkgs.system}.wine-tkg
    ];
  };
}
