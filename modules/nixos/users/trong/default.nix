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
    create = mkBoolOpt false "Create the TRONG user";
  };

  config = mkIf cfg.create {
    snowfallorg.users.trong = {
      create = true;
      admin = true;

      home = {
        enable = true;
        name = "/home/trong/";
      };
    };
  };
}
