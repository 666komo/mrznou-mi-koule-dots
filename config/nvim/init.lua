-- init.lua

vim.cmd([[packadd packer.nvim]])

-- Load basic settings, theme, keymaps, etc.
require('settings')    -- General settings
require('keymaps')     -- Key bindings
require('theme')       -- Theme settings

-- Load plugin manager and install plugins
require('plugins')

-- Set up LSP
require('lsp')
