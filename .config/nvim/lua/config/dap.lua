widgets = require('dap.ui.widgets')

dap_show_scopes_floating = function()
    widgets.centered_float(widgets.scopes)
end

dap_view_current_frames = function()
    local my_sidebar = widgets.sidebar(widgets.frames)
    my_sidebar.open()
end

-- change the dap breakpoint symbol
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	desc = "prevent colorscheme clears self-defined DAP icon colors.",
	callback = function()
		vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939' })
		vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef' })
		vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379' })
	end
})

vim.fn.sign_define('DapBreakpoint', { text=' ●', texthl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text=' ◆', texthl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text=' ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text=' ', texthl='DapLogPoint' })
vim.fn.sign_define('DapStopped', { text=' ', texthl='DapStopped' })

