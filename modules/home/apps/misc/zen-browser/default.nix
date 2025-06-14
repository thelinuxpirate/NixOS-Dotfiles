# Zen Browser (modified Firefox)
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
  cfg = config.apps.misc.zen-browser;
in {
  options.apps.misc.zen-browser = with types; {
    enable = mkBoolOpt false "If enabled installs the Zen Browser";
  };

  config = mkIf cfg.enable {
    programs.zen-browser = {
      enable = true;
      nativeMessagingHosts = [ pkgs.firefoxpwa ];
      policies = { 

      };
    };
  };
}
