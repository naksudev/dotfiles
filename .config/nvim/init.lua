-- Naksu's nvim config

-- Setups at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup and load plugins
require("lazy").setup({{ import = 'plugins' }})

-- Load user settings
require('user.settings')
require('user.keymaps')

-- Default theme
pcall(vim.cmd.colorscheme, 'catppuccin-mocha')

-- Env
vim.env.NVIM = 1
