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
