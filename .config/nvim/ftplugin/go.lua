-----------------------------------------------------------------------------
-- specific keymap for go debug 
-----------------------------------------------------------------------------

-- debug test
vim.keymap.set('n', '<leader>dt', ':lua require(\'dap-go\').debug_test()<CR>', opts)

