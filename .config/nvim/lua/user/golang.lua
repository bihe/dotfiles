-- reformat on write
vim.api.nvim_exec([[
  augroup golang 
    autocmd!
    autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
    autocmd BufWritePre *.go lua goimports(1000)
  augroup end
]], false)

function goimports(timeoutms)                                                                                                                                                                                                                           
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }
    
    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end  
    local action = actions[1]       
                                    
    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else 
      vim.lsp.buf.execute_command(action)
    end
end    

local function getWordUnderCursor()
  return vim.fn.expand("<cword>")
end

function goTest()
  local f = getWordUnderCursor()
  local fn = vim.api.nvim_buf_get_name(0)
  local goTestSuffix = '_test.go'
  
  local isTest = fn:sub(-string.len(goTestSuffix)) == goTestSuffix
  if isTest == true then
    -- if this is a golang-file determine root-path and execute test
    -- local nvim_lsp = require'lspconfig'
    -- local root_dir_fn = nvim_lsp.util.root_pattern('go.mod')
    -- local root_dir = root_dir_fn(fn)

    -- local buf_first_line = vim.api.nvim_buf_get_lines(0,0,1,false)[1]
    -- local i = 0
    -- local pkg = ''
    -- for token in string.gmatch(buf_first_line, "[^%s]+") do
    --   if i == 1 then
    --     pkg = token
    --     break
    --   end
    --   i = i +1
    -- end
    -- print('DEBUG: ' .. pkg)
    local path = __getPath(fn)
    local cmd = '!go test -v -run \'^' .. f .. '$\' ' .. path .. '...' 
    vim.api.nvim_command(cmd)
  end
end

function goTestPackage()
  local fn = vim.api.nvim_buf_get_name(0)
  local goTestSuffix = '_test.go'
  local isTest = fn:sub(-string.len(goTestSuffix)) == goTestSuffix
  if isTest == true then
    local path = __getPath(fn)
    local cmd = '!go test -v ' .. path .. '...' 
    vim.api.nvim_command(cmd)
  end
end

function __getPath(filename) 
    local t={}
    local sep = '/'
    for str in string.gmatch(filename, "([^"..sep.."]+)") do
      table.insert(t, str)
    end

    local path = '/'
    local i = 0
    local length = #(t)
    for index, value in ipairs(t) do
      if i == (length - 1) then
        break
      end
      path = path .. value .. '/'
      i = i + 1
    end
    return path
end
