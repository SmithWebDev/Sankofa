--- Colorschemes Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/the-coding-doggo/batman.nvim", {
    config = function()
      require('smithwebdev.plugins.colorschemes.batman')
      vim.cmd [[colorscheme batman]]
    end
  }
)

SankofaPlugins.add(
  "https://github.com/rebelot/kanagawa.nvim", {
    config = function()
      require 'smithwebdev.plugins.colorschemes.kanagawa'
      -- vim.cmd[[colorscheme kanagawa]]
    end
  }
)

SankofaPlugins.add(
  'https://github.com/pauchiner/pastelnight.nvim', {
    config = function()
      require 'smithwebdev.plugins.colorschemes.pastelnight'
      -- vim.cmd[[colorscheme pastelnight]]
    end
  }
)

SankofaPlugins.add(
  'https://github.com/hyperb1iss/silkcircuit-nvim', {
    lazy = false,
    priority = 1000,
    config = function()
      require 'smithwebdev.plugins.colorschemes.silkcircuit'
      -- vim.cmd[[colorscheme silkcircuit]]
    end
  }
)

SankofaPlugins.add(
  'https://github.com/folke/tokyonight.nvim', {
    config = function()
      require 'smithwebdev.plugins.colorschemes.tokyonight'
      -- vim.cmd[[colorscheme tokyonight]]
      -- vim.cmd [[colorscheme tokyonight-night]]
      -- vim.cmd[[colorscheme tokyonight-storm]]
      -- vim.cmd[[colorscheme tokyonight-day]]
      -- vim.cmd[[colorscheme tokyonight-moon ]]
    end
  }
)

SankofaPlugins.add(
  'https://github.com/ianklapouch/wildberries.nvim', {
    config = function()
      -- vim.cmd[[colorscheme wildberries]]
    end
  }
)

--- Completion & Snippets
--------------------------------------------------------------------------------
SankofaPlugins.add(
  'https://github.com/Saghen/blink.cmp', {
    version = '1.*',
    -- build = 'cargo build --release',
    dependencies = SankofaPlugins.deps_from_urls({
      'https://github.com/L3MON4D3/LuaSnip',
      'https://github.com/honza/vim-snippets',
      'https://github.com/rafamadriz/friendly-snippets'
    }),
    config = function()
      require 'smithwebdev.plugins.completion_snippets.blink_cmp'
    end
  }
)

SankofaPlugins.add(
  'https://github.com/mattn/emmet-vim', {
    init = function()
      vim.g.user_emmet_leader_key = '<Tab>,'
      vim.g.user_emmet_settings = {
        javascript = {
          attribute = {
            { ['for'] = 'htmlFor' },
            { ['class'] = 'className' },
          },
          extends = 'jsx',
          ['erb'] = {
            { extends = 'html' },
          },
        },
        typescript = {
          extends = 'tsx',
        },
        eruby = {
          extends = 'html',
        },
      }
      vim.g.user_emmet_mode = 'inv'
    end
  }
)

SankofaPlugins.add(
  'https://github.com/L3MON4D3/LuaSnip', {
    build = 'make install_jsregexp',
    version = 'v2.*',
    config = function()
      require('smithwebdev.plugins.completion_snippets.luasnip')
    end,
  }
)

--- Functional Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/bngarren/checkmate.nvim", {
    config = function()
      -- require('smithwebdev.plugins.functional.checkmate')
    end
  }
)

SankofaPlugins.add(
  "https://github.com/nvim-zh/colorful-winsep.nvim", {
    config = function ()
      require('smithwebdev.plugins.functional.winsep')
    end
  }
)

SankofaPlugins.add(
  'https://github.com/mluders/comfy-line-numbers.nvim', {
    config = function()
      require 'smithwebdev.plugins.functional.comfy_line_numbers'
    end
  }
)

SankofaPlugins.add(
  "https://github.com/SmithWebDev/mind.nvim", {
    branch = 'Path_Titles',
    dependencies = SankofaPlugins.deps_from_urls("https://github.com/nvim-lua/plenary.nvim"),
    config = function()
      require('smithwebdev.plugins.functional.mind')
    end
  }
)

SankofaPlugins.add(
  'https://github.com/shortcuts/no-neck-pain.nvim', {
    version = "*",
    config = function()
      require 'smithwebdev.plugins.functional.no_neck_pain'
    end
  }
)

SankofaPlugins.add(
  "https://github.com/rcarriga/nvim-notify", {
    config = function ()
      vim.notify = require("notify")
    end
  }
)

SankofaPlugins.add(
  "https://github.com/gosvig123/nvim-codebase-mindmap", {
    -- SankofaPlugins.deps_from_urls("https://github.com/neovim/nvim-lspconfig"),
    config = function ()
      require('smithwebdev.plugins.functional.codebase_mindmap')
    end
  }
)

SankofaPlugins.add(
  "https://github.com/SmithWebDev/nvim-colorizer.lua", {
    config = function()
      require('colorizer').setup()
    end
  }
)

SankofaPlugins.add(
  'https://github.com/nvim-treesitter/nvim-treesitter', {
    build = ":TSUpdate",
    dependencies = SankofaPlugins.deps_from_urls({
      'https://github.com/OXY2DEV/markview.nvim',
      'https://github.com/nvim-treesitter/playground',
      'https://github.com/nvim-treesitter/nvim-treesitter-context',
      'https://github.com/RRethy/nvim-treesitter-endwise',
      'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
      'https://github.com/RRethy/nvim-treesitter-textsubjects',
    }),
    config = function()
      require 'smithwebdev.plugins.functional.treesitter'
    end
  }
)

-- Code runner plugin for neovim written in Lua & Rust. Aims to provide
-- stupidly fast partial code testing for interpreted and compiled languages.
SankofaPlugins.add(
  "https://github.com/michaelb/sniprun", {
    build = "sh install.sh",
  }
)

SankofaPlugins.add(
  "https://github.com/junegunn/vim-easy-align", {
  }
)

SankofaPlugins.add(
  "https://github.com/tpope/vim-surround", {
    config = function()
      require 'smithwebdev.plugins.functional.vim_surround'
    end
  }
)

SankofaPlugins.add(
  'https://github.com/folke/which-key.nvim', {
    config = function()
      require 'smithwebdev.plugins.navigation.which_key'
    end
  }
)

--- Language Server Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/smithwebdev/lsp-lens.nvim", {
    config = function()
      require 'smithwebdev.plugins.lsp.lsp_lens'
    end
  }
)

SankofaPlugins.add(
  "https://github.com/ErichDonGubler/lsp_lines.nvim", {
    config = function ()
      require('smithwebdev.plugins.lsp.lsp_lines')
    end
  }
)

SankofaPlugins.add(
  "https://github.com/williamboman/mason.nvim", {
    event = { "BufReadPre", "BufNewFile" },
    dependencies = SankofaPlugins.deps_from_urls({
      "https://github.com/neovim/nvim-lspconfig",
      "https://github.com/williamboman/mason-lspconfig.nvim",
      "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
    }),
    config = function()
      require 'smithwebdev.plugins.lsp.mason'
    end
  }
)

SankofaPlugins.add(
  "https://github.com/erlingur/vim-rails",{
    dependencies = SankofaPlugins.deps_from_urls({
      "https://github.com/christoomey/vim-rfactory",
      -- "https://github.com/tpope/vim-endwise",
      -- "https://github.com/tpope/vim-dispatch",
      "https://github.com/tpope/vim-bundler",
      -- "https://github.com/tpope/vim-projectionist",
      "https://github.com/SmithWebDev/vim-blockle",
    }),
    config = function()
      require('smithwebdev.plugins.languages.rails')
    end
  }
)

--- Navigation Plugins
--------------------------------------------------------------------------------
SankofaPlugins.add(
  'https://github.com/A7Lavinraj/fyler.nvim', {
    dependencies = SankofaPlugins.deps_from_urls('https://github.com/nvim-mini/mini.icons'),
    keys = {
      { '<leader>fy' },
      { '<leader>e' }
    },
    config = function()
      require 'smithwebdev.plugins.navigation.fyler'
    end
  }
)

SankofaPlugins.add(
  'https://github.com/nvim-telescope/telescope.nvim', {
    lazy = true,
    keys = {
      { '<leader>ff' },
      { '<leader>fF' },
      { '<leader>fg' },
    },
    dependencies = SankofaPlugins.deps_from_urls('https://github.com/nvim-lua/plenary.nvim'),
    config = function()
      require 'smithwebdev.plugins.navigation.telescope'
    end
  }
)

--- Plugin Packages
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/folke/snacks.nvim", {
    config = function()
      require 'smithwebdev.plugins.packages.snacks'
    end
  }
)

--- Terminal Management
--------------------------------------------------------------------------------
SankofaPlugins.add(
  'https://github.com/jaimecgomezz/here.term', {
    config = function()
      require 'smithwebdev.plugins.terminal.here_term'
    end
  }
)

--- TUI Integration
--------------------------------------------------------------------------------
SankofaPlugins.add(
  "https://github.com/ahkohd/difft.nvim", {
    config = function()
      require 'smithwebdev.plugins.terminal.difft'
    end
  }
)

SankofaPlugins.add(
  'https://github.com/kdheepak/lazygit.nvim', {
    keys = { '<leader>gl' },
    lazy = true,
    config = function()
      vim.keymap.set('n', '<leader>gl', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
    end
  }
)

SankofaPlugins.add(
  'https://github.com/nomad/nomad', {
    version = '*',
    build = function()
      ---@type nomad.neovim.build
      local build = require 'nomad.neovim.build'
      build.builders.download_prebuilt():build(build.contexts.lazy())
    end
  }
)
