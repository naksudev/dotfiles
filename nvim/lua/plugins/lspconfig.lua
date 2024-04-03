local Plugin = { "neovim/nvim-lspconfig" } 

Plugin.dependencies =  {
  {'hrsh7th/cmp-nvim-lsp'},
  {'williamboman/mason-lspconfig.nvim'},
}

function Plugin.config()
	local lspconfig = require('lspconfig')

	lspconfig.ruff_lsp.setup {}
	lspconfig.bashls.setup {}

	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
	vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
end

return Plugin
