# TRONG maintainer of ThePirateBay & owner of TheTreeHouse
{
  options,
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.users.trong;
in {
  options.users.trong = with types; {
    create = mkBoolOpt false "Creates the TRONG user";
  };

  config = mkIf cfg.create {
    snowfallorg.users.trong = {
      create = true;
      admin = true;
    };

    services.udev.packages = with pkgs; [
      platformio-core.udev
    ];
  };
}
