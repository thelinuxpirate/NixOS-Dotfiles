{
  config,
  lib,
  pkgs,
  osConfig,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; {
  snowfallorg.user = {
    enable = true;
    name = "trong";
  };

  themes.gtk.palenight.enable = true;

  home.stateVersion = lib.mkDefault (osConfig.system.stateVersion or "24.05");
}
