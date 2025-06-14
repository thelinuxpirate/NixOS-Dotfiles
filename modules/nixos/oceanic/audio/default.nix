# Oceanic audio preset
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
  inherit (inputs) nix-gaming;
  cfg = config.oceanic.audio;
in {
  options.oceanic.audio = with types; {
    enable = mkBoolOpt false "Whether or not to enable the Oceanic audio preset";
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;

    hardware = {
      bluetooth = { 
        enable = true;
        powerOnBoot = true;
      };
    };

    services = {
      pulseaudio.enable = false;
      jack.loopback.enable = true;

      pipewire = {
        enable = true;

        wireplumber.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;

        lowLatency = { # Provided by 'nix-gaming'
          enable = true;
          quantum = 64;
          rate = 48000;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      pkgs.bluetuith
      pkgs.blueberry
    ];
  };
}
