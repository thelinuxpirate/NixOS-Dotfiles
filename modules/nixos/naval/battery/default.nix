{
  options,
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.naval.battery;
in {
  options.naval.battery = with types; {
    enable = mkBoolOpt false "Whether or not to enable battery optimizations and utils.";
  };

  config = mkIf cfg.enable {
    powerManagement.powertop.enable = true;

    services = {
      power-profiles-daemon.enable = false;
      system76-scheduler.settings.cfsProfiles.enable = true;
      thermald.enable = true;

      tlp = {
        enable = true;
        settings = {
          CPU_BOOST_ON_AC = 1;
          CPU_BOOST_ON_BAT = 0;
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        };
      };
    };
  };
}
