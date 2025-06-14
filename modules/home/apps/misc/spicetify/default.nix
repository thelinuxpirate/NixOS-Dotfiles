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
  inherit (inputs) spicetify-nix;
  cfg = config.apps.misc.spicetify;
in {
  options.apps.misc.spicetify = with types; {
    enable = mkBoolOpt false "Whether or not to enable spicetify";
  };

  config = mkIf cfg.enable {
    programs.spicetify = {
      enable = true;

      # Currently managed by Stylix
      #theme = spicetify-nix.legacyPackages.${pkgs.system}.themes.comfy;
      #colorScheme = "catppuccin-macchiato";

      enabledCustomApps = with spicetify-nix.legacyPackages.${pkgs.system}.apps; [
        localFiles
        lyricsPlus
      ];

      enabledExtensions = with spicetify-nix.legacyPackages.${pkgs.system}.extensions; [
        shuffle
        webnowplaying
        groupSession
        playlistIcons
        fullAlbumDate
        fullAppDisplayMod
        goToSong
        songStats
        showQueueDuration
        copyToClipboard
        lastfm
        #adblock
      ];
    };
  };
}
