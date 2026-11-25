{ lib, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      {
        plugin = opencode-nvim;
        type = "lua";
        config = lib.fileContents ./opencode.lua;
      }
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-vsnip
      vim-vsnip
      {
        plugin = nvim-cmp;
        type = "lua";
        config = lib.fileContents ./nvim-cmp.lua;
      }
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = lib.fileContents ./gitsigns.lua;
      }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = "require('lualine').setup{options = {theme = 'onedark'}}";
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = lib.fileContents ./lspconfig.lua;
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          require('nvim-treesitter.config').setup {
            hightlight = {
              enable = true
            },

            autotag = {
              enable = true,
              filetypes = {
                "html",
                "javascript", "typescript",
                "typescript.glimmer", "javascript.glimmer",
                "javascriptreact", "typescriptreact",
                "markdown",
                "glimmer", "handlebars", "hbs", "svelte", "vue"
              }
            },

            indent = {
              enable = true,
            },
          }
        '';
      }
      onedarkpro-nvim
      plenary-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = lib.fileContents ./telescope.lua;
      }
    ];

    extraConfig = lib.fileContents ../vim/init.vim;
    initLua = lib.fileContents ./init.lua;
  };
}
