# Util Plugins
{
  programs.nixvim = {
    plugins = {
      nvim-autopairs.enable = true;

      telescope = {
        enable = true;
        extensions = {
          file-browser = {
            enable = true;
            settings = {
              theme = "ivy";

              hijack_netrw = false;
              grouped = true;
              prompt_path = true;
              hidden = {
                file_browser = true;
                folder_browser = true;
              };

              mappings.n = {
                "<M-j>" = "move_selection_next";
                "<M-k>" = "move_selection_previous";
              };
            };
          };
        };
      };

      trim.enable = true;

      oil = {
        enable = true;
      };

      presence-nvim = {
        enable = true;
        enableLineNumber = true;
        debounceTimeout = 1.8;
        showTime = true;

        fileExplorerText = "Zooming through %s";
        gitCommitText = "TRONGs on Git again...";
        neovimImageText = "The Declarative Editor";
      };
    };
  };
}
