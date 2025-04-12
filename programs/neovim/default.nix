{ lib, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      coq-artifacts
      {
        plugin = coq_nvim;
        type = "lua";
        config = ''
          vim.g.coq_settings = {
            auto_start = 'shut-up',
            weights = {
              recency = 2.5,
            },

            clients = {
              buffers = {
                enabled = true,
                weight_adjust = -1.9,
                same_filetype = true,
              },
              tree_sitter = {
                enabled = true,
                weight_adjust = 1.0
              },
              lsp = {
                enabled = true,
                weight_adjust = 1.5
              },
              snippets = {
                enabled = true,
                weight_adjust = -1.9
              },
            },
          }
        '';
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
          require('nvim-treesitter.configs').setup {
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
    extraLuaConfig = lib.fileContents ./init.lua;
  };
}
