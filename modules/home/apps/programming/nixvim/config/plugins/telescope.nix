{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
	extensions.file-browser.enable = true;
      };
    };
  };  
}
