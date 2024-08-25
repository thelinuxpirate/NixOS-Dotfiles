{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.oceanic.audio;
in {
  options.oceanic.audio = with types; {
    enable = mkBoolOpt false "Whether or not to manage fonts";
  };

  config = mkIf cfg.enable {
    hardware = {
      pulseaudio.enable = false;

      bluetooth = { 
        enable = true;
        powerOnBoot = true;
      };
    };

    services = {
      jack.loopback.enable = true;

      pipewire = {
        enable = true;
        wireplumber.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };
    };
  };
}
