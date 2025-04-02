local Plugin = { 'nvimdev/dashboard-nvim' } 

Plugin.dependencies = {
	{'nvim-tree/nvim-web-devicons'},
}

Plugin.opts = {
	event = 'VimEnter',

}

return Plugin
