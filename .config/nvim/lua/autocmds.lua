-- [/ Autocmds /]

-- Highlight yanked text briefly
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = 'HiSearch', timeout = 800 })
  end,
})
