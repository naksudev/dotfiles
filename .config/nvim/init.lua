-- This is my personal Neovim configuration supporting Linux and Windows (not tested on Mac), with a bunch of plugins.
-- I tried to make my configuration as simple as possible to have a sort of plug-n-play feeling.
-- I don't recommend using this configuration as there are a lot of problems. And because I am not familiar with Lua.

-- Setups at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load user settings
require('user.settings')
require('user.keymaps')

-- Setup and load plugins
require("lazy").setup({ 
	spec = { import = "plugins" }, 
	checker = { enabled = true }, 
})

-- Default theme
pcall(vim.cmd.colorscheme, 'catppuccin-mocha')

-- Env
vim.env.NVIM = 1
