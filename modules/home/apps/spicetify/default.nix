{
  options,
  config,
  pkgs,
  lib,
  spicetify-nix,
  ...
}:
with lib;
with lib.thepiratebay; let
  cfg = config.apps.spicetify;
  # spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in {
  options.apps.spicetify = with types; {
    enable = mkBoolOpt false "Whether or not to enable spicetify";
  };

  config = mkIf cfg.enable {
    programs.spicetify = {
      enable = true;

      injectCss = true;
      replaceColors = true;
      overwriteAssets = true;

      sidebarConfig = true;
      theme = spicetify-nix.packages.${pkgs.system}.default.themes.Sleek;
      colorScheme = "BladeRunner";

      enabledCustomApps = with spicetify-nix.packages.${pkgs.system}.default.apps; [
        localFiles
        lyrics-plus
      ];

      enabledExtensions = with spicetify-nix.packages.${pkgs.system}.default.extensions; [
        autoSkipVideo
        bookmark
        keyboardShortcut
        shuffle
        webnowplaying
        groupSession
        playlistIcons
        fullAlbumDate
        fullAppDisplayMod
        goToSong
        listPlaylistsWithSong
        wikify
        songStats
        showQueueDuration
        copyToClipboard
        lastfm
        adblock
      ];
    };
  };
}
