require'nvim-tree'.setup {}

vim.api.nvim_set_keymap('n', '<F3>', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent=true})
