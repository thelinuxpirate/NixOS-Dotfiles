# NixVim build
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
  cfg = config.apps.programming.nixvim;
in {
  options.apps.programming.nixvim = with types; {
    enable = mkBoolOpt false "Whether or not to enable NixVim";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.neovide ];

    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      enableMan = true;
      vimAlias = true;
      colorschemes.tokyonight.enable = true;
    };
  };

  # Import NixVim configuration modules
  imports = [
    ./config/options.nix
    ./config/mappings.nix
    ./config/plugins/utils.nix
    ./config/plugins/visuals.nix
    ./config/plugins/lsp.nix
  ];
}
