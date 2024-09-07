# Sleepy-DWM Nix port 
{
  inputs,
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.thepiratebay; let
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
          rev = "master"; # 47981b8d375edd044bf230d1009cbdf576a9922e
          sha256 = "0f1pmnbnrz61qs9h713iahvjfa7qiar73s5gy6jgk8dmgjbk2cwk";
        };
        nativeBuildInputs = [ pkgs.imlib2 ];
      });
    };

    sleepy = {
      enableSlstatus = true;
      enableDmenu = true;
    };

    environment.systemPackages = with pkgs; [
      # Desktop dependencies
      pkgs.alacritty
      pkgs.feh
      pkgs.picom
      pkgs.dunst
      pkgs.flameshot

      # Applications used with Sleepy-DWM
      pkgs.xfce.thunar
      pkgs.xfce.thunar-volman
      pkgs.xfce.thunar-dropbox-plugin
      pkgs.xfce.thunar-archive-plugin
      pkgs.xfce.thunar-media-tags-plugin
      pkgs.xfce.tumbler
      pkgs.file-roller
      pkgs.pavucontrol
    ];
  };
}
