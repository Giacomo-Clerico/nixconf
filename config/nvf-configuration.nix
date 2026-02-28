{ pkgs, ...}:
{
  programs.nvf = {
    enable = true;
    settings.vim ={
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };

      options.number = true;
      options.relativenumber = false;  

      # for ff or fg open currently edited folder  
      projects.project-nvim = {
        enable = true;
        setupOpts = {
        manual_mode = false; 
          detection_methods = [ "lsp" "pattern" ];
          patterns = [ "flake.nix" ".git" "Makefile" "package.json" ];
          silent_chdir = false; 
        };
      };  

      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
      lsp.enable = true;
      languages = {
        enableTreesitter = true;

        nix.enable = true;
        python = {
          enable = true;
          format.enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };
      };
    };
  };
}
