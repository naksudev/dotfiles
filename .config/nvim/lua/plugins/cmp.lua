local Plugin = { 'hrsh7th/nvim-cmp' }

Plugin.dependencies = {
  -- Sources
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-cmdline' },

  -- Snippet Engine
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
}

Plugin.config = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
		snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
		window = {
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
			{ name = "path" },
			{ name = "cmd" },
    }),
  })
end

return Plugin

