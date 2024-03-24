-- define your colorscheme here
-- local colorscheme = 'catppuccin-mocha'
-- local colorscheme = 'rose-pine-moon'
-- local colorscheme = 'papercolor'
local colorscheme = 'vscode'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

