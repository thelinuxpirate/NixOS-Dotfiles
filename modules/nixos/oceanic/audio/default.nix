# Oceanic audio preset
{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  inherit (inputs) nix-gaming;
  cfg = config.oceanic.audio;
in {
  options.oceanic.audio = with types; {
    enable = mkBoolOpt false "Whether or not to enable the Oceanic audio preset";
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

        lowLatency = { # Provided by 'nix-gaming'
          enable = true;
          quantum = 64;
          rate = 48000;
        };
      };
    };
    
    # Enables pipewire realtime-capable
    security.rtkit.enable = true;

    environment.systemPackages = with pkgs; [
      pkgs.bluetuith
      pkgs.blueberry
    ];
  };
}
