# TRONG owner of TheTreeHouse
{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.thepiratebay; let
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
  };
}
