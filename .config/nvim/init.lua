--[[
Welcome to my Neovim configuration!

This file is just the entrypoint to other files
and contains global configuration for Neovim.

It is also worth mentionning that this configuration 
is heavily based on https://github.com/dam9000/kickstart-modular.nvim
which is a fork of https://github.com/nvim-lua/kickstart.nvim.

⣠⣤⣄⣾⣿⡷⣠⣴⣶⣿⣿⣿⣿⣿⣿⣷⣶⣤⡀
⠀⣼⠋⠀⣾⡟⣳⣾⣿⡿⣿⣿⣿⠟⣿⣿⣿⣿⣿⣿⣿⣷⣄
⠀⡇⠀⠀⠉⢱⣿⣿⡿⢰⣿⣿⠃⢰⣿⣿⣿⣿⣿⡟⢿⣿⣿⣷
⠀⠁⠀⠀⠀⣿⣿⣿⠇⣼⣿⠇⡀⢸⡿⣿⣿⣿⡿⠁⢸⣿⣿⣿⡇
⠀⠀⠀⠀⢰⢰⣿⡿⢀⣸⣿⣤⣿⡈⡇⢿⣿⡿⢁⡎⢸⣿⡇⣿⣿
⠀⠀⠀⠀⣼⢸⣿⡇⣸⣤⣶⣶⣤⣽⣷⣼⡯⠐⠿⢇⣿⡿⠀⣿⣿
⠀⠀⠀⠀⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣹⡦⠂⣿⣿
⠀⠀⠀⠀⣿⡁⣿⡇⠻⣿⣿⣿⣧⣙⠛⣛⣿⣿⣿⣿⣿⠡⠂⣿⡏
⠀⠀⠀⠀⣿⣧⣙⡇⠲⢀⣉⠛⠛⠿⠿⠿⣿⣿⡿⠿⠋⣴⢀⣿⠃
⠀⠀⠀⣸⣿⡿⣿⡟⢠⣿⣿⢷⣦⢠⣤⣤⣤⠰⣶⣶⣿⠃⣼⣡

> ASCII art collected from Leivmox's Github ASCII-ART repo.
--]]

-- Set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalreader = ' '

vim.g.have_nerd_font = true

-- Setup options, keymaps and autocmds
require('options')
require('keymaps')
require('autocmds')

-- Setup and install plugins
require('lazy-install')
require('lazy-plugins')

-- Environment variable
vim.env.NVIM = 1
