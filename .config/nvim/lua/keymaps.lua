-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.g.mapleader = " "

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)


-----------------
-- Telescope   --
-----------------

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-----------------
-- Nvim-Tree   --
-----------------

vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', opts)

-----------------
-- Testing     --
-----------------

vim.keymap.set('n', '<leader>tr', ':Neotest run<CR>', opts)
vim.keymap.set('n', '<leader>ts', ':Neotest summary<CR>', opts)
vim.keymap.set('n', '<leader>to', ':Neotest output<CR>', opts)
vim.keymap.set('n', '<leader>tp', ':Neotest output-panel<CR>', opts)

-----------------
-- Debugging   --
-----------------

vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>', opts)
vim.keymap.set('n', '<leader>dr', ':lua require(\'dap\').continue()<CR>', opts)
vim.keymap.set('n', '<C-r>', ':DapToggleRepl<CR>', opts)
vim.keymap.set('n', '<F10>', ':DapStepOver<CR>', opts)
vim.keymap.set('n', '<F11>', ':DapStepInto<CR>', opts)
vim.keymap.set('n', '<F5>', ':DapContinue<CR>', opts)
vim.keymap.set('n', '<leader>ds', ':lua dap_show_scopes_floating()<CR>', opts)
vim.keymap.set('n', '<leader>df', ':lua dap_view_current_frames()<CR>', opts)
vim.keymap.set('n', '<leader>dx', ':DapTerminate<CR>', opts)

