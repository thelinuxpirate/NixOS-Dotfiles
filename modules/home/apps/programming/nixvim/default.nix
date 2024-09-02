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
    # Install NeoVide
    home.packages = [ pkgs.neovide ];

    # Enables NixVim
    programs.nixvim = {
      enable = true;
      enableMan = true;
      vimAlias = true;
      colorschemes.tokyonight.enable = true;
    };
  };

  # Import NixVim configuration modules
  imports = [
    ./config/options.nix
    ./config/mappings.nix
    ./config/plugins/telescope.nix
  ];
}
