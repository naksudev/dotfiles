local Plugin = { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" }

Plugin.config = function()
	local configs = require('nvim-treesitter.configs')

	configs.setup({
		ensure_installed = { "c", "lua", "python", "javascript", "html", "css", "yaml", "tsx", "typescript", "rust" },
		sync_install = false,
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true }
	})
end

return Plugin
