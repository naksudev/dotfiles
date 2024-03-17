local Plugin = { 'romgrk/barbar.nvim' }

Plugin.dependencies = {
	'lewis6991/gitsigns.nvim', 
	'nvim-tree/nvim-web-devicons', 
}

function Plugin.init()
	vim.g.barbar_auto_setup = true 
end

return Plugin
