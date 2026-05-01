vim.lsp.enable('cssls')
vim.lsp.enable('bashls')
vim.lsp.enable('dockerls')
vim.lsp.enable('ember')

vim.lsp.config('eslint', {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

vim.lsp.enable('gopls')
vim.lsp.enable('html')
vim.lsp.enable('jdtls')
vim.lsp.enable('jsonls')
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc')) then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
})
vim.lsp.enable('marksman')
vim.lsp.enable('nginx_language_server')
vim.lsp.enable('nixd')
vim.lsp.enable('pylyzer')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('stylelint_lsp')
vim.lsp.enable('stylelint_lsp')
vim.lsp.enable('svelte')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('terraformls')
vim.lsp.enable('texlab')
vim.lsp.enable('ts_ls')
vim.lsp.enable('vimls')
vim.lsp.enable('yamlls')
vim.lsp.enable('zk')
