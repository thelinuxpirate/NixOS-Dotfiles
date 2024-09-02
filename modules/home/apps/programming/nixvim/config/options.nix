{
  programs.nixvim = {
    opts = {
      cursorline = true;
      relativenumber = true;
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
  };
}
