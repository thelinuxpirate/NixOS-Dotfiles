{
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };

      cmp-calc.enable = true;
      cmp-dap.enable = true;
      cmp-dictionary.enable = true;
      cmp-git.enable = true;
      cmp-latex-symbols.enable = true;
      cmp-npm.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-rg.enable = true;
      cmp-spell.enable = true;
      cmp-treesitter.enable = true;

      treesitter = {
        enable = true;
        folding = true;
      };

      treesitter-textobjects.enable = true;
    };
  };
}
