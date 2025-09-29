--- Colorschemes Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/rebelot/kanagawa.nvim", {
    config = function()
      require'smithwebdev.plugins.colorschemes.kanagawa'
      -- vim.cmd[[colorscheme kanagawa]]
    end
  }
)

SankofaPlugins.add(
  'https://github.com/pauchiner/pastelnight.nvim', {
    config = function()
      require'smithwebdev.plugins.colorschemes.pastelnight'
      -- vim.cmd[[colorscheme pastelnight]]
    end
  }
)

SankofaPlugins.add(
  'https://github.com/hyperb1iss/silkcircuit-nvim', {
    lazy = false,
    priority = 1000,
    config = function()
      require'smithwebdev.plugins.colorschemes.silkcircuit'
      -- vim.cmd[[colorscheme silkcircuit]]
    end
  }
)

SankofaPlugins.add(
  'https://github.com/folke/tokyonight.nvim', {
    config = function()
      require'smithwebdev.plugins.colorschemes.tokyonight'
      -- vim.cmd[[colorscheme tokyonight]]
      vim.cmd[[colorscheme tokyonight-night]]
      -- vim.cmd[[colorscheme tokyonight-storm]]
      -- vim.cmd[[colorscheme tokyonight-day]]
      -- vim.cmd[[colorscheme tokyonight-moon ]]
    end
  }
)

SankofaPlugins.add(
  'https://github.com/V4N1LLA-1CE/xcodedark.nvim', {
    config = function()
      require'smithwebdev.plugins.colorschemes.xcodedark'
    end
  }
)

--- Functional Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  'https://github.com/mluders/comfy-line-numbers.nvim', {
    config = function ()
      require'smithwebdev.plugins.functional.comfy_line_numbers'
    end
  }
)

--- Navigation Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  'https://github.com/A7Lavinraj/fyler.nvim', {
    dependencies = SankofaPlugins.deps_from_urls({
      'https://github.com/nvim-mini/mini.icons'
    }),
    keys = {
      {'<leader>fy'},
      {'<leader>e'}
    },
    config = function()
      require'smithwebdev.plugins.navigation.fyler'
    end
  }
)

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

--- Terminal Management
--------------------------------------------------------------------------------
SankofaPlugins.add(
  'https://github.com/jaimecgomezz/here.term', {
    config = function()
      require'smithwebdev.plugins.terminal.here_term'
    end
  }
)

--- TUI Integration
--------------------------------------------------------------------------------
SankofaPlugins.add(
  'https://github.com/kdheepak/lazygit.nvim', {
    keys = { '<leader>gl' },
    lazy = true,
    config = function()
      vim.keymap.set('n', '<leader>gl', '<cmd>LazyGit<cr>', {desc = 'LazyGit'})
    end
  }
)

