local Plugin = { "iamcco/markdown-preview.nvim" }

Plugin.build = "cd app && yarn install"

Plugin.cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" }

function Plugin.init()
	vim.g.mkdp_filetypes = { "markdown" }
end

Plugin.ft = { "markdown" }

return Plugin
