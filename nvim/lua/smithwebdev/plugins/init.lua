--- Colorschemes Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/pauchiner/pastelnight.nvim", {
    lazy = true,
    priority = 1000,
    config = function()
      require"smithwebdev.plugins.colorschemes.pastelnight"
    end
  }
)

SankofaPlugins.add(
  "https://github.com/folke/tokyonight.nvim", {
    lazy = true,
    priority = 1000,
    config = function()
      require"smithwebdev.plugins.colorschemes.tokyonight"
    end
  }
)

SankofaPlugins.add(
  "https://github.com/numToStr/Sakura.nvim", {
    lazy = true,
    priority = 1000,
  }
)

SankofaPlugins.add(
  "https://github.com/hyperb1iss/silkcircuit-nvim",{
    priority = 1000,
    config = function()
      require"smithwebdev.plugins.colorschemes.silkcircuit"
      vim.cmd[[colorscheme silkcircuit]]
    end
  }
)

SankofaPlugins.add(
  "https://github.com/V4N1LLA-1CE/xcodedark.nvim", {
    lazy = true,
    priority = 1000,
    config = function()
      require'smithwebdev.plugins.colorschemes.xcodedark'
    end
  }
)

--- Navigation Plugins
SankofaPlugins.add("https://github.com/nvim-telescope/telescope.nvim", {
  keys = {
    {"<leader>ff"},
    {"<leader>fF"},
    {"<leader>fg"},
  },
  config = function()
    require'smithwebdev.plugins.navigation.telescope'
  end
})
SankofaPlugins.add(
  "https://github.com/A7Lavinraj/fyler.nvim", {
    dependencies = SankofaPlugins.deps_from_urls({
      "https://github.com/nvim-tree/nvim-web-devicons" 
    }),
    keys = {
      {"<leader>fy"},
      {"<leader>e"}
    },
    config = function()
      require'smithwebdev.plugins.navigation.fyler'
    end
  }
)

--- TUI Integration
SankofaPlugins.add("https://github.com/kdheepak/lazygit.nvim", {
  keys = { "<leader>gl" },
  config = function()
    vim.keymap.set('n', '<leader>gl', "<cmd>LazyGit<cr>", {desc = 'LazyGit'})
  end
})
