-- plugins.lua

-- Use packer for plugin management
return require('packer').startup(function(use)
    -- Packer itself
    use 'wbthomason/packer.nvim'
  
    -- File icons for barbar.nvim
    use 'nvim-tree/nvim-web-devicons'
  
    -- Barbar.nvim (tabline)
    use {
      'romgrk/barbar.nvim',
      requires = {'nvim-tree/nvim-web-devicons'}
    }
  
    -- LSP configuration and completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'  -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'  -- LSP completion source
    use 'hrsh7th/cmp-buffer'  -- Buffer completion source
  
    -- Other plugins (e.g., treesitter, etc.)
    use 'nvim-treesitter/nvim-treesitter'
  
    -- Add more plugins as needed

    use 'EdenEast/nightfox.nvim'
    
  end)
  