vim.cmd [[
call plug#begin('~/.config/nvim/plugged')
]]

vim.cmd [[
let g:airline_theme = 'catppuccin'
let g:coc_global_extensions = [ 'coc-json', 'coc-git', 'coc-markdownlint', 'coc-marketplace', 'coc-snippets', 'coc-highlight' ]
]]

vim.cmd [[
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'vim-airline/vim-airline'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'elkowar/yuck.vim'
Plug 'wuelnerdotexe/vim-astro'
]]

vim.cmd [[
call plug#end()
]]

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
    },
})

vim.cmd.colorscheme "catppuccin"

-- TREE-SITTER-ASTRO

-- NVIM-TREE SETUP
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup()

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 28,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- BARBAR MAPPING
vim.cmd [[
nnoremap <silent>    <C-w> <Cmd>BufferClose<CR>
nnoremap <silent>    <A-Left> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-Right> <Cmd>BufferNext<CR>
noremap <silent>     <C-n> <Cmd>enew<CR>
]]

-- COC CONFIGURATION
vim.cmd [[
autocmd CursorHold * silent call CocActionAsync('highlight')
]]

-- SHOW LINE NUMBERS
vim.cmd [[
set number
]]

