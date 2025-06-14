# Utility packages (TODO include sops-nix?)
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
  cfg = config.oceanic.utils;
in {
  options.oceanic.utils = with types; {
    enable = mkBoolOpt false "Enables TheTreeHouse configuration options";
  };

  config = mkIf cfg.enable {
    security.doas = {
      enable = true;
      wheelNeedsPassword = false;
    };

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = [ pkgs.amdvlk ];
        extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
      };
    };

    programs = {
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    environment.systemPackages = [
      pkgs.appimage-run
      pkgs.nix-prefetch-git
      pkgs.glxinfo
      pkgs.vulkan-tools
      pkgs.networkmanagerapplet
      pkgs.fastfetch
    ];
  };
}
