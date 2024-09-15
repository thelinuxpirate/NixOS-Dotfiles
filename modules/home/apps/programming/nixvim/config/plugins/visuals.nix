# Visual Plugins
{
  programs.nixvim = { # TODO add all plugins & modify after
    plugins = {
      dashboard = {
        enable = true;
        settings = {
          theme = "doom";
        };
      };

      lualine = {
        enable = true;
        extensions = [ "oil" ];
        theme = "nightfly";
      };

      indent-blankline.enable = true;
      conform-nvim.enable = true;
      comment.enable = true;
      nvim-colorizer.enable = true;
    };
  };
}
