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
  cfg = config.theme.stylix;
in {
  options.theme.stylix = with types; {
    enable = mkBoolOpt false "Enables control via Stylix";
  };

  config = mkIf cfg.enable {
    stylix.targets = {
      alacritty.enable = false;
      neovim.enable = false;
      nixvim.enable = false;
      spicetify.enable = false;
      waybar.enable = false;
      wezterm.enable = false;
    };
  };
}
