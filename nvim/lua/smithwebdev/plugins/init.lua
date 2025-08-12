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

--- Completion & Snippets
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/mattn/emmet-vim", {
    init = function()
      vim.g.user_emmet_leader_key = "<Tab>,"
      vim.g.user_emmet_settings = {
        javascript = {
          attribute = {
            { ["for"] = "htmlFor" },
            { ["class"] = "className" },
          },
          extends = "jsx",
          ["erb"] = {
            { extends = "html" },
          },
        },
        typescript = {
          extends = "tsx",
        },
        eruby = {
          extends = "html",
        },
      }
      vim.g.user_emmet_mode = "inv"
    end
  }
)

SankofaPlugins.add(
  "https://github.com/L3MON4D3/LuaSnip", {
    build = "make install_jsregexp",
    version = "v2.*",
    config = function()
      require("smithwebdev.plugins.completion_snippets.luasnip")
    end,
  }
)

--- Navigation Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add("https://github.com/mawkler/demicolon.nvim")

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

SankofaPlugins.add(
  "https://github.com/nvim-telescope/telescope.nvim", {
    lazy = true,
    keys = {
      {"<leader>ff"},
      {"<leader>fF"},
      {"<leader>fg"},
    },
    config = function()
      require'smithwebdev.plugins.navigation.telescope'
    end
  }
)

SankofaPlugins.add(
  "https://github.com/folke/which-key.nvim", {
    config = function()
      require'which-key'.setup()
    end
  }
)

--- Plugin Packages
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/folke/snacks.nvim", {
    config = function()
      require'smithwebdev.plugins.packages.snacks'
    end
  }
)

--- Terminal Management
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/jaimecgomezz/here.term", {
    config = function()
      require'smithwebdev.plugins.terminal.here_term'
    end
  }
)


--- TUI Integration
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/kdheepak/lazygit.nvim", {
    keys = { "<leader>gl" },
    lazy = true,
    config = function()
      vim.keymap.set('n', '<leader>gl', "<cmd>LazyGit<cr>", {desc = 'LazyGit'})
    end
  }
)


SankofaPlugins.add("")
-- https://github.com/folke/snacks.nvim
