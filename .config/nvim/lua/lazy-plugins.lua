-- [/ Configure and install plugins /]
require('lazy').setup({
  checker = { enabled = true },

  require('plugins.barbar'),

  require('plugins.catpuccin'),

  require('plugins.cmp'),

  require('plugins.fzf-oil'),

  require('plugins.gitsigns'),

  require('plugins.highlight-colors'),

  require('plugins.lspconfig'),

  require('plugins.lualine'),

  require('plugins.todo-comments'),

  require('plugins.treesitter'),
})
