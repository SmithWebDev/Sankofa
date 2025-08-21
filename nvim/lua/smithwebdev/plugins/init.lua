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
  "https://github.com/Saghen/blink.cmp", {
    dependencies = SankofaPlugins.deps_from_urls({
      -- "https://github.com/honza/vim-snippets"
      -- "https://github.com/rafamadriz/friendly-snippets"
    }),
    version = '1.*',
    config = function()
      require'smithwebdev.plugins.completion_snippets.blink_cmp'
    end
  }
)

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

--- Functional Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/nvim-treesitter/nvim-treesitter",{
    dependencies = SankofaPlugins.deps_from_urls({
      "https://github.com/OXY2DEV/markview.nvim",
      "https://github.com/nvim-treesitter/playground",
      "https://github.com/RRethy/nvim-treesitter-endwise",
      "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
      "https://github.com/RRethy/nvim-treesitter-textsubjects",
    }),
  }
)

SankofaPlugins.add(
  "https://github.com/nvim-neotest/neotest", {
    dependencies = SankofaPlugins.deps_from_urls({
      "https://github.com/nvim-lua/plenary.nvim",
      "https://github.com/nvim-neotest/nvim-nio",
      "https://github.com/antoinemadec/FixCursorHold.nvim",
      "https://github.com/nvim-treesitter/nvim-treesitter",
      "https://github.com/vim-test/vim-test",
      "https://github.com/nvim-neotest/neotest-vim-test",
      "https://github.com/zidhuss/neotest-minitest",
      "https://github.com/olimorris/neotest-rspec",
      "https://github.com/haydenmeade/neotest-jest"
    }),
    config = function ()
      require'smithwebdev.plugins.functional.neotest'
    end
  }
)

SankofaPlugins.add(
  "https://github.com/hasansujon786/nvim-navbuddy", {
    -- name = "navbuddy",
    dependencies = SankofaPlugins.deps_from_urls({
      "https://github.com/neovim/nvim-lspconfig",
      "https://github.com/SmiteshP/nvim-navic",
      "https://github.com/MunifTanjim/nui.nvim",
      "https://github.com/numToStr/Comment.nvim",
      "https://github.com/nvim-telescope/telescope.nvim"
    }),
    config = function ()
      require'smithwebdev.plugins.functionals.navbuddy'
    end
  }
)

SankofaPlugins.add(
  "https://github.com/michaelb/sniprun", {
    build = "sh install.sh",
  }
)

SankofaPlugins.add(
  "https://github.com/markgandolfo/lightswitch.nvim",{
    dependencies = SankofaPlugins.deps_from_urls({
      "https://github.com/MunifTanjim/nui.nvim"
    }),
    config = function()
      require'smithwebdev.plugins.functionals.lightswitch'
    end
  }
)

--- Language Server Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/mason-org/mason.nvim",{
    dependencies = SankofaPlugins.deps_from_urls({
      "https://github.com/mason-org/mason-lspconfig.nvim",
      "https://github.com/neovim/nvim-lspconfig"
    }),
    config = function()
      require'smithwebdev.plugins.lsp'
    end
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
      require'smithwebdev.plugins.navigation.which_key'
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

--- Programming Language Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/OXY2DEV/helpview.nvim", {
    dependencies = SankofaPlugins.deps_from_urls({
      "https://github.com/nvim-treesitter/nvim-treesitter"
    })
  }
)

SankofaPlugins.add(
  "https://github.com/OXY2DEV/markview.nvim",{
    config = function ()
      require'smithwebdev.plugins.languages.markview'
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
