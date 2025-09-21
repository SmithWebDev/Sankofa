--- Colorschemes Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  'https://github.com/hyperb1iss/silkcircuit-nvim', {
    -- priority = 1000,
    config = function()
      require'smithwebdev.plugins.colorschemes.silkcircuit'
      vim.cmd[[colorscheme silkcircuit]]
    end
  }
)


-- --- Navigation Plugins
-- --------------------------------------------------------------------------------
SankofaPlugins.add(
  'https://github.com/nvim-telescope/telescope.nvim', {
    lazy = true,
    keys = {
      {'<leader>ff'},
      {'<leader>fF'},
      {'<leader>fg'},
    },
    config = function()
      require'smithwebdev.plugins.navigation.telescope'
    end
  }
)

