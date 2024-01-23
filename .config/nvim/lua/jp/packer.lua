-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { 
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        }
    }

    use("folke/tokyonight.nvim") -- theme

    use {'nvim-treesitter/nvim-treesitter',
    requires = {'nvim-treesitter/nvim-treesitter-textobjects'},
    run = ':TSUpdate'
}

use('nvim-treesitter/playground')

use('theprimeagen/harpoon')

use('mbbill/undotree')

use('tpope/vim-fugitive') -- git

use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
        --- Uncomment these if you want to manage LSP servers from neovim
        {'williamboman/mason.nvim', opts= {
            ensure_installed = {
                "vue-language-server",
                "stylua",
                "prettierd",
                "eslint-lsp",
                "rust-analyzer",
                "typescript-language-server"
            }
        }},
        {'williamboman/mason-lspconfig.nvim'},

        -- LSP Support
        {'neovim/nvim-lspconfig'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
    }
}

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

end)
