--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOTE: I have no idea what is happening here!!
--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

--Remap escape to leave terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', [[<c-\><c-n>]], {noremap = true})

--Add map to enter paste mode
vim.o.pastetoggle="<F3>"

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'
 
-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)


-- buffers
vim.api.nvim_set_keymap('n', '<leader>sh', "<cmd>split<CR>", { noremap=true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sv', "<cmd>vsplit<CR>", { noremap=true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', "<cmd>vertical resize +5<CR>", { noremap=true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', "<cmd>vertical resize -5<CR>", { noremap=true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Up>', "<cmd>resize +5<CR>", { noremap=true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', "<cmd>resize -5<CR>", { noremap=true, silent = true})

-- navigate buffers
vim.api.nvim_set_keymap('n', '<A-Left>', '<cmd>bprev<CR>', { noremap=true, silent = true})
vim.api.nvim_set_keymap('n', '<A-Right>', '<cmd>bnext<CR>', { noremap=true, silent = true})

-- lsp thingies
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent = true})
vim.api.nvim_set_keymap('n', '<C-i>', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap=true, silent = true})
vim.api.nvim_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap=true, silent = true})
vim.api.nvim_set_keymap('n', '<C-r>', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap=true, silent = true})

-- trouble
--
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>TroubleToggle<CR>', { noremap=true, silent = true})

-- telescope
vim.api.nvim_set_keymap('n', '<C-F>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>d', [[<cmd>Telescope diagnostics<cr>]], { noremap = true, silent = true})

-- golang
--
vim.api.nvim_set_keymap('n', '<leader>te', '<cmd>lua goTest()<CR>', { noremap=true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>lua goTestPackage()<CR>', { noremap=true, silent = true})
