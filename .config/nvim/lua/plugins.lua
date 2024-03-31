-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies". 
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ---------------------------------------
    -- NOTE: PUT YOUR THIRD PLUGIN HERE --
    ---------------------------------------

    -- colorscheme
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "rose-pine/neovim", name = "rose-pine" }
    use { "NLKNguyen/papercolor-theme", as = "papercolor" }
    use { "Mofiqul/vscode.nvim", as = "vscode" }
    use { "Mofiqul/dracula.nvim", as = "dracula" }
    use { "Shatur/neovim-ayu" }
    
    -- telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-lua/plenary.nvim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- auto-complete & more
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }    
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' } 
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }        -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }          -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }       -- cmdline auto-completion
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- lsp 
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 
        'mfussenegger/nvim-jdtls',
        requires = { 
            'mfussenegger/nvim-dap', 
        }
    }
    use 'onsails/lspkind.nvim'

    -- icon style
    use { 'nvim-tree/nvim-web-devicons' }

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- nvim-tree
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }

    -- neotest: enable the relevant test-adapters
    use({
      "nvim-neotest/neotest",
      requires = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",

        -- neotest: TODO test-adapters
        
        "nvim-neotest/neotest-go",
        "rcasia/neotest-java",
      }
    })

    -- dap: debugger implementation via the Debug-Adapter-Protocol
    use { 'mfussenegger/nvim-dap' }
    use { 'leoluz/nvim-dap-go' }


    -- ------------------------------------------------------------------- --
    -- END OF custom plugins
    -- ------------------------------------------------------------------- --

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

