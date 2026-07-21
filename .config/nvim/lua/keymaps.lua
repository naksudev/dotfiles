-- [/ Keymaps /]
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Barbar
map('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-Right>', '<Cmd>BufferNext<CR>', opts)

map('n', '<A-&>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-é>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-">', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-\'>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-(>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-->', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-è>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-_>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-ç>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-à>', '<Cmd>BufferLast<CR>', opts)

map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

