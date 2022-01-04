-- Install packer
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'                            -- Package manager
  use 'tpope/vim-fugitive'                                -- Git commands in nvim
  use 'tpope/vim-commentary'                              -- "gc" to comment visual regions/lines
  
  -- UI to select things (files, grep results, open buffers...)
  use {
    'nvim-telescope/telescope.nvim', 
    requires = {
      {'nvim-lua/popup.nvim'}, 
      {'nvim-lua/plenary.nvim'}
    } 
  }
  use 'Mofiqul/vscode.nvim'                               -- nvim should look like vscode
  use {                                                   -- fancy status line
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Add git related info in the signs columns and popups
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }
  -- add a "file-explorer" like interface
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',                     -- optional, for file icon
    }
  }

  use 'neovim/nvim-lspconfig'                             -- Collection of configurations for built-in LSP client

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'                                  -- Autocompletion plugin

  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'ray-x/lsp_signature.nvim'                          -- Show function/method signatures


  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  
  use 'gpanders/editorconfig.nvim'                        -- editorconfig support

end)

