return {
  -- LSP plugins
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  { 'Bilal2453/luvit-meta', lazy = true },

  {
    'neovim/nvim-lspconfig',

    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      { 'j-hui/fidget.nvim', opts = {} },
    },

    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        pyright = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }, -- stops "undefined global `vim`" warnings
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
      }

      require('mason').setup()

      local ensured_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensured_installed, {
        'stylua',
        'lua-language-server',
      })
      require('mason-tool-installer').setup({ ensure_installed = ensured_installed })

      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          end,
        },
      })
    end,
  },

  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format({ async = true })
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },
}
