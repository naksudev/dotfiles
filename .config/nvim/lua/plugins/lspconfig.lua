local Plugin = { "neovim/nvim-lspconfig" } 

Plugin.dependencies =  {
  {'hrsh7th/cmp-nvim-lsp'},
  {'williamboman/mason-lspconfig.nvim'},
}

function Plugin.config()
	-- Python
  vim.lsp.config.pyright = {}

  -- QML (custom server)
  vim.lsp.config.qmlls = {
		cmd = { "qmlls6" },
		filetypes = { "qml", "qmljs" }
	}

	vim.lsp.enable("qmlls")
	vim.lsp.enable("pyright")

	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
	vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
end

return Plugin
