# Universal options that are enabled between ALL hosts;
{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.suites.common;
in {
  options.suites.common = with types; {
    enable = mkBoolOpt false "Enable the common suite";
  };

  config = mkIf cfg.enable {
    hardware.networking.enable = true;
    networking.networkmanager.enable = true;

    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };
    };

    time.timeZone = "America/Los_Angeles";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    services.ssh.enable = true;

    environment.systemPackages = with pkgs; [
      pkgs.git
      pkgs.curl
      pkgs.pciutils
      pkgs.usbutils
      pkgs.tree
      pkgs.pfetch
    ];
  };
}