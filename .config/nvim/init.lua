-- This is my personal Neovim configuration supporting Linux and Windows (not tested on Mac), with a bunch of plugins.
-- I tried to make my configuration as simple as possible to have a sort of plug-n-play feeling.
-- I don't recommend using this configuration but rather taking the overall structure of it if you're searching
-- for a starting point of your own Neovim configuration.

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
