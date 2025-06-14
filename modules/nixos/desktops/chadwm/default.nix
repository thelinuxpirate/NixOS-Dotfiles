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
  inherit (inputs) chadwm;
  cfg = config.desktops.chadwm;
in {
  options.desktops.chadwm = with types; {
    enable = mkBoolOpt false "Whether or not to enable ChadWM";
    # NOTE DISPLAY MANAGERS WILL ALWAYS BE MANAGED BY THE HOST NOT A MODULE
  };

  config = mkIf cfg.enable {
    services.xserver.windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs (oldAttrs: rec {
        pname = "chadwm";
        version = "6.5";
        src = pkgs.fetchFromGitHub {
          owner = "thelinuxpirate";
          repo = "ChadWM";
          rev = "main";
          sha256 = "0lfy05rnk2g9s4nv63bx2vp4f3yi83v6m7v326k5bjvc8z1jaxgb";
        };
        nativeBuildInputs = oldAttrs.nativeBuildInputs or [] ++ [ pkgs.imlib2 ];
      });
    };

    chadwm.enableDmenu = true;

    environment.systemPackages = with pkgs; [
      # Desktop dependencies
      pkgs.dash
      pkgs.feh
      pkgs.pamixer
      pkgs.playerctl
      pkgs.brightnessctl
      pkgs.picom
      pkgs.dunst
      pkgs.flameshot

      # Applications used with ChadWM
      pkgs.nemo-with-extensions
      pkgs.file-roller
      pkgs.pavucontrol
    ];
  };
}
