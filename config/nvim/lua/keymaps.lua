-- keymaps.lua

-- General Keybindings
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- Keybinding to switch tabs in barbar
vim.api.nvim_set_keymap('n', '<leader>tn', ':BufferNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tp', ':BufferPrevious<CR>', { noremap = true })
