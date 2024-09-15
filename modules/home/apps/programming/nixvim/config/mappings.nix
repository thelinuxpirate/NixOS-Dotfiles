{
  programs.nixvim = {
    globals.mapleader = ";";
    globals.maplocalleader = " ";

    plugins = {
      which-key = {
        enable = true;
      };
    };

    keymaps = [
      {
        mode = [ "n" ];
        key = "f";
        action = "<cmd>lua require('telescope').extensions.file_browser.file_browser({cwd = vim.fn.expand('%:p:h')})<cr>";
        options = {
          noremap = true;
        };
      }
    ];
  };
}
