{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.oceanic.fonts;
in {
  options.oceanic.fonts = with types; {
    enable = mkBoolOpt false "Whether or not to manage fonts";
    fonts = mkOpt (listOf package) [] "Custom font packages to install";
  };

  config = mkIf cfg.enable {
    environment.variables = {
      LOG_ICONS = "true"; # Enable icons in tooling for nerdfonts
    };

    environment.systemPackages = with pkgs; [ pkgs.font-manager ];

    fonts = {
      packages = with pkgs; [
        pkgs.comic-mono
        pkgs.font-awesome
        pkgs.nerdfonts
        pkgs.minecraftia
      ];
      fontDir.enable = true;
      fontconfig = {
        defaultFonts = {
          serif = [ "Comic Mono" ];
          sansSerif = [ "Comic Mono" ];
          monospace = [ "Comic Mono" ];
        };
      };
    };
  };
}
