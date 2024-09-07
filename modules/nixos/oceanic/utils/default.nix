# Utility packages (TODO include sops-nix?)
{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.oceanic.utils;
in {
  options.oceanic.utils = with types; {
    enable = mkBoolOpt false "Whether or not to manage fonts";
  };

  config = mkIf cfg.enable {
    security.doas = {
      enable = true;
      wheelNeedsPassword = false;
    };

    programs = {
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    environment.systemPackages = with pkgs; [
      pkgs.appimage-run
      pkgs.nix-prefetch-git
      pkgs.glxinfo
      pkgs.vulkan-tools
      pkgs.networkmanagerapplet
      pkgs.fastfetch
    ];
  };
}
