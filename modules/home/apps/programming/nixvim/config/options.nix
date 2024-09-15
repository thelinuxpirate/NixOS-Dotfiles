{
  programs.nixvim = {
    opts = {
      cursorline = true;
      relativenumber = false;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      mouse = "a";
      showmode = false;
      breakindent = true;
      undofile = true;
      ignorecase = false;
      smartcase = true;
      timeoutlen = 283;
      splitright = true;
      splitbelow = true;
      scrolloff = 15;
      hlsearch = true;
    };

    extraConfigLua = builtins.readFile ./lua/options.lua;
  };
}
