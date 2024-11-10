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
  cfg = config.oceanic.theme;
in {
  options.oceanic.theme = with types; {
    enable = mkBoolOpt false "Enables the Oceanic theme";
    fonts = mkOpt (listOf package) [] "Custom font packages to install";
  };

  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      autoEnable = true;
      targets.grub.enable = false;

      image = ./default.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

      cursor = {
        package = pkgs.numix-cursor-theme;
        name = "Numix-Cursor-Light";
        size = 20;
      };
    };

    environment = {
      systemPackages = with pkgs; [ pkgs.font-manager ];
      variables = {
        LOG_ICONS = "true";
      };
    };

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
