-- [/ Options /]

-- show line numbers
vim.opt.number = true

-- enable 24-bit RGB colors
vim.opt.termguicolors = true

-- don't show mode (INSERT,VISUAL,etc.) in commandline (lualine already show this)
vim.opt.showmode = false

-- wrapped lines keeps the identation of the original line
vim.opt.breakindent = true

-- Persist undo history to disk between sessions
vim.opt.undofile = true

-- case-insensitive search unless the search pattern contains an uppercase letter
vim.opt.ignorecase = true
vim.opt.smartcase = true 

-- vsplit opens to the right and split opens below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- show invisible character (per listchars)
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- live preview substitutions in a split as you type
vim.opt.inccommand = 'split'

-- highlight the line the cursor is on
vim.opt.cursorline = true

-- keep at least 10 lines visible above and below when scrolling
vim.opt.scrolloff = 10

-- use spaces instead of tab characters
-- a tab character is displayed as 4 spaces
-- indent operations (>>, <<, autoindent..) uses 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

