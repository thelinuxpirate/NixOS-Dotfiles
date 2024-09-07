# Wezterm Terminal (Xorg + Wayland)
{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.apps.misc.terms.wezterm;
in {
  options.apps.misc.terms.wezterm = with types; {
    enable = mkBoolOpt false "If enabled installs WezTerm & applies configuration";
  };

  config = mkIf cfg.enable {
    programs = {
      wezterm = {
        enable = true;
	enableZshIntegration = true;
	extraConfig = builtins.readFile ./wezterm.lua;
      }; 
    };
  };
}
