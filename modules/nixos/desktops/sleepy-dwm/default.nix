# Sleepy-DWM Nix port
{
  inputs,
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  inherit (inputs) sleepy-dwm;
  cfg = config.desktops.sleepy-dwm;
in {
  options.desktops.sleepy-dwm = with types; {
    enable = mkBoolOpt false "Whether or not to enable Sleepy-DWM";
    # NOTE DISPLAY MANAGERS WILL ALWAYS BE MANAGED BY THE HOST NOT A MODULE
  };

  config = mkIf cfg.enable {
    services.xserver.windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs (oldAttrs: rec {
        pname = "sleepy-dwm";
        version = "6.5";
        src = pkgs.fetchFromGitHub {
          owner = "thelinuxpirate";
          repo = "sleepy-dwm";
          rev = "master"; # 38a7b5b
          sha256 = "1p1z6xfkiilvkm32zf24qddnvxmay57hxrrm6az0xw285j17w50g";
        };
        nativeBuildInputs = oldAttrs.nativeBuildInputs or [] ++ [ pkgs.imlib2 ];
      });
    };

    sleepy = {
      enableSlstatus = false;
      enableDmenu = true;
    };

    environment.systemPackages = with pkgs; [
      # Desktop dependencies
      pkgs.alacritty
      pkgs.feh
      pkgs.pamixer
      pkgs.playerctl
      pkgs.brightnessctl
      pkgs.picom
      pkgs.dunst
      pkgs.flameshot

      # Applications used with Sleepy-DWM
      pkgs.nemo-with-extensions
      pkgs.file-roller
      pkgs.peazip
      pkgs.pavucontrol
    ];
  };
}
