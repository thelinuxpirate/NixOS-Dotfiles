# Util Plugins
{
  programs.nixvim = {
    plugins = {
      nvim-autopairs.enable = true;


      telescope = {
        enable = true;
        extensions.file-browser.enable = true;
      };

      trim.enable = true; 

      oil = {
        enable = true;
      };
    };
  };  
}
